`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:31:25
// Module Name: adder_tb
// Description: adderģ����Է����ļ�
//////////////////////////////////////////////////////////////////////////////////

module adder_tb();
    reg  a;
    reg  b;
    reg  cin;
    wire out;
    wire cout;
    
    //��������ģ��
    adder adder_test(
        .a(a),
        .b(b),
        .cin(cin),   //��λ����
        .out(out),   //������
        .cout(cout)  //��λ���
        );
    //��ʼ����
    initial begin
                a = 0;  b = 0;  cin = 0;
        #100;   a = 0;  b = 1;  cin = 0;
        #100;   a = 1;  b = 0;  cin = 0;
        #100;   a = 1;  b = 1;  cin = 0;
        #100;   a = 0;  b = 0;  cin = 1;
        #100;   a = 0;  b = 1;  cin = 1;
        #100;   a = 1;  b = 0;  cin = 1;
        #100;   a = 1;  b = 1;  cin = 1;
        #100;   $stop;
    end 
endmodule
