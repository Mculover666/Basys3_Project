`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Create Date: 2018/05/23 13:02:47
// Module Name: shiftled
// Description: 16��LED��1hz��Ƶ��ѭ������
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      //�弶��֤ʱע�ͣ�����ʱȡ��ע��

module shiftled(
        input   clk,        //ʱ���ź�����
        input   rst,        //��λ�ź�����
        input   en,         //ʹ�ܶ�����
        output  [15:0]led   //16���û�led
    );
    reg [15:0]led_temp;   //led�������
    //��������
    reg [25:0]cnt;  //�����������Ĵ���
    `ifdef  SIMULATION
        parameter   CNT_MAX = 26'd49;
    `else   
        parameter   CNT_MAX = 26'd49_999_999;
    `endif
    always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(en)begin
                if(cnt == CNT_MAX)
                    cnt <= 0;
                 else
                    cnt <= cnt + 1'b1;
        end
    
    //��λ�Ĵ�����������
    always@(posedge clk,posedge rst)
        if(rst)
            led_temp <= 26'h0001;
        else if(cnt == CNT_MAX)
              led_temp <= {led_temp[14:0],led_temp[15]};      //ѭ������
        else
              led_temp <= led_temp;
     //�����led
     assign led = led_temp;
     
endmodule
