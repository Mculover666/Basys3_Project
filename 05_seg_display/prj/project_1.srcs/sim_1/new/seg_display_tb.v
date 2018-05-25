`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 11:09:36
// Module Name: seg_display_tb
// Description: 数码管显示模块seg_display测试模块
//////////////////////////////////////////////////////////////////////////////////\

module seg_display_tb();
    reg       [3:0]data_display;      //数码管待显示数据
    reg       [1:0]wei;               //选择哪一位显示
    wire      [6:0]segments;          //数码管段码
    wire      [3:0]wei_sel;           //数码管位码
    
    //例化测试模块
    seg_display seg_display_test(
        .data_display(data_display),   //数码管待显示数据
        .wei(wei),                     //选择哪一位显示
        .segments(segments),           //数码管段码
        .wei_sel(wei_sel)              //数码管位码
        );
    //开始测试
    initial begin
            wei = 2'h0;             //选中第一位显示0-F
            data_display = 4'h0;    //显示"0"
      #10; data_display = 4'h1;    //显示"1"
      #10; data_display = 4'h2;    //显示"2"
      #10; data_display = 4'h3;    //显示"3"
      #10; data_display = 4'h4;    //显示"4"
      #10; data_display = 4'h5;    //显示"5"
      #10; data_display = 4'h6;    //显示"6"
      #10; data_display = 4'h7;    //显示"7"
      #10; data_display = 4'h8;    //显示"8"
      #10; data_display = 4'h9;    //显示"9" 
      #10; data_display = 4'ha;    //显示"A"
      #10; data_display = 4'hb;    //显示"b"
      #10; data_display = 4'hc;    //显示"C"
      #10; data_display = 4'hd;    //显示"d"
      #10; data_display = 4'he;    //显示"E"
      #10; data_display = 4'hf;    //显示"F"
     
      #10; wei = 2'h1;             //选中第二位显示"F"
      #10; wei = 2'h2;             //选中第三位显示"F"
      #10; wei = 2'h3;             //选中第四位显示"F" 
      
      #100; $stop;                 //测试停止     
    end
    
endmodule
