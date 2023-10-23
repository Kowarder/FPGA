`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 01:52:18 PM
// Design Name: 
// Module Name: project_8_tb
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


module project_8_tb();

reg r,s;
wire q,qbar;

project_8 uut (.S(s), .R(r), .Q(q), .Qbar(qbar));

initial 
    begin
        r = 0;
        s = 0;
        #5
        s = 1;
        #5
        s = 0;
        #5
        r = 1;
        #5
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
        

endmodule
