`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 02:37:16 PM
// Design Name: 
// Module Name: tff
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


module tff(
    input clk, input rstn, input t, output reg q
    );
    always @ (posedge clk) begin  
    if (!rstn)
        q <= 0;  
    else begin  if (t)
        q <= ~q;  
    else
        q <= q;
     end  
  end  

endmodule
