`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:12:23
// Design Name: 半加器测试仿真文件
// Module Name: half_adder_tb 
//////////////////////////////////////////////////////////////////////////////////

module half_adder_tb();
    reg a;
    reg b;
    wire out;
    wire cout;
    
    //例化测试模块
    half_adder half_adder_test(
        .a(a),
        .b(b),
        .out(out),     //结果输出
        .cout(cout)     //进位输出
        );
    //开始测试
    initial begin
        a = 0;  b = 0;
        #100;
        a = 0;  b = 1;
        #100;
        a = 1;  b = 0;
        #100;
        a = 1;  b = 1;
        #100;
        $stop;
        end 
endmodule
