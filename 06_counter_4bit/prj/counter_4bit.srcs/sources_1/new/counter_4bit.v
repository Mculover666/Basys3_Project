`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 19:31:05
// Module Name: counter_4bit
// Description: 4bit�첽��λͬ��ʹ�ܶ����Ƽ�����
//////////////////////////////////////////////////////////////////////////////////

module counter_4bit(
    input    clk,            //ϵͳʱ���ź�
    input    rst,            //ϵͳ��λ����
    input    en,             //������ʹ�ܶ�
    output   reg [3:0]q     //����������ֵ���
    );
    always@(posedge clk,posedge rst)
    if(rst)
        q <= 0;
    else if(en)
        q <= q + 1'b1;         //��������һ
 
endmodule
