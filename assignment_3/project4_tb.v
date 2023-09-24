`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 02:25:16 PM
// Design Name: 
// Module Name: project4_tb
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


module project4_tb(); //4 bit adder
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

projevt_4 uut(.A(a[3:0]), .B(b[3:0]), .Cin(cin), .S(sum[3:0]), .Cout(cout));

initial begin
    a = 4'b0001;
    b = 4'b0001;
    cin = 0;
    
    #10
    a = 4'b0010;
    b = 4'b0001;
    cin = 0;
    
    #10
    a = 4'b1001;
    b = 4'b0111;
    cin = 0;
    
    #10
    a = 4'b0010;
    b = 4'b0010;
    cin = 0;
    
    #10
    a = 4'b0010;
    b = 4'b0010;
    cin = 1;
    
    #10
    $stop;
 end
 endmodule



