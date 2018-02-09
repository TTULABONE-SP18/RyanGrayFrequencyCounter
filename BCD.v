`timescale 1ns / 1ps

// convert the input frequency to bcd
module BCD(freq,thous,hunds,tens,ones);
    input [15:0] freq; // input frequnecy

    output [3:0] thous; // thousandths place of output frequency 
    output [3:0] hunds; // hundredths place
    output [3:0] tens; //  tenths place
    output [3:0] ones; //  ones place
    
   
    integer i; 
    
    reg [3:0] thous_temp; // thousandths place of input frequency 
    reg [3:0] hunds_temp; // hundredths place
    reg [3:0] tens_temp; //  tenths place
    reg [3:0] ones_temp; //  ones place
    
    always @(freq)
    begin 
        thous_temp=0; // thousandths place of input frequency 
        hunds_temp=0; // hundredths place
        tens_temp=0; //  tenths place
        ones_temp=0; //  ones place
        
        for (i=0; i <= 15; i = i+1)
        // add 3 to every place (more than)/(equal to) 5
        begin
            if (thous_temp > 4)
                thous_temp <= thous_temp + 3;
            if (hunds_temp > 4)
                hunds_temp <= hunds_temp + 3;
            if (tens_temp > 4)
                tens_temp <= tens_temp + 3;
            if (ones_temp > 4)
                ones_temp <= ones_temp + 3;
                
            // then shift every bit to the left one
            thous_temp = thous_temp << 1;
                thous_temp[0] = hunds_temp[3];
            hunds_temp = hunds_temp << 1;
                hunds_temp[0] = tens_temp[3];
            tens_temp = tens_temp << 1;
                tens_temp[0] = ones_temp[3];
            ones_temp = ones_temp << 1;
                ones_temp[0] = freq[i];
        end
    end
    
    assign thous = thous_temp;
    assign hunds = hunds_temp;
    assign tens = tens_temp;
    assign ones = ones_temp;
    
endmodule