`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2018/05/23 16:02:11
// Module Name: BCDcounter
// Description: BCD计数器
//////////////////////////////////////////////////////////////////////////////////
module BCDcounter(
    input   clk,    //时钟信号输入
    input   rst,    //复位信号输入
    input   cin,    //进位信号输入
    output  cout,   //进位信号输出
    output  [3:0]q  //4bitBCD码输出 
    );
   reg  [3:0]cnt;   //计数器最大值为9，所以需要4bit计数器    
   
   //BCD计数器计数功能描述
   always@(posedge clk,posedge rst)
        if(rst)
            cnt <= 0;
        else if(cin)begin
            if(cnt == 4'd9)
                cnt <= 0;
            else
                cnt <= cnt + 1'b1;
        end
    
   assign cout = cin && (cnt == 4'd9);      /** 此处不能使用时序逻辑，需要在计满9的时候同步输出cout信号，然后在下次清零是cout恢复为0 **/
    
   assign q = cnt;      //BCD计数值输出
                 
endmodule
