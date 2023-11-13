`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 03:07:52 PM
// Design Name: 
// Module Name: p8_tb
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


module p8_tb( );
reg clk;
wire [6:0]seg;
wire [3:0] an;

p8 uut(.mclk(clk), .seg(seg), .an(an));

always #5 clk = ~clk;

initial begin
clk = 0;
#500;
end
endmodule
