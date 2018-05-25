`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/22 10:34:57
// Module Name: seg_display
// Description: 数码管显示模块，由一个显示译码器模块decoder_display和一个2-4译码器decoder2_4构成；
//////////////////////////////////////////////////////////////////////////////////////////////////
module seg_display(
    input       [3:0]data_display,      //数码管待显示数据
    input       [1:0]wei,               //选择哪一位显示
    output      [6:0]segments,           //数码管段码
    output      [3:0]wei_sel             //数码管位码
    );
    //功能描述
    //例化显示译码模块
    decoder_display decoder_display_0(
        .data_in(data_display),
        .segments(segments)
        );
    //例化位选模块
    decoder2_4 decoder2_4_0(
        .data_in(wei),
        .wei_sel(wei_sel)
        );
endmodule

//数码管显示译码模块
//note:只包含7位段码，不包括小数点控制
module decoder_display(
    input       [3:0]data_in,
    output  reg [6:0]segments
    );
    //显示译码功能描述
    always@(*)
        case(data_in)
            //对应段                  abc_defg
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
    output  reg [3:0]wei_sel  //4位数码管选中位
    );
    //位选2-4译码器功能描述
    always@(*)
        case(data_in)
            //对应位
            4'h0:       wei_sel  = 4'b1110;
            4'h1:       wei_sel  = 4'b1101;
            4'h2:       wei_sel  = 4'b1011;
            4'h3:       wei_sel  = 4'b0111;
            default:    wei_sel = 4'b1111;
        endcase
endmodule
