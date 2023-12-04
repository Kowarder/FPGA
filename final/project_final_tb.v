`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:46:48 PM
// Design Name: 
// Module Name: project_final_tb
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


module project_final_tb();

    reg D, K, S, B;
    wire A;
    
    project_final uut(.D(D), .K(K), .S(S), .B(B), .A(A));
    
    initial begin
    
    #5
    D = 1'b0;
    K = 1'b0;
    S = 1'b0;
    B = 1'b0;
    #5
    D = 1'b0;
    K = 1'b1;
    S = 1'b0;
    B = 1'b0;
    #5
    D = 1'b1;
    K = 1'b0;
    S = 1'b0;
    B = 1'b0;
    #5
    D = 1'b0;
    K = 1'b1;
    S = 1'b1;
    B = 1'b1;
    #5
    D = 1'b0;
    K = 1'b0;
    S = 1'b1;
    B = 1'b0;
    #5
    D = 1'b1;
    K = 1'b1;
    S = 1'b0;
    B = 1'b0;
    #5
    D = 1'b1;
    K = 1'b1;
    S = 1'b1;
    B = 1'b1;
    #5
    D = 1'b1;
    K = 1'b1;
    S = 1'b1;
    B = 1'b0;
    #5
    $stop;
   end

endmodule
