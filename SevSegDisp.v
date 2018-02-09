`timescale 1ns / 1ps

module SevenSegDisplay(
   input clk, reset, Infreq,
   
   output a, b, c, d, e, f, g, dp, // individual segments 
   output [3:0] enable // 4 bit enable signal 
   
);
    
    localparam B = 21; // 18-bits for refesh rate(2^16) and toggling of displays (bits 17 and 16)
    
    (* keep = "true" *)reg [B-1:0] count = 0;
    wire [15:0] freq;
    wire [3:0] thous,hunds, tens, ones; 
    
    InputFreq InputFreq(clk,Infreq,freq); // finds the input frequency 
        
    
    BCD BCD(freq,thous,hunds,tens,ones); // converts input frequency to BCD

    always @(posedge clk)
    begin
        if (reset)
           count <= 0;
        else
           count <= count + 1;
    end
    
    reg [6:0]sseg; // register for holding a number pattern in bits
    reg [3:0]enable_temp = 0; //register for the 4 bit enable
     
    always @ (*)
     begin
      case(count[B-1:B-2]) //using only the 2 MSB's of the counter 
        
       2'b00 :  //When the 2 MSB's are 00 enable the fourth display
        begin
         sseg = ones;
         enable_temp = 4'b1110;
        end
        
       2'b01:  //When the 2 MSB's are 01 enable the third display
        begin
         sseg = tens;
         enable_temp = 4'b1101;
        end
        
       2'b10:  //When the 2 MSB's are 10 enable the second display
        begin
         sseg = hunds;
         enable_temp = 4'b1011;
        end
         
       2'b11:  //When the 2 MSB's are 11 enable the first display
        begin
         sseg = thous;
         enable_temp = 4'b0111;
        end
      endcase
     end
     
     assign enable = enable_temp; 
     
    reg [6:0] sseg_temp; // 7 bit register to hold the binary value of each input given
     
    always @ (*)
     begin
      case(sseg)
       4'b0000 : sseg_temp = 7'b1000000; //to display 0
       4'b0001 : sseg_temp = 7'b1111001; //to display 1
       4'b0010 : sseg_temp = 7'b0100100; //to display 2
       4'b0011 : sseg_temp = 7'b0110000; //to display 3
       4'b0100 : sseg_temp = 7'b0011001; //to display 4
       4'b0101 : sseg_temp = 7'b0010010; //to display 5
       4'b0110 : sseg_temp = 7'b0000010; //to display 6
       4'b0111 : sseg_temp = 7'b1111000; //to display 7
       4'b1000 : sseg_temp = 7'b0000000; //to display 8
       4'b1001 : sseg_temp = 7'b0010000; //to display 9
       default : sseg_temp = 7'b1000000;
      endcase
     end
    assign {g, f, e, d, c, b, a} = sseg_temp; //concatenate the outputs to the register, this is just a more neat way of doing this.
     
    assign dp = 1'b1; //since the decimal point is not needed, all 4 of them are turned off

endmodule

