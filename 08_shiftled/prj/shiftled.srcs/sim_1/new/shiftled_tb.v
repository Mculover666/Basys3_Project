`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 14:03:00
// Module Name: shiftled_tb 
// Description: shiftled模块测试文件
//////////////////////////////////////////////////////////////////////////////////
`define clk_period  10      //100M时钟信号
module shiftled_tb();
    reg   clk;         //时钟信号输入
    reg   rst;         //复位信号输入
    reg   en;          //使能端输入
    wire  [15:0]led;   //16个用户led

    //例化测试模块
    shiftled shiftled_test(
            .clk(clk),        //时钟信号输入
            .rst(rst),        //复位信号输入
            .en(en),         //使能端输入
            .led(led)   //16个用户led
        );
    
    //产生时钟信号
    initial clk = 1;
    always #(`clk_period / 2)   clk = ~clk;
    
    //开始测试
    initial begin
            rst = 1;    //系统复位
            en  = 0;
        #(`clk_period * 5);     //延时5个clk
            rst = 0;
        #(`clk_period * 5);     //延时5个clk
            en  = 1;    //使能计数器
        #(`clk_period * 50 * 20);    //因为计数器要计满50个clk，总共观察移位20次
            $stop;    
    end
endmodule
