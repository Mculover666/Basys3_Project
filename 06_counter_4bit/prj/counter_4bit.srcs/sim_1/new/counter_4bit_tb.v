`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 19:43:53
// Module Name: counter_4bit_tb 
// Description: 4bit������ģ������ļ�
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 20   //�궨��ʱ������  
module counter_4bit_tb();
    
    reg     clk;    //���ڲ���ʱ���ź�
    reg     rst;    //���ڲ�����λ�ź�
    reg     en;     //���ڲ���ʹ���ź�
    wire    [3:0]q; //����������ֵ���

    //��������ģ��
  counter_4bit counter_4bit_test(
       .clk(clk),          //ϵͳʱ���ź�
       .rst(rst),            //ϵͳ��λ����
       .en(en),            //������ʹ�ܶ�
       .q(q)               //����������ֵ���
        );
     
     //��ʼ����
     //����ʱ���ź�
     initial clk = 1;
     always #(`clk_period/2)  clk = ~clk;         //clkÿ5ns��תһ�Σ�����100Mʱ���ź�
     
     initial begin
            rst = 1;    en = 0;
        #(`clk_period * 5 + 1 );   
            rst = 0;
        #(`clk_period * 5);
            en = 1;
        #(`clk_period *20);     //��Ϊ4bit����16��clk�����㣬������ʱ20��ʱ������
            $stop;
      end
endmodule
