`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2015 14:55:54
// Design Name: 
// Module Name: 8_Decoding_the_world
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


module 8_Decoding_the_world(
    input   [1:0]     SEG_SELECT_IN, // Deciding which slot on the display to use
    input   [3:0]     BIN_IN, // the switches in
    input             DOT_IN,
    output  [3:0]     SEG_SELECT_OUT,
    output  [7:0]     HEX_OUT // output for the seven segment
    );
        wire A, B, C, D;
        
        assign B = BIN_IN[0];
        assign A = BIN_IN[1];
        assign D = BIN_IN[2];
        assign C = BIN_IN[3];
        
        
        // Minimized logic of 4-bit input to 8-bit  7-segment display  output
        // Assignment for CA
        assign HEX_OUT[0] = ((~A)&B&(~C)&(~D)) | ((~A)&(~B)&(~C)&D) | ((~A)&B&C&D) | (A&B&C&(~D));
        // Assignment for CB
        assign HEX_OUT[1] = ((A&(~B)&D) | (A&B&C) | ((~A)&B&(~C)&D) | ((~A)&(~B)&C&D) );
        // Assignment for CC
        assign HEX_OUT[2] = ((A&C&D) | (A&(~B)&(~C)&(~D)) | ((~A)&(~B)&(C)&(D)) );
        // Assignment for CD
        assign HEX_OUT[3] = ((A&B&D) | ((~A)&B&(~D)) | ((~A)&(~B)&(~C)&D) | (A&(~B)&C&(~D)) ); 
        // Assignment for CE
        assign HEX_OUT[4] = ((B&(~C)&(~D)) | ((~A)&(~C)&D) | ((~B)&(~C)&D) | ((~A)&B&C&(~D)) );
        // Assignment for CF
        assign HEX_OUT[5] = ((B&(~C)&(~D)) | (A&(~C)&(~D)) | (A&B&(~C)) | ((~A)&B&C&D) );
        // Assignment for CG
        assign HEX_OUT[6] = (((~A)&(~C)&(~D)) | (A&B&(~C)&D) | ((~A)&(~B)&C&D) );
        // The last segment is the dot on the right hand side of the number 
        assign HEX_OUT[7] = DOT_IN;
        
        
        always@(SEG_SELECT_IN)begin
            case(SEG_SELECT_IN)
                2'b00   :   SEG_SELECT_OUT <= 4'b1110;
                2'b01   :   SEG_SELECT_OUT <= 4'b1101;
                2'b10   :   SEG_SELECT_OUT <= 4'b1011;
                2'b11   :   SEG_SELECT_OUT <= 4'b0111;
                default :   SEG_SELECT_OUT <= 4'b1111;
             endcase
        end
                
        
        
        
    
    
endmodule
