`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 16:02:11
// Module Name: BCDcounter
// Description: BCD������
//////////////////////////////////////////////////////////////////////////////////
module BCDcounter(
    input   clk,    //ʱ���ź�����
    input   rst,    //��λ�ź�����
    input   cin,    //��λ�ź�����
    output  cout,   //��λ�ź����
    output  [3:0]q  //4bitBCD����� 
    );
   reg  [3:0]cnt;   //���������ֵΪ9��������Ҫ4bit������    
   
   //BCD������������������
   always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(cin)begin
            if(cnt == 4'd9)
                cnt <= 0;
            else
                cnt <= cnt + 1'b1;
        end
    
   assign cout = cin && (cnt == 4'd9);      /** �˴�����ʹ��ʱ���߼�����Ҫ�ڼ���9��ʱ��ͬ�����cout�źţ�Ȼ�����´�������cout�ָ�Ϊ0 **/
    
   assign q = cnt;      //BCD����ֵ���
                 
endmodule
