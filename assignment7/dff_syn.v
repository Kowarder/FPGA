`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:32:52 PM
// Design Name: 
// Module Name: dff_syn
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


module dff_syn(
    input D, clk,reset,
    output reg Q
    );
    always @(posedge clk)
        if(clk | !reset) begin
        Q <= D;
        end
        
      
endmodule
