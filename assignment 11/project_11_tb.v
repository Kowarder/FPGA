`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:16:43 PM
// Design Name: 
// Module Name: project_11_tb
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


module project_11_tb( );
  reg clk, rst;
  reg[2:0]adr1_r, adr2_r, adr_ram;
  wire [7:0] result;
  
  project_11 uut(.clk(clk), .rst(rst), .adr1_r(adr1_r), .adr2_r(adr2_r), .adr_ram(adr_ram), .result(result));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    #20
    rst = 1'b0;
    adr1_r = 3'b001;
    adr2_r = 3'b010;
    adr_ram = 3'b000;
    
    #100
    #20
    rst = 1'b1;
    
    #20
    rst = 1'b0;
    adr1_r = 3'b011;
    adr2_r = 3'b100;
    adr_ram = 3'b001;
    #100
    
    #50
    $stop;
  end

endmodule 

