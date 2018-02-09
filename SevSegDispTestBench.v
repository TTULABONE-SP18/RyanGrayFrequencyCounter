`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2018 10:30:04 AM
// Design Name: 
// Module Name: SevSegDispTestBench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SevSegDispTestBench();

   reg clk, reset;
   reg [15:0] BCDfreq; // input frequnecy converted from a BCD
   wire a, b, c, d, e, f, g, dp; // individual segments 
   wire [3:0] enable; // 4 bit enable signal 
   
   SevenSegDisplay UUT(clk,reset,BCDfreq,a,b,c,d,e,f,g,dp,enable);
   
   
   initial begin
        
        clk = 0;
        reset = 0;
        BCDfreq = 0;
        #50;
        BCDfreq = 16'b0000000100000101;
        
   end 
   
   always begin
   #5 clk = ~clk;
   end


endmodule
