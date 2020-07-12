`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2020 10:26:16 AM
// Design Name: 
// Module Name: vga_controller_tb
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


module vga_controller_tb(

    );
    
    wire V_SYNC;
    wire H_SYNC;
    wire in_video_region;
    wire [11:0] xpos;
    wire [11:0] ypos;
    reg pixel_clk;
    
    vga_controller vga640x480(
    .vsync(V_SYNC),
    .hsync(H_SYNC),
    .in_video_region(in_video_region),
    .xpos(xpos),
    .ypos(ypos),
    .pixel_clk(pixel_clk)
    );
    
    initial begin
        pixel_clk = 0;
        
        forever begin
            pixel_clk <= ~ pixel_clk ;
            #5; // 100MHz -> T = 10ns, switch every 5 ns
        end
        
    end
    
    
endmodule
