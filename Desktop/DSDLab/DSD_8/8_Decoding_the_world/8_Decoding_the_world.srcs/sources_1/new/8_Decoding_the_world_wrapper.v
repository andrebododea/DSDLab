`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2015 20:18:18
// Design Name: 
// Module Name: 8_Decoding_the_world_wrapper
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


module 8_Decoding_the_world_wrapper(
    input [3:0] switches,
    input [7:0] hex_out,
    input [3:0] seg_select_out
    );
    
    8_Decoding_the_world_wrapper sevSeg(
    .SEG_SELECT_IN(2'b00),
    .BIN_IN(switches), // the switches in
    .DOT_IN(1'b0),
    .SEG_SELECT_OUT(segSelectOut),
    .HEX_OUT(hex_out)// output for the seven segment
    );
    
endmodule
