`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 02:07:27 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb( );
      // Testbench Signals
    reg [3:0] a,b;
    wire [7:0] p;
    
    multiplier uut(.a(a), .b(b), .p(p));
    
    initial begin
        #10
        a = 4'b0001;
        b = 4'b0010;
        #10
        a = 4'b0010;
        b = 4'b0011;
        #10
        a = 4'b0100;
        b = 4'b0010;
        
        #50
        $stop;
        end


endmodule
