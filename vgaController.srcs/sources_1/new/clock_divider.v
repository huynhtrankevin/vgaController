`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2020 03:54:19 PM
// Design Name: 
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The Basys 3 board has a 100MHz oscillator.  Get the scale factor by dividing 100MHz by the desired frequency
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clk_in,
    output reg clk_out
    );
    
    reg [7:0] BASYS3_CLK_FREQ = 100;
    reg [7:0] VGA_FREQ = 25;
    reg [7:0] scale_factor;
    reg [7:0] count;
    
    initial begin
        clk_out = 0;
        count = 0;
        scale_factor = (BASYS3_CLK_FREQ/VGA_FREQ)/2;  
    end

    always @(posedge clk_in) begin
        count = count + 1;
        if (count >= scale_factor) begin
            count = 0;
            clk_out = ~clk_out; 
        end
    end    
endmodule
