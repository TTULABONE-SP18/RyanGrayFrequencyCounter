`timescale 1ns / 1ps

module InputFreq(clk,Infreq,freq);
    input clk; // clock signal
    input Infreq; // input signal 

    output wire [15:0] freq; // frequency of signal we read in
    
    (* keep = "true" *)reg [31:0] counter = 0;
    (* keep = "true" *)reg [15:0] freq_temp = 0; 
    (* keep = "true" *)reg edge_check = 0; 
    
    always @(posedge clk)
    begin
    
            if (counter <= 100000000)
              begin
                counter = counter + 1;                 
                
                  if (!edge_check & Infreq)
                  begin
                        freq_temp <= freq_temp + 1;
                  end
               end 
            else
                begin
                      counter <= 0; 
                      freq_temp <= 0; 
                 end    
                 
             edge_check = Infreq;     
    end
    
    assign freq = freq_temp + freq_temp;
    
endmodule
