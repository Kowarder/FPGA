`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 03:30:06 PM
// Design Name: 
// Module Name: counter
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
//module T_FlipFlop  ( input clk,input T, output reg Q);  
  
//          always @ (posedge clk) begin  
    
//        if (T)  
//            Q <= ~Q;  
//        else  
//            Q <= Q;  
//  end  
//endmodule  




   module counter(
    input wire clk, // Clock input
    input wire reset, // Asynchronous reset
    output reg [2:0] count // 3-bit counter output
);

reg [3:0] next_count; // Next state of the counter
always @(posedge clk) begin
    if (reset) begin
        count <= 3'd0; // Reset the output to 0
    end else begin
        count <= count + 1; // Update the counter output
    end
end



    
endmodule
