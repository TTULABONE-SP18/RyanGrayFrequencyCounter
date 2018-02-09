`timescale 1ps / 1ps

module MainTestBench();

   reg clk, reset, Infreq;
   
   wire a, b, c, d, e, f, g, dp; // individual segments 
   wire [3:0] enable; // 4 bit enable signal 
    
    SevenSegDisplay UUT(clk,reset,Infreq,a,b,c,d,e,f,g,dp,enable);
    
        initial begin
            clk = 0;
            Infreq = 1;
            reset = 0;
            #10;
        end
        
    always begin
    #10 clk = ~clk;
    end
    
    always begin
    #15 Infreq = ~Infreq;
    end
    
endmodule