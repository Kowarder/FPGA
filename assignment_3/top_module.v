`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 02:54:14 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [6:0] display,
    output Cout
    );
    wire [3:0] sum;
    projevt_4 fulladder(A[3:0], B[3:0], Cin, sum[3:0], Cout);
    seven_seg sevenseg(sum[3:0], display[6:0]);
    
endmodule
