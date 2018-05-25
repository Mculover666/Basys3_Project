`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 18:07:32
// Module Name: Dynamic_seg_display 
// Description: 4位数码管动态扫描显示
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION      /*** 仿真时保留，板级验证时注释 ***/
module Dynamic_seg_display(
        input  clk,                  //时钟信号
        input  rst,                  //复位信号
        input  [15:0]data_display,   //16位待显示数据显示（4个BCD码）
        output [6:0]segments,        //数码管段码
        output [3:0]wei_sel          //数码管位码
    );
      `ifdef SIMULATION      //仿真情况下            
       parameter   CNT_MAX = 26'd30; //
    `else                  //板级验证情况下
       parameter   CNT_MAX = 26'd99_999;
    `endif   
      
    reg [22:0]cnt;                //最大计数值4_999_999,需要23位计数器
    reg [1:0]wei;                 //选择哪一位显示
    wire [3:0]data_display_temp;  //显示信号传输
  
   //计数器功能描述
   always@(posedge clk,posedge rst)
       if(rst)
           cnt <= 0;
       else if(cnt == CNT_MAX)
           cnt <= 0;
       else
           cnt <= cnt + 1'b1;
  
   //控制数码管动态扫描显示(每隔1ms加一，刷新段选和位选)
   always@(posedge clk,posedge rst)
       if(rst)
           wei <= 2'b00;
       else if(cnt == CNT_MAX)
           wei <= wei + 1'b1;    //每计满100_000个时钟周期（1ms）,位选加一，切换下一位
       else
           wei <=  wei;
    //例化四选一多路器，选择输入哪一位显示段码信号
             mux4 mux4_1(
                 .sel(wei),
                 .data_in(data_display),
                 .data_out(data_display_temp)        
                 );
   //例化数码管译码模块
   seg_display seg_display0(
              .data_display(data_display_temp),      //数码管待显示数据
              .wei(wei),               //选择哪一位显示
               .segments(segments),           //数码管段码
               .wei_sel(wei_sel)             //数码管位码
               );
            
   
endmodule
    //四选一多路器
module mux4(
    input        [1:0]sel,
    input        [15:0]data_in,
    output reg   [3:0]data_out        
    );
    always@(*)
        case(sel)
            //对应位
            4'h0:       data_out  = data_in[3:0];
            4'h1:       data_out  = data_in[7:4];
            4'h2:       data_out  = data_in[11:8];
            4'h3:       data_out  = data_in[15:12];
            default:    data_out  = 4'bz;
        endcase
endmodule

