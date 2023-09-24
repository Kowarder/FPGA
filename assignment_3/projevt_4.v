`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 01:37:55 PM
// Design Name: 
// Module Name: projevt_4
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


module projevt_4(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
wire [3:0] Co;
full_adder fulladder1(A[0], B[0], Cin, S[0], Co[0]);
full_adder fulladder2(A[1], B[1], Co[0], S[1], Co[1]);
full_adder fulladder3(A[2], B[2], Co[1], S[2], Co[2]);
full_adder fulladder4(A[3], B[3], Co[2], S[3], Cout);


endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

assign S = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule

