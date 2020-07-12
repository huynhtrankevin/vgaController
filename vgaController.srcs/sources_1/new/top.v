`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2020 09:05:06 AM
// Design Name: 
// Module Name: top
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


module top(
    input CLK,
    output VGA_HS_O,
    output VGA_VS_O,
    output wire  [3:0] VGA_R,
    output wire  [3:0] VGA_G,
    output wire  [3:0] VGA_B
    );
    
    wire in_video_region;
    wire pixel_clk;
    
    wire [11:0] xpos;
    wire [11:0] ypos;
    
   
    clock_divider clk_divider(
        .clk_in (CLK),
        .clk_out (pixel_clk)
    );
    
    vga_controller vga640x480(
        .vsync (VGA_VS_O),
        .hsync (VGA_HS_O),
        .in_video_region (in_video_region),
        .xpos (xpos),
        .ypos (ypos),
        .pixel_clk (pixel_clk)
        );
      
      assign VGA_R = (in_video_region) ?  ((xpos <= 50 && ypos <= 50) ? 4'b1111 : 4'b0000) : 4'b0000;
      assign VGA_G = (in_video_region) ? 4'b0000 : 4'b0000;
      assign VGA_B = (in_video_region) ? 4'b0000 : 4'b0000;
endmodule
