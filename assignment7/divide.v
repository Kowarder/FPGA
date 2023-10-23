`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 03:39:00 PM
// Design Name: 
// Module Name: divide
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


module divide(clock_out, clock_in);
input clock_in; 
output reg clock_out; 
reg[1:0] counter=2'd0;
parameter DIVISOR = 4'd4;



always @(posedge clock_in)
begin
 counter <= counter + 2'd1;
 if(counter>=(DIVISOR-1))
  counter <= 2'd0;
 clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
end
endmodule

