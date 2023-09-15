# ECE 128: FPGA Laboratory
# Lab 2: Design a one-bit full adder

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 01:40:27 PM
// Design Name: 
// Module Name: project_3
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
module or_gate (
    input a,
    input b,
    output c
);
    assign c = a | b;
endmodule

module half_adder (
    input a,
    input b,
    output s,
    output c_out
);
    assign s = a ^ b;
    assign c_out = a & b;
endmodule
 
module project_3( 
        input a,
        input b,
        input c_in,
        output s,
        output c_out
    );
    wire s1, c1, c2;
    half_adder half_adder1(a, b, s1, c1);
    half_adder half_adder2(s1, c_in, s, c2);
    or_gate or_gate1(c1, c2, c_out);

    
    
endmodule

#Testbench code

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 02:15:22 PM
// Design Name: 
// Module Name: project_3_tb
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


module project_3_tb();
    reg a1, b1, c_in1;
    wire c_out1, s1;
    project_3_tb uut(.a(a1), .b(b1), .c_in(c_in1), .c_out(c_out1), .s(s1));
    initial begin
        a1=0;
        b1=0;
        c_in1=0;
        #10 a1=0;
        b1=1;
        c_in1=0;
        #10 a1=1;
        b1=1;
        c_in1=0;
        #10 a1=1;
        b1=1;
        c_in1=1;
        #10 $stop;
    end
endmodule


   

