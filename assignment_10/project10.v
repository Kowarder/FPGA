`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 01:26:55 PM
// Design Name: 
// Module Name: ROM
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


module ROM(
    input [2:0] ROM_adr,
    output reg [3:0] ROM_data
    );
    always@(ROM_adr) begin
        case(ROM_adr)
            3'd0: ROM_data = 4'd0;
            3'd1: ROM_data = 4'd13;
            3'd2: ROM_data = 4'd10;
            3'd3: ROM_data = 4'd8;
            3'd4: ROM_data = 4'd4;
            3'd5: ROM_data = 4'd11;
            3'd6: ROM_data = 4'd2;
            3'd7: ROM_data = 4'd1;
        endcase
     end
endmodule
