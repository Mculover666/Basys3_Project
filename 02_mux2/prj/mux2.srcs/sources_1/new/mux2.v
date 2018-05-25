`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/21 18:16:07
// Design Name: 
// Module Name: mux2
//////////////////////////////////////////////////////////////////////////////////


module mux2(
   input  a,
   input  b,
   input  sel,
   output c
    );
    
    assign c = sel?b:a;     //二选一多路器功能实现
    
endmodule
