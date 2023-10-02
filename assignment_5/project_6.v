`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 01:32:38 PM
// Design Name: 
// Module Name: project_6
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


module project_6(
    input [3:0] a,
    output led1,
    output led2
    );
    
    assign led1 = a?(a%2?1'b0:1'b1):1'b0;
    assign led2 = a?(a%3?1'b0:1'b1):1'b0;
endmodule
