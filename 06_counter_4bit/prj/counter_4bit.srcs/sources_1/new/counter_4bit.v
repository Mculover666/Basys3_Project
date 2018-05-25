`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 19:31:05
// Module Name: counter_4bit
// Description: 4bit异步复位同步使能二进制计数器
//////////////////////////////////////////////////////////////////////////////////

module counter_4bit(
    input    clk,            //系统时钟信号
    input    rst,            //系统复位按键
    input    en,             //计数器使能端
    output   reg [3:0]q     //计数器计数值输出
    );
    always@(posedge clk,posedge rst)
    if(rst)
        q <= 0;
    else if(en)
        q <= q + 1'b1;         //计数器加一
 
endmodule
