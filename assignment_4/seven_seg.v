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