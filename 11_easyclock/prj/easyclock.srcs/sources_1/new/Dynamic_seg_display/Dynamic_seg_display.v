`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 18:07:32
// Module Name: Dynamic_seg_display 
// Description: 4λ����ܶ�̬ɨ����ʾ
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** ����ʱ�������弶��֤ʱע�� ***/
module Dynamic_seg_display(
        input  clk,                  //ʱ���ź�
        input  rst,                  //��λ�ź�
        input  [15:0]data_display,   //16λ����ʾ������ʾ��4��BCD�룩
        output [6:0]segments,        //����ܶ���
        output [3:0]wei_sel          //�����λ��
    );
      `ifdef SIMULATION      //���������            
       parameter   CNT_MAX = 26'd30; //
    `else                  //�弶��֤�����
       parameter   CNT_MAX = 26'd99_999;
    `endif   
      
    reg [22:0]cnt;                //������ֵ4_999_999,��Ҫ23λ������
    reg [1:0]wei;                 //ѡ����һλ��ʾ
    wire [3:0]data_display_temp;  //��ʾ�źŴ���
  
   //��������������
   always@(posedge clk,posedge rst)
       if(rst)
           cnt <= 0;
       else if(cnt == CNT_MAX)
           cnt <= 0;
       else
           cnt <= cnt + 1'b1;
  
   //��������ܶ�̬ɨ����ʾ(ÿ��1ms��һ��ˢ�¶�ѡ��λѡ)
   always@(posedge clk,posedge rst)
       if(rst)
           wei <= 2'b00;
       else if(cnt == CNT_MAX)
           wei <= wei + 1'b1;    //ÿ����100_000��ʱ�����ڣ�1ms��,λѡ��һ���л���һλ
       else
           wei <=  wei;
    //������ѡһ��·����ѡ��������һλ��ʾ�����ź�
             mux4 mux4_1(
                 .sel(wei),
                 .data_in(data_display),
                 .data_out(data_display_temp)        
                 );
   //�������������ģ��
   seg_display seg_display0(
              .data_display(data_display_temp),      //����ܴ���ʾ����
              .wei(wei),               //ѡ����һλ��ʾ
               .segments(segments),           //����ܶ���
               .wei_sel(wei_sel)             //�����λ��
               );
            
   
endmodule
    //��ѡһ��·��
module mux4(
    input        [1:0]sel,
    input        [15:0]data_in,
    output reg   [3:0]data_out        
    );
    always@(*)
        case(sel)
            //��Ӧλ
            4'h0:       data_out  = data_in[3:0];
            4'h1:       data_out  = data_in[7:4];
            4'h2:       data_out  = data_in[11:8];
            4'h3:       data_out  = data_in[15:12];
            default:    data_out  = 4'bz;
        endcase
endmodule

