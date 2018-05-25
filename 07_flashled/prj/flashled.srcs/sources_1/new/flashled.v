`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 20:32:26
// Module Name: flashled 
// Description: ����һ��ʱ���źţ���LED�ư�1hz��Ƶ����˸
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** ����ʱ�������弶��֤ʱע�� ***/
module flashled(
    input clk,          //ʱ���ź�����
    input rst,          //��λ�ź�����
    input en,           //ʹ���ź�����
    output [15:0]led    //led�ź����
    );
    
     
     `ifdef SIMULATION      //���������
        parameter   CNT_MAX = 26'd49;
     `else                  //�弶��֤�����
        parameter   CNT_MAX = 26'd49_999_999;
     `endif   
       
    reg [25:0]cnt;      //������ֵ49_999_999
    reg [15:0]led_clk;  //�������led��1hz�ź�
   
    //��������������
    always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(en)begin
            if(cnt == CNT_MAX)
                cnt <= 0;
            else
                cnt <= cnt + 1'b1;
        end
    
    //����1hz�ź�
    always@(posedge clk,posedge rst)
        if(rst)
            led_clk <= 0;
        else if(cnt == CNT_MAX)
            led_clk <= ~led_clk;    //ÿ����50_000_000��ʱ�����ڣ�500ms��������źŷ�תһ��
        else
            led_clk <=  led_clk;
    
    //��1hz�ź������led
    assign led = led_clk;
 
endmodule
