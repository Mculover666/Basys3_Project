`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: flashled_tb
// Description: flashledģ������ļ�
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10   //100Mʱ���ź�
module flashled_tb();
    reg clk;          //���ڲ���ʱ���ź�
    reg rst;          //���ڲ�����λ�ź�
    reg en;           //���ڲ���ʹ���ź�
    wire [15:0]led;   //�۲�led���
    
    //��������ģ��
    flashled flashled_test(
        .clk(clk),          //ʱ���ź�����
        .rst(rst),          //��λ�ź�����
        .en(en),           //ʹ���ź�����
        .led(led)           //led�ź����
        );
    
    //����ʱ���ź�
    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    //��ʼ����
    initial begin
        rst = 1;                 //��λ;
        en  = 0;
    #(`clk_period * 5);
         rst = 0;
    #(`clk_period * 5);   
          en = 1;                //ʹ��
    #(`clk_period * 50 * 5 );   //��������¼�����ÿ��50�η�ת������Ӧ����ʱ50 * 5��ʱ���ܴι۲췭ת���
          $stop;      
   end
     
endmodule