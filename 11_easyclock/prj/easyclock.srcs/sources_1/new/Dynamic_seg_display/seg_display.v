`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 10:34:57
// Module Name: seg_display
// Description: �������ʾģ�飬��һ����ʾ������ģ��decoder_display��һ��2-4������decoder2_4���ɣ�
//////////////////////////////////////////////////////////////////////////////////////////////////
module seg_display(
    input       [3:0]data_display,      //����ܴ���ʾ����
    input       [1:0]wei,               //ѡ����һλ��ʾ
    output      [6:0]segments,           //����ܶ���
    output      [3:0]wei_sel             //�����λ��
    );
    //��������
    //������ʾ����ģ��
    decoder_display decoder_display_0(
        .data_in(data_display),
        .segments(segments)
        );
    //����λѡģ��
    decoder2_4 decoder2_4_0(
        .data_in(wei),
        .wei_sel(wei_sel)
        );
endmodule

//�������ʾ����ģ��
//note:ֻ����7λ���룬������С�������
module decoder_display(
    input       [3:0]data_in,
    output  reg [6:0]segments
    );
    //��ʾ���빦������
    always@(*)
        case(data_in)
            //��Ӧ��                  abc_defg
            4'h0:       segments = 7'b000_0001;
            4'h1:       segments = 7'b100_1111;
            4'h2:       segments = 7'b001_0010;
            4'h3:       segments = 7'b000_0110;
            4'h4:       segments = 7'b100_1100;
            4'h5:       segments = 7'b010_0100;
            4'h6:       segments = 7'b010_0000;
            4'h7:       segments = 7'b000_1111;
            4'h8:       segments = 7'b000_0000;
            4'h9:       segments = 7'b000_1100;
            4'hA:       segments = 7'b000_1000;
            4'hB:       segments = 7'b110_0000;
            4'hC:       segments = 7'b011_0001;
            4'hD:       segments = 7'b100_0010;
            4'hE:       segments = 7'b011_0000;
            4'hF:       segments = 7'b011_1000;
            default:    segments = 7'b111_1111;
        endcase
endmodule

module decoder2_4(
    input        [1:0]data_in,
    output  reg [3:0]wei_sel  //4λ�����ѡ��λ
    );
    //λѡ2-4��������������
    always@(*)
        case(data_in)
            //��Ӧλ
            4'h0:       wei_sel  = 4'b1110;
            4'h1:       wei_sel  = 4'b1101;
            4'h2:       wei_sel  = 4'b1011;
            4'h3:       wei_sel  = 4'b0111;
            default:    wei_sel = 4'b1111;
        endcase
endmodule
