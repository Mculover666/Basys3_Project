`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 20:32:51
// Module Name: easyclock
// Description: 简易数字钟：按1hz的频率从0000-9999显示
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** 仿真时保留，板级验证时注释 ***/
module easyclock(
    input clk,                   //时钟信号输入
    input rst,                   //复位信号输入
    output [6:0]segments,        //数码管段码
    output [3:0]wei_sel          //数码管位码

    );
   `ifdef SIMULATION      //仿真情况下
        parameter   CNT_MAX = 26'd49;
    `else                  //板级验证情况下
        parameter   CNT_MAX = 26'd49_999_999;
    `endif   
       
        reg  clk_1hz;               //1hz时钟信号
        reg  [25:0]cnt;                   //计数器计数寄存起(用于分频器)
        wire [15:0]data_display;    //待显示数据
    
    //计数器
    always@(posedge clk,posedge rst)
        if(rst)
             cnt <= 0;
        else  if(cnt == CNT_MAX)
             cnt <= 0;
        else
             cnt <= cnt + 1'b1;
    //产生1hz信号
     always@(posedge clk,posedge rst)
       if(rst)
           clk_1hz <= 0;
       else if(cnt == CNT_MAX)
           clk_1hz <= ~clk_1hz;    //每计满50_000_000个时钟周期（500ms），输出信号翻转一下
       else
            clk_1hz <=  clk_1hz;
    
    //例化4个BCD计数器
    BCDcounter_top BCDcounter_top0(
           .clk(clk_1hz),             /** 因为BCD需要按1hz计数，所以需要一个1hz时钟信号 **/
           .rst(rst),           //复位信号输入
           .cin(1'b1),          //进位信号输入
           .cout(),             //进位信号输出
           .q(data_display)     //BCD码输出
        );
    //例化数码管动态扫描显示控制模块
    Dynamic_seg_display Dynamic_seg_display0(
            .clk(clk),                      //时钟信号
            .rst(rst),                     //复位信号
            .data_display(data_display),   //16位待显示数据显示（4个BCD码）
            .segments(segments),           //数码管段码
            .wei_sel(wei_sel)              //数码管位码
        );
     
endmodule
