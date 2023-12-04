`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:36:04 PM
// Design Name: 
// Module Name: project_final
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


module project_final(
    input D, K, S, B,
    output reg A
    );
    
    always@(D or K or S or B) begin
        case({D,K,S,B})
            4'b0000: A = 1'b0;
            4'b0001: A = 1'b0;
            4'b0010: A = 1'b0;
            4'b0011: A = 1'b0;
            4'b0100: A = 1'b1;
            4'b0101: A = 1'b1;
            4'b0110: A = 1'b1;
            4'b0111: A = 1'b1;
            4'b1000: A = 1'b0;
            4'b1001: A = 1'b0;
            4'b1010: A = 1'b0;
            4'b1011: A = 1'b0;
            4'b1100: A = 1'b1;
            4'b1101: A = 1'b0;
            4'b1110: A = 1'b1;
            4'b1111: A = 1'b0;
            default: A = 1'b0;
        endcase
     end
endmodule
