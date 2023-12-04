`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:36:56 PM
// Design Name: 
// Module Name: divider_tb
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


module divider_tb();

    reg clock_in;
    wire clock_out;
    
    divider uut(.clock_in(clock_in), .clock_out(clock_out));
    
    always #5 clock_in = ~clock_in;
    
    initial begin
        clock_in = 0;
        #200
        #5
        $stop;
    end

endmodule
