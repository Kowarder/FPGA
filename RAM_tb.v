`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 01:41:44 PM
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();
    reg clock, reset;
    reg [2:0] adr;
    reg [7:0] data_in;
    reg write_signal;
    wire [7:0] data_out;
    
    RAM uut(.clock(clock), .reset(reset), .adr(adr), .data_in(data_in), .write_signal(write_signal), .data_out(data_out));
    
    always #5 clock = ~clock;
    
    initial begin
        clock = 0;
        reset = 1;
        #10
        reset = 0;
        adr = 3'd1;
        write_signal = 0;
        data_in = 8'd5;
        #10
        adr = 3'd1;
        write_signal = 1;
        data_in = 8'd5;
        #10
        adr = 3'd1;
        write_signal = 0;
        data_in = 8'd5;
        #10
        adr = 3'd0;
        write_signal = 0;
        data_in = 8'd5;
        #10
        $stop;
        end
endmodule
