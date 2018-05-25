`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:07:24
// Description:�����
// Module Name: half_adder 
//////////////////////////////////////////////////////////////////////////////////


module half_adder(
    input  a,
    input  b,
    output out,     //������
    output cout     //��λ���
    );
    //��������
    assign out  = a ^ b;
    assign cout = a & b;
    
endmodule
