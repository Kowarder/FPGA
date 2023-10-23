`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 03:01:40 PM
// Design Name: 
// Module Name: dff_tb
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


module dff_tb();
reg d, clk,reset;
wire q;

dff_syn uut(.D(d), .clk(clk), .Q(q));

initial begin
    d = 0;
    #20
    d = 1;
    #80
    d = 0;
    #120
    d = 1;
    end
    
    initial begin
        clk = 0;
        forever begin
            #10 clk = 1;
            #10 clk = 0;
         end
     end
     
     initial begin
     reset = 0;
     #80
     reset = 1;
     #20
     reset = 0;
     #80
     reset = 1;
     end
       
endmodule
