`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:54:19 PM
// Design Name: 
// Module Name: Mealy
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


module Mealy(
    input P1, P2, clk, reset,
    output reg z
    );
    parameter S0=0,S1=1,S2=2,S3=3;
    reg[1:0] PS,NS;
    
    wire P1_D, P2_D;
    Debouncer debouncerA(P1, clk, P1_D);
    Debouncer debouncerB(P2, clk, P2_D);
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0;
        else
            PS <= NS;
    end
    
    always@(PS or P1_D or P2_D) begin
        case(PS)
        S0:begin
            z = 0;
            if(P1)
            NS = S1;
            else
            NS = S0;
            end
        S1:begin
            if(P1)
            NS = S2;
            else
            NS = S0;
            end
        S2:begin
            if(P2)
            NS = S3;
            else
            NS = S2;
            end
        S3:begin
            if(P1)
            NS = S1;
            else
            NS = S0;
            end
        endcase
     end
     
     always@(PS or P1_D or P2_D) begin
        case(PS)
        S0:z=0;
        S1:z=0;
        S2:z=0;
        S3:begin
        if(P1)
        z=1;
        end
        endcase
     end
endmodule

module Debouncer(input pb_1,clk,output reg pb_out);
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

