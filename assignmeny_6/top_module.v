`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 02:19:44 PM
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
    input [3:0] a,b,
    input cin,
    input clk,
    input en,
//    output cout,
    output [15:0] bcd_d_out,
    output rdy
    );
    
    wire [3:0] sum;
    wire cout;
    project_7 Cla(a[3:0], b[3:0], cin, sum, cout);
    
    wire in_seg = {7'b0, cout, sum};
    BCDConvert bcd(clk, en, in_seg, bcd_d_out, rdy);
    
endmodule
