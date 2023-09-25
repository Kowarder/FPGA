
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 01:39:49 PM
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(
    input [3:0] sum,
    input Cout,
    input sel,
    output [3:0] show
    );
    assign new_cout = {3'b0, Cout};
    assign show = sel?sum:new_cout;
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 01:25:23 PM
// Design Name: 
// Module Name: project5
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


module project5(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);

wire [3:0] Co;

full_adder fulladder1(A[0], B[0], Cin, S[0], Co[0]);
full_adder fulladder2(A[1], B[1], Co[0], S[1], Co[1]);
full_adder fulladder3(A[2], B[2], Co[1], S[2], Co[2]);
full_adder fulladder4(A[3], B[3], Co[2], S[3], Cout);

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

assign S = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 01:48:27 PM
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input [3:0] sum,
    output reg [6:0] display
);
always @(sum)
begin 
case(sum)
    4'b0000: display = 7'b0000001; //0
    4'b0001: display = 7'b1001111; //1
    4'b0010: display = 7'b0010010; //2
    4'b0011: display = 7'b0000110; //3
    4'b0100: display = 7'b1001100; //4
    4'b0101: display = 7'b0100100; //5
    4'b0110: display = 7'b0100000; //6
    4'b0111: display = 7'b0001111; //7
    4'b1000: display = 7'b0000000; //8
    4'b1001: display = 7'b0000100; //9
endcase
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 01:45:25 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input[3:0] A,
    input[3:0] B,
    input Cin,
    input sel,
    output [6:0] display
    );
    wire Cout;
    wire [3:0] sum;
    wire [3:0] show;
    project5 adder(A[3:0], B[3:0], Cin, sum[3:0], Cout);
    mux2to1 mux(sum[3:0], Cout, sel, show[3:0]);
    seven_seg led(show[3:0], display[6:0]);
    
endmodule
