`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 19:43:53
// Module Name: counter_4bit_tb 
// Description: 4bit计数器模块测试文件
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 20   //宏定义时钟周期  
module counter_4bit_tb();
    
    reg     clk;    //用于产生时钟信号
    reg     rst;    //用于产生复位信号
    reg     en;     //用于产生使能信号
    wire    [3:0]q; //计数器计数值输出

    //例化测试模块
  counter_4bit counter_4bit_test(
       .clk(clk),          //系统时钟信号
       .rst(rst),            //系统复位按键
       .en(en),            //计数器使能端
       .q(q)               //计数器计数值输出
        );
     
     //开始测试
     //生成时钟信号
     initial clk = 1;
     always #(`clk_period/2)  clk = ~clk;         //clk每5ns翻转一次，产生100M时钟信号
     
     initial begin
            rst = 1;    en = 0;
        #(`clk_period * 5 + 1 );   
            rst = 0;
        #(`clk_period * 5);
            en = 1;
        #(`clk_period *20);     //因为4bit计数16个clk就清零，所以延时20个时钟周期
            $stop;
      end
endmodule
