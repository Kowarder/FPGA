`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 03:37:16 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    
    reg clk,reset;
    wire [2:0] c;
    
    counter uut(.clk(clk), .reset(reset), .count(c));
    
    initial begin
        clk = 0;
        forever begin
            #10 clk = 1;
            #10 clk = 0;
         end
     end
     
     initial begin
     reset = 1;
     #50
     reset = 0;
     
     end
     
     
endmodule
