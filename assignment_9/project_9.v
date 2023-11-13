`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:19:08 PM
// Design Name: 
// Module Name: project_9
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


module project_9(input pb_1,clk,output reg pb_out);
    reg[2:0]counter;
    wire TC;
    
    always@(posedge clk) begin
    if(~pb_1)
        counter <= 3'd0;
    else
        counter <= counter + 3'd1;
    end
    
    assign TC = (counter == 3'b111);
    
    always@(posedge clk) begin
        if(~pb_1)
            pb_out <= 1'b0;
        else
            pb_out <= 1'b1;
    end

endmodule

