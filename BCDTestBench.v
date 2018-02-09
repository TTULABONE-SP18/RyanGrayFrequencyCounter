`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 08:52:10 PM
// Design Name: 
// Module Name: BCDTestBench
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


module BCDTestBench( );

    reg [13:0] freq; // input frequnecy

    wire [3:0] thous; // thousandths place of output frequency 
    wire [3:0] hunds; // hundredths place
    wire [3:0] tens; //  tenths place
    wire [3:0] ones; //  ones place
    
    BCD UUT(.freq(freq),.thous(thous),.hunds(hunds),.tens(tens),.ones(ones));
    
    initial begin
       
            freq = 105;
       end 

endmodule
