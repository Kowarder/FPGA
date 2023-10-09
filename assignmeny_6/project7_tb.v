`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 02:08:18 PM
// Design Name: 
// Module Name: project7_tb
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


module project7_tb( );
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    
    project_7 uut (.a(A), .b(B), .cin(Cin), .s(S), .cout(Cout));
    
    initial begin
        A = 1;
        B = 0; 
        Cin = 0; 
        #1
        A = 2; 
        B = 4; 
        Cin = 1; 
        #1
        A = 4'hb; 
        B = 4'h6; 
        Cin = 0; 
        #1        
        A = 5; 
        B = 3; 
        Cin = 1;
        #1
        $stop;
    end

endmodule
