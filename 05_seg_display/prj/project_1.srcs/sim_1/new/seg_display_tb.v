`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 11:09:36
// Module Name: seg_display_tb
// Description: �������ʾģ��seg_display����ģ��
//////////////////////////////////////////////////////////////////////////////////\

module seg_display_tb();
    reg       [3:0]data_display;      //����ܴ���ʾ����
    reg       [1:0]wei;               //ѡ����һλ��ʾ
    wire      [6:0]segments;          //����ܶ���
    wire      [3:0]wei_sel;           //�����λ��
    
    //��������ģ��
    seg_display seg_display_test(
        .data_display(data_display),   //����ܴ���ʾ����
        .wei(wei),                     //ѡ����һλ��ʾ
        .segments(segments),           //����ܶ���
        .wei_sel(wei_sel)              //�����λ��
        );
    //��ʼ����
    initial begin
            wei = 2'h0;             //ѡ�е�һλ��ʾ0-F
            data_display = 4'h0;    //��ʾ"0"
      #10; data_display = 4'h1;    //��ʾ"1"
      #10; data_display = 4'h2;    //��ʾ"2"
      #10; data_display = 4'h3;    //��ʾ"3"
      #10; data_display = 4'h4;    //��ʾ"4"
      #10; data_display = 4'h5;    //��ʾ"5"
      #10; data_display = 4'h6;    //��ʾ"6"
      #10; data_display = 4'h7;    //��ʾ"7"
      #10; data_display = 4'h8;    //��ʾ"8"
      #10; data_display = 4'h9;    //��ʾ"9" 
      #10; data_display = 4'ha;    //��ʾ"A"
      #10; data_display = 4'hb;    //��ʾ"b"
      #10; data_display = 4'hc;    //��ʾ"C"
      #10; data_display = 4'hd;    //��ʾ"d"
      #10; data_display = 4'he;    //��ʾ"E"
      #10; data_display = 4'hf;    //��ʾ"F"
     
      #10; wei = 2'h1;             //ѡ�еڶ�λ��ʾ"F"
      #10; wei = 2'h2;             //ѡ�е���λ��ʾ"F"
      #10; wei = 2'h3;             //ѡ�е���λ��ʾ"F" 
      
      #100; $stop;                 //����ֹͣ     
    end
    
endmodule
