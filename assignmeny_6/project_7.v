`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 01:43:56 PM
// Design Name: 
// Module Name: project_7
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

//CLA
module project_7(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    wire [3:0] p;
    wire [3:0] g;
    wire [3:0] c;
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];
    assign p[0] = a[0] ^ b[0];
    assign p[1] = a[1] ^ b[1];
    assign p[2] = a[2] ^ b[2];
    assign p[3] = a[3] ^ b[3];
    
    assign s[0] = p[0] ^ cin;
    assign c[0] = g[0] | (p[0] & cin);
    assign s[1] = p[1] ^ c[0];
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign s[2] = p[2] ^ c[1];
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign s[3] = p[3] ^ c[2];
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
    
    assign cout = c[3];
    
endmodule
