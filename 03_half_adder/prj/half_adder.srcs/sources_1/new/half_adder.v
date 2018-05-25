`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 20:07:24
// Description:半加器
// Module Name: half_adder 
//////////////////////////////////////////////////////////////////////////////////


module half_adder(
    input  a,
    input  b,
    output out,     //结果输出
    output cout     //进位输出
    );
    //功能描述
    assign out  = a ^ b;
    assign cout = a & b;
    
endmodule
