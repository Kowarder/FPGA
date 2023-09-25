`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 02:11:23 PM
// Design Name: 
// Module Name: topmodule_tb
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


module topmodule_tb();
reg [3:0] a,b;
reg cin,sel;
wire [6:0] display;

top_module uut(.A(a[3:0]), .B(b[3:0]), .Cin(cin), .sel(sel), .display(display));

initial begin
    a = 4'b0000;
    b = 4'b0001;
    cin = 0;
    sel = 0;
    
    #10
    a = 4'b0000;
    b = 4'b0001;
    cin = 0;
    sel = 1;
    
    #10
    a = 4'b0011;
    b = 4'b0010;
    cin = 1;
    sel = 0;
    
    #10
    a = 4'b0011;
    b = 4'b0010;
    cin = 1;
    sel = 1;
    
    #10
    a = 4'b1110;
    b = 4'b1001;
    cin = 0;
    sel = 0;
    
    #10
    a = 4'b1110;
    b = 4'b1001;
    cin = 0;
    sel = 1;
    
    #10
    $stop;
end

endmodule
