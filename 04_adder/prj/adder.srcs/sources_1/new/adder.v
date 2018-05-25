`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:27:08
// Module Name: adder
// Description: 1bit全加器
//////////////////////////////////////////////////////////////////////////////////
module adder(
    input  a,
    input  b,
    input  cin,  //进位输入
    output out,  //结果输出
    output cout  //进位输出
    );
    //功能描述
    assign out  = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
