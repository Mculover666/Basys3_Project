`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 14:03:00
// Module Name: shiftled_tb 
// Description: shiftledģ������ļ�
//////////////////////////////////////////////////////////////////////////////////
`define clk_period  10      //100Mʱ���ź�
module shiftled_tb();
    reg   clk;         //ʱ���ź�����
    reg   rst;         //��λ�ź�����
    reg   en;          //ʹ�ܶ�����
    wire  [15:0]led;   //16���û�led

    //��������ģ��
    shiftled shiftled_test(
            .clk(clk),        //ʱ���ź�����
            .rst(rst),        //��λ�ź�����
            .en(en),         //ʹ�ܶ�����
            .led(led)   //16���û�led
        );
    
    //����ʱ���ź�
    initial clk = 1;
    always #(`clk_period / 2)   clk = ~clk;
    
    //��ʼ����
    initial begin
            rst = 1;    //ϵͳ��λ
            en  = 0;
        #(`clk_period * 5);     //��ʱ5��clk
            rst = 0;
        #(`clk_period * 5);     //��ʱ5��clk
            en  = 1;    //ʹ�ܼ�����
        #(`clk_period * 50 * 20);    //��Ϊ������Ҫ����50��clk���ܹ��۲���λ20��
            $stop;    
    end
endmodule
