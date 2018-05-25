`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 19:45:56
// Module Name: Dynamic_seg_display_tb
// Description: 数码管动态扫描显示控制模块测试文件
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10   //100M时钟信号

module Dynamic_seg_display_tb();
       reg  clk;                  //时钟信号
       reg  rst;                  //复位信号
       reg  [15:0]data_display;   //16位待显示数据显示（4个BCD码）
       wire [6:0]segments;        //数码管段码
       wire [3:0]wei_sel;         //数码管位码
       
       //例化测试模块
       Dynamic_seg_display Dynamic_seg_display_test(
               .clk(clk),                   //时钟信号
               .rst(rst),                   //复位信号
              .data_display(data_display),  //16位待显示数据显示（4个BCD码）
               .segments(segments),         //数码管段码
              .wei_sel(wei_sel)             //数码管位码
           );
      //产生100M时钟信号
      initial   clk = 1;
      always #(`clk_period/2)   clk = ~clk;
      
      //开始测试
      initial begin
            rst = 1;
            data_display = 16'h4321;    //数码管上显示"1234"
      #(`clk_period * 2);
            rst = 0;
      #(`clk_period * 50 * 5);         //计50次数刷新一下，观察5次
            $stop;
      end
endmodule
