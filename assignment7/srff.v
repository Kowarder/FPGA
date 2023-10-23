`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:13:07 PM
// Design Name: 
// Module Name: srff
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


module srff(
    input R,S,E,
    output Q, Qbar 
    );
    wire R_i, S_i;
    assign R_i = R & E;
    assign S_i = S & E;
    assign Q = ~(R_i | Qbar);
    assign Qbar = ~(S_i | Q); 
endmodule
