`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2020 09:40:04 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb(

    );
    
    reg clk_in;
    wire clk_out;
    integer k = 0;
    
    clock_divider uut(
    .clk_in (clk_in),
    .clk_out (clk_out)
    );
    
    initial begin
        clk_in = 0;
    end
    
    // generate the clock square wave
    initial begin
        for(k = 0; k < 100; k = k + 1) begin
            clk_in = ~clk_in;
			
			// delay 5 ns which is half the period of a 100MHz wave
			#5;
        end
        
        $finish;
	end
    
endmodule
