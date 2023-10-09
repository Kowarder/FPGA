`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 02:30:45 PM
// Design Name: 
// Module Name: topmodule_tb
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


module topmodule_tb();

    reg [3:0] A,B;
    reg Cin, En, clk;
    wire [15:0] BCD_d_out;
    wire rdy;
    
    top_module uut(.a(A), .b(B), .cin(Cin), .clk(clk), .en(En), .bcd_d_out(BCD_d_out), .rdy(rdy));
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        A = 4'b1111;
        B = 4'b1110;
        Cin = 0;
        En = 1;
        #10
        A = 4'b1111;
        B = 4'b1110;
        Cin = 0;
        En = 1;
        #10
        A = 4'b1111;
        B = 4'b1110;
        Cin = 0;
        En = 0;
        #10
        A = 4'b1111;
        B = 4'b1110;
        Cin = 0;
        En = 0;
        #10
        $stop;
       
    end
            
    
endmodule
