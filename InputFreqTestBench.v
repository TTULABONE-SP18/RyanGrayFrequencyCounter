`timescale 1ns / 1ps

module InputFreqTestBench();

    reg clk; // clock signal
    reg Infreq; // input frequency 

    wire [15:0] freq; // frequency we'll be reading in
    
    InputFreq UUT(clk,Infreq,freq);
    
        initial begin
            clk = 0;
            Infreq = 0;
            
        end
        
    always begin
    #10 clk = ~clk;
    end
    
    always begin
    #1000000 Infreq = ~Infreq;
    end
    
endmodule