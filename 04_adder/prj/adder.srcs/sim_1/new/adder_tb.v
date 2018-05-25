`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:31:25
// Module Name: adder_tb
// Description: adder模块测试仿真文件
//////////////////////////////////////////////////////////////////////////////////

module adder_tb();
    reg  a;
    reg  b;
    reg  cin;
    wire out;
    wire cout;
    
    //例化测试模块
    adder adder_test(
        .a(a),
        .b(b),
        .cin(cin),   //进位输入
        .out(out),   //结果输出
        .cout(cout)  //进位输出
        );
    //开始测试
    initial begin
                a = 0;  b = 0;  cin = 0;
        #100;   a = 0;  b = 1;  cin = 0;
        #100;   a = 1;  b = 0;  cin = 0;
        #100;   a = 1;  b = 1;  cin = 0;
        #100;   a = 0;  b = 0;  cin = 1;
        #100;   a = 0;  b = 1;  cin = 1;
        #100;   a = 1;  b = 0;  cin = 1;
        #100;   a = 1;  b = 1;  cin = 1;
        #100;   $stop;
    end 
endmodule
