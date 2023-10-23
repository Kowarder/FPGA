`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 03:06:18 PM
// Design Name: 
// Module Name: dff_asy
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


module dff_asy(
    input D, clk, reset,
    output reg Q
    );
    always @(posedge clk or negedge reset)
    if(!reset)
        Q <= 0;
        else
        Q <= D;
    
endmodule
