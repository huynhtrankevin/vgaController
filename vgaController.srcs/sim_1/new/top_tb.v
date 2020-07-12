`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2020 09:45:47 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    parameter CLK = 1;
    reg clk;
    
    wire HSYNC;
    wire VSYNC;
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    
    initial begin
        clk = 0;
    end
    
    top uut(
        .CLK (clk),
        .VGA_HS_O (HSYNC),
        .VGA_VS_O (VSYNC),
        .VGA_R (VGA_R),
        .VGA_G (VGA_G),
        .VGA_B (VGA_B)
        );
    
    initial begin
  	forever begin
  		clk <= ~ clk ;
  		#5; // 100MHz -> T = 10ns, switch every 5 ns
  	end
  end
  
endmodule
