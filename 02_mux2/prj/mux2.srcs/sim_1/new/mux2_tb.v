`timescale 1ns / 1ps
module mux2_tb();
    
    reg a;
    reg b;
    reg sel;
    wire c;
    
    //��������ģ��
    mux2 mu2_test(
       .a(a),
       .b(b),
       .sel(sel),
       .c(c)
        );
    
    initial begin
        a = 0;  b = 0;  sel = 0;
        #100;   //��ʱ100ns��ʱ�䲽��ǰ���һ�д����Ѿ�����Ϊ1ns�� 
        a = 0;  b = 0;  sel = 1;
        #100;
        a = 0;  b = 1;  sel = 0;
        #100;
        a = 0;  b = 1;  sel = 1;
        #100;
        a = 1;  b = 0;  sel = 0;
        #100;
        a = 1;  b = 0;  sel = 1;
        #100;
        a = 1;  b = 1;  sel = 0;
        #100;
        a = 1;  b = 1;  sel = 1;
        #100;
        $stop;
        end    
endmodule
