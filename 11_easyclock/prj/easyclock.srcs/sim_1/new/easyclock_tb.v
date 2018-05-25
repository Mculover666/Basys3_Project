`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 20:53:32
// Module Name: easyclock_tb
// Description: 测试模块：简易数字钟：按1hz的频率从0000-9999显示
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10       //100M时钟
module easyclock_tb();
      reg  clk;                   //时钟信号输入
      reg  rst;                   //复位信号输入
      wire [6:0]segments;         //数码管段码
      wire [3:0]wei_sel;          //数码管位码   
      
      //例化测试模块
      easyclock easyclock_test(
          .clk(clk),                   //时钟信号输入
          .rst(rst),                   //复位信号输入
          .segments(segments),         //数码管段码
          .wei_sel(wei_sel)            //数码管位码
          );
      
      //产生100M时钟
      initial clk = 1;
      always #(`clk_period / 2) clk = ~clk;
      
      //开始测试
      initial begin
            rst = 1;    //系统复位
      # (`clk_period * 2);
            rst = 0;
      # (`clk_period * 50 * 100);
            $stop;
      end

endmodule
