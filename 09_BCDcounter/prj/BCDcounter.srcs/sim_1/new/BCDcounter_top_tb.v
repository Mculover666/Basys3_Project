`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: BCDcounter_top_tb
// Description: �ĸ�BCD��������������
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10   //100Mʱ���ź�
module BCDcounter_top_tb();
    reg   clk;    //ʱ���ź�����
    reg   rst;    //��λ�ź�����
    reg   cin;    //��λ�ź�����
    wire  cout;   //��λ�ź����
    wire  [15:0]q;  //4bitBCD����� 
 
    //��������ģ��
    BCDcounter_top BCDcounter_test(
        .clk(clk),     //ʱ���ź�����
        .rst(rst),      //��λ�ź�����
        .cin(cin),     //��λ�ź�����
        .cout(cout),   //��λ�ź����
        .q(q)          //4bitBCD����� 
    );
    //����100Mʱ���ź�
    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
 
    //��ʼ����
    initial begin
         rst = 1;             //��λ
         cin = 0;             //�޽�λ
    #(`clk_period * 2);
        rst = 0;    
    #(`clk_period * 2);
        cin = 1;              //������λ����������ʼ����
    #(`clk_period * 10000 + 10);   //1��clk��һ�������ܹ���10000�Σ�������ʱclk�۲첨��
        $stop;
end    

endmodule
