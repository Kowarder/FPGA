`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 01:45:25 PM
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
    input[3:0] A,
    input[3:0] B,
    input Cin,
    input sel,
    output [6:0] display
    );
    wire Cout;
    wire [3:0] sum;
    wire [3:0] show;
    project5 adder(A[3:0], B[3:0], Cin, sum[3:0], Cout);
    mux2to1 mux(sum[3:0], Cout, sel, show[3:0]);
    seven_seg led(show[3:0], display[6:0]);
    
endmodule
