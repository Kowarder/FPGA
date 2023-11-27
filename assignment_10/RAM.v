`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 01:41:24 PM
// Design Name: 
// Module Name: RAM
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


module RAM(
    input clock, reset,
    input [2:0] adr,
    input [7:0] data_in,
    input write_signal,
    output reg [7:0] data_out
    );
    reg [7:0] memo [0:7];
    always@(posedge clock or posedge reset) begin
        if(reset) begin
            memo[0] <= 8'b0;
            memo[1] <= 8'b0;
            memo[2] <= 8'b0;
            memo[3] <= 8'b0;
            memo[4] <= 8'b0;
            memo[5] <= 8'b0;
            memo[6] <= 8'b0;
            memo[7] <= 8'b0;
         end
         
         if(write_signal) begin
            memo[adr] <= data_in;
         end
         else begin
            data_out <= memo[adr];
         end
      end
            
endmodule
