`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:12:23
// Design Name: ��������Է����ļ�
// Module Name: half_adder_tb 
//////////////////////////////////////////////////////////////////////////////////

module half_adder_tb();
    reg a;
    reg b;
    wire out;
    wire cout;
    
    //��������ģ��
    half_adder half_adder_test(
        .a(a),
        .b(b),
        .out(out),     //������
        .cout(cout)     //��λ���
        );
    //��ʼ����
    initial begin
        a = 0;  b = 0;
        #100;
        a = 0;  b = 1;
        #100;
        a = 1;  b = 0;
        #100;
        a = 1;  b = 1;
        #100;
        $stop;
        end 
endmodule
