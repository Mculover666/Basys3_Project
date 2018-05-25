`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Create Date: 2018/05/23 13:02:47
// Module Name: shiftled
// Description: 16个LED以1hz的频率循环左移
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      //板级验证时注释，仿真时取消注释

module shiftled(
        input   clk,        //时钟信号输入
        input   rst,        //复位信号输入
        input   en,         //使能端输入
        output  [15:0]led   //16个用户led
    );
    reg [15:0]led_temp;   //led输出缓存
    //功能描述
    reg [25:0]cnt;  //计数器计数寄存器
    `ifdef  SIMULATION
        parameter   CNT_MAX = 26'd49;
    `else   
        parameter   CNT_MAX = 26'd49_999_999;
    `endif
    always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(en)begin
                if(cnt == CNT_MAX)
                    cnt <= 0;
                 else
                    cnt <= cnt + 1'b1;
        end
    
    //移位寄存器功能描述
    always@(posedge clk,posedge rst)
        if(rst)
            led_temp <= 26'h0001;
        else if(cnt == CNT_MAX)
              led_temp <= {led_temp[14:0],led_temp[15]};      //循环左移
        else
              led_temp <= led_temp;
     //输出到led
     assign led = led_temp;
     
endmodule
