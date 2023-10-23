`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:18:21 PM
// Design Name: 
// Module Name: srff_tb
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


module srff_tb();
    reg r,s,e;
    wire q, qbar;
    
    srff uut(.R(r), .S(s), .E(e), .Q(q), .Qbar(qbar));
    
    initial begin
        r = 0;
        s = 0;
        #5
        s = 1;
        #10
        s = 0;
        #5
        r = 1;
        #10
        r = 0;
        s = 1;
        #5
        r = 1;
        s = 0;
        #5
        r = 0;
        #5
        r = 1;
        s = 1;
        #5
        $stop;
    end
    
    initial begin
        e = 0;
        #10
        e = 1;
        #20
        e = 0;
        #15
        e = 1;
        #5
        $stop;
       end
        
    
endmodule
