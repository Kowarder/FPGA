`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:40:52 PM
// Design Name: 
// Module Name: tff_tb
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


module tff_tb();
    reg clk, rstn, t;
    wire q;
    
    tff uut(.clk(clk), .rstn(rstn), .t(t), .q(q));
    
    initial begin
        clk = 0;
        forever begin
            #10 clk = 1;
            #10 clk = 0;
         end
     end
     
     initial begin
     rstn = 1;
     #60
     t = 0;
     #60
     rstn = 0;
     t = 1;
     #60
     t = 0;
     #60
     rstn = 1;
     t = 1;
     
     end
     

endmodule
