`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: flashled_tb
// Description: flashled模块测试文件
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10   //100M时钟信号
module flashled_tb();
    reg clk;          //用于产生时钟信号
    reg rst;          //用于产生复位信号
    reg en;           //用于产生使能信号
    wire [15:0]led;   //观察led输出
    
    //例化测试模块
    flashled flashled_test(
        .clk(clk),          //时钟信号输入
        .rst(rst),          //复位信号输入
        .en(en),           //使能信号输入
        .led(led)           //led信号输出
        );
    
    //产生时钟信号
    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    //开始测试
    initial begin
        rst = 1;                 //复位;
        en  = 0;
    #(`clk_period * 5);
         rst = 0;
    #(`clk_period * 5);   
          en = 1;                //使能
    #(`clk_period * 50 * 5 );   //仿真情况下计数器每计50次翻转，所以应该延时50 * 5个时钟周次观察翻转情况
          $stop;      
   end
     
endmodule