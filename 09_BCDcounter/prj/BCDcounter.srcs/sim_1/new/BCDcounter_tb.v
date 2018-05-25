`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 16:51:14
// Module Name: BCDcounter_tb
// Description: BCDcounter模块测试文件
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10   //100M时钟信号
module BCDcounter_tb();
   reg   clk;    //时钟信号输入
   reg   rst;    //复位信号输入
   reg   cin;    //进位信号输入
   wire  cout;   //进位信号输出
   wire  [3:0]q;  //4bitBCD码输出 
    
   //例化测试模块
   BCDcounter BCDcounter_test(
       .clk(clk),     //时钟信号输入
      .rst(rst),      //复位信号输入
       .cin(cin),     //进位信号输入
       .cout(cout),   //进位信号输出
       .q(q)          //4bitBCD码输出 
       );
   //产生100M时钟信号
    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    //开始测试
    initial begin
        rst = 1;    //复位
        cin = 0;    //无进位
    #(`clk_period * 2);
        rst = 0;    
    #(`clk_period * 2);
        cin = 1;    //产生进位，计数器开始计数
    #(`clk_period * 15);      //1个clk计一次数，总共计10次，所以延时15个clk观察波形
        $stop;
   end
 
endmodule
