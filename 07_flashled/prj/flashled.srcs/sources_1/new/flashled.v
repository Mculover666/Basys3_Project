`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 20:32:26
// Module Name: flashled 
// Description: 产生一个时钟信号，让LED灯按1hz的频率闪烁
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** 仿真时保留，板级验证时注释 ***/
module flashled(
    input clk,          //时钟信号输入
    input rst,          //复位信号输入
    input en,           //使能信号输入
    output [15:0]led    //led信号输出
    );
    
     
     `ifdef SIMULATION      //仿真情况下
        parameter   CNT_MAX = 26'd49;
     `else                  //板级验证情况下
        parameter   CNT_MAX = 26'd49_999_999;
     `endif   
       
    reg [25:0]cnt;      //最大计数值49_999_999
    reg [15:0]led_clk;  //输出驱动led的1hz信号
   
    //计数器功能描述
    always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(en)begin
            if(cnt == CNT_MAX)
                cnt <= 0;
            else
                cnt <= cnt + 1'b1;
        end
    
    //产生1hz信号
    always@(posedge clk,posedge rst)
        if(rst)
            led_clk <= 0;
        else if(cnt == CNT_MAX)
            led_clk <= ~led_clk;    //每计满50_000_000个时钟周期（500ms），输出信号翻转一下
        else
            led_clk <=  led_clk;
    
    //经1hz信号输出到led
    assign led = led_clk;
 
endmodule
