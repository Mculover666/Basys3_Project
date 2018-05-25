`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 20:53:32
// Module Name: easyclock_tb
// Description: ����ģ�飺���������ӣ���1hz��Ƶ�ʴ�0000-9999��ʾ
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10       //100Mʱ��
module easyclock_tb();
      reg  clk;                   //ʱ���ź�����
      reg  rst;                   //��λ�ź�����
      wire [6:0]segments;         //����ܶ���
      wire [3:0]wei_sel;          //�����λ��   
      
      //��������ģ��
      easyclock easyclock_test(
          .clk(clk),                   //ʱ���ź�����
          .rst(rst),                   //��λ�ź�����
          .segments(segments),         //����ܶ���
          .wei_sel(wei_sel)            //�����λ��
          );
      
      //����100Mʱ��
      initial clk = 1;
      always #(`clk_period / 2) clk = ~clk;
      
      //��ʼ����
      initial begin
            rst = 1;    //ϵͳ��λ
      # (`clk_period * 2);
            rst = 0;
      # (`clk_period * 50 * 100);
            $stop;
      end

endmodule
