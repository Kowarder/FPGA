`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:22:11 PM
// Design Name: 
// Module Name: project_9_tb
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


module project_9_tb();

reg pb_1, clk;
wire pb_out;

project_9 uut(.pb_1(pb_1), .clk(clk), .pb_out(pb_out));

always begin
#5 clk = ~clk;
end

initial begin
    clk = 0;
    pb_1 = 0;
    #100;
    
    pb_1 = 1;
    #10;
    /*pb_1 = 0;
    #5;
    #1;
    pb_1 = 1;
    #1;
    pb_1 = 0;
    #1;
    pb_1 = 1;
    #1;
    pb_1 = 0;
    #10;
    pb_1 = 1;
    #10;
    pb_1 = 0;
    #10;
    pb_1 = 1;*/
    #200;
    
    $stop;
end

endmodule
