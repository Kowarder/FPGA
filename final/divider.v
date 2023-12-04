`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:36:36 PM
// Design Name: 
// Module Name: divider
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


module divider(clock_out, clock_in);
    input clock_in;
    output reg clock_out;
    
    reg [3:0] counter = 4'd0;
    parameter DIVISOR = 4'd4;
    
    always@(posedge clock_in) begin
        counter <= counter + 4'd1;
        if(counter >= (DIVISOR - 1))
            counter <= 4'd0;
        clock_out <= (counter < DIVISOR/2)?1'b1:1'b0;
    end
endmodule
