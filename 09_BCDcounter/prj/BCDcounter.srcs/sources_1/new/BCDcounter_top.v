`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: BCDcounter_top
// Description: 4个4bit计数器进行级联，实现计数最大值为9999
//////////////////////////////////////////////////////////////////////////////////

module BCDcounter_top(
        input clk,          //时钟信号输入
        input rst,          //复位信号输入
        input cin,          //进位信号输入
        output cout,        //进位信号输出
        output [15:0]q      //BCD码输出
    );
    
    wire cout0,cout1,cout2;     //4个BCD计数器级联之间连接线
    wire [3:0]q0,q1,q2,q3;      //每个BCD计数器的输出
    
    assign q = {q3,q2,q1,q0};   //拼接成16位输出
    
    //例化4个BCD计数器
    BCDcounter BCDcounter0(
        .clk(clk),        //时钟信号输入
        .rst(rst),        //复位信号输入
        .cin(cin),        //进位信号输入
        .cout(cout0),     //进位信号输出
        .q(q0)             //4bitBCD码输出 
        );
    BCDcounter BCDcounter1(
        .clk(clk),    //时钟信号输入
        .rst(rst),    //复位信号输入
        .cin(cout0),  //进位信号输入
        .cout(cout1), //进位信号输出
        .q(q1)         //4bitBCD码输出 
            );
    BCDcounter BCDcounter2(
        .clk(clk), //时钟信号输入
        .rst(rst),        //复位信号输入
              .cin(cout1),        //进位信号输入
              .cout(cout2),      //进位信号输出
              .q(q2)             //4bitBCD码输出 
                );
    BCDcounter BCDcounter3(
              .clk(clk),        //时钟信号输入
              .rst(rst),        //复位信号输入
              .cin(cout2),        //进位信号输入
              .cout(cout),      //进位信号输出
              .q(q3)             //4bitBCD码输出 
               );
endmodule
