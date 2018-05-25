`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:27:08
// Module Name: adder
// Description: 1bitȫ����
//////////////////////////////////////////////////////////////////////////////////
module adder(
    input  a,
    input  b,
    input  cin,  //��λ����
    output out,  //������
    output cout  //��λ���
    );
    //��������
    assign out  = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
