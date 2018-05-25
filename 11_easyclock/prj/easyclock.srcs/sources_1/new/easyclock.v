`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 20:32:51
// Module Name: easyclock
// Description: ���������ӣ���1hz��Ƶ�ʴ�0000-9999��ʾ
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** ����ʱ�������弶��֤ʱע�� ***/
module easyclock(
    input clk,                   //ʱ���ź�����
    input rst,                   //��λ�ź�����
    output [6:0]segments,        //����ܶ���
    output [3:0]wei_sel          //�����λ��

    );
   `ifdef SIMULATION      //���������
        parameter   CNT_MAX = 26'd49;
    `else                  //�弶��֤�����
        parameter   CNT_MAX = 26'd49_999_999;
    `endif   
       
        reg  clk_1hz;               //1hzʱ���ź�
        reg  [25:0]cnt;                   //�����������Ĵ���(���ڷ�Ƶ��)
        wire [15:0]data_display;    //����ʾ����
    
    //������
    always@(posedge clk,posedge rst)
        if(rst)
             cnt <= 0;
        else  if(cnt == CNT_MAX)
             cnt <= 0;
        else
             cnt <= cnt + 1'b1;
    //����1hz�ź�
     always@(posedge clk,posedge rst)
       if(rst)
           clk_1hz <= 0;
       else if(cnt == CNT_MAX)
           clk_1hz <= ~clk_1hz;    //ÿ����50_000_000��ʱ�����ڣ�500ms��������źŷ�תһ��
       else
            clk_1hz <=  clk_1hz;
    
    //����4��BCD������
    BCDcounter_top BCDcounter_top0(
           .clk(clk_1hz),             /** ��ΪBCD��Ҫ��1hz������������Ҫһ��1hzʱ���ź� **/
           .rst(rst),           //��λ�ź�����
           .cin(1'b1),          //��λ�ź�����
           .cout(),             //��λ�ź����
           .q(data_display)     //BCD�����
        );
    //��������ܶ�̬ɨ����ʾ����ģ��
    Dynamic_seg_display Dynamic_seg_display0(
            .clk(clk),                      //ʱ���ź�
            .rst(rst),                     //��λ�ź�
            .data_display(data_display),   //16λ����ʾ������ʾ��4��BCD�룩
            .segments(segments),           //����ܶ���
            .wei_sel(wei_sel)              //�����λ��
        );
     
endmodule
