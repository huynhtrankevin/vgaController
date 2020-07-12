`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kevin Huynh-Tran 
// 
// Create Date: 07/02/2020 10:14:56 PM
// Design Name: 
// Module Name: vga_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module implements a VGA controller 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_controller(
    output wire vsync,
    output wire hsync,
    output wire in_video_region,
    output wire [11:0] xpos,
    output wire [11:0] ypos,
    input pixel_clk
    );
    
    localparam HNUM_PIXELS = 640;
    localparam HFP = 16;
    localparam HBP = 48;
    localparam HSYNC_WIDTH = 96;
    localparam HTOTAL = 800;
    
    localparam VNUM_LINES = 480;
    localparam VFP = 10;
    localparam VBP = 33;
    localparam VSYNC_WIDTH = 2;
    localparam VTOTAL = 525;
    
    // left side of sync
    localparam HSYNC_L = HNUM_PIXELS + HBP;
    // right side of sync
    localparam HSYNC_R = HSYNC_L + HSYNC_WIDTH - 1;
    
    // left side of sync
    localparam VSYNC_L = VNUM_LINES + VBP;
    
    // right side of sync
    localparam VSYNC_R = VSYNC_L + VSYNC_WIDTH - 1;
    
    
    reg [3:0] STATE_VIDEO = 0;
    reg [3:0] STATE_BLANK = 1;
    reg [3:0] STATE_HSYNC = 2;
    reg [3:0] STATE_VSYNC = 3;
    
    reg [11:0] pixel_count;
    reg [11:0] line_count;
    
    initial begin
        pixel_count = 0;
        line_count = 0;
    end
    always @(posedge pixel_clk) begin
        pixel_count = pixel_count + 1;
        
        if (pixel_count >= HTOTAL) begin
            pixel_count = 0;
            line_count = line_count + 1;
            
            if (line_count >= VTOTAL) begin
                line_count = 0;
            end
                
        end 
        
    end
    
    assign in_video_region = (pixel_count < HNUM_PIXELS) && (line_count < VNUM_LINES);
    assign xpos = (in_video_region) ? pixel_count : 0;
    assign ypos = (in_video_region) ? line_count : 0;
    assign hsync = (pixel_count >= HSYNC_L && pixel_count <= HSYNC_R);
    assign vsync = (line_count >= VSYNC_L && line_count <= VSYNC_R);
    
endmodule
