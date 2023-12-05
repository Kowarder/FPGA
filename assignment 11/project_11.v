`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 02:16:22 PM
// Design Name: 
// Module Name: project_11
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


module project_11(
    input clk, rst,
    input [2:0] adr1_r, adr2_r, adr_ram,
    output [7:0] result

    );
     wire w_rf, DA, SA, SB, w_ram;
    wire [2:0] adr;
    wire [3:0] ROM_data, A, B;
    wire [7:0] product;

    ROM uut1(adr, ROM_data);
    RAM uut2(clk, rst, adr_ram, product, w_ram, result);
    RF uut3(A, B, SA, SB, ROM_data, DA, w_rf, rst, clk);
    multiplier uut4(A, B, product);
    cu uut5(clk, rst, adr1_r, adr2_r, w_rf, adr, DA, SA, SB, w_ram);

endmodule
// Control unit for the multiplier system
module cu ( 
    input clk, reset,
    input [2:0] adr1,
    input [2:0] adr2,
    output reg w_rf,
    output reg [2:0] adr,
    output reg DA,SA,SB,
    output reg w_ram
);
    // State parameter definitions
    parameter S0_idle = 0, S1_send_adr1 = 1, S2_send_adr2 = 2, S3_multiply = 3, S4_write_ram = 4, S5_read_ram = 5;
    reg [3:0] PS, NS;

    always @(posedge clk or posedge reset) begin
        if (reset)
            PS <= S0_idle;
        else    
            PS <= NS;
    end  

    always @(*) begin 
        case (PS)
            S0_idle:begin
              NS = S1_send_adr1;
                w_rf <= 1'b0;
                w_ram <= 1'b0;
				end
				
				S1_send_adr1:begin	
				w_rf <= 1'b1;
				adr<= adr1;
				DA <=1'b0;
				SA <=1'b0;
				SB <=1'b1;

                  NS = S2_send_adr2;
				end
				
				S2_send_adr2:begin
				w_rf <= 1'b1;
				adr<= adr2;
				NS = S3_multiply;
				DA <=1'b1;
				SA <=1'b0;
				SB <=1'b1;
  
			   end
			
		        S3_multiply: begin
				NS = S4_write_ram;	
				w_ram<= 1'b1;
			    end

                S4_write_ram: begin
				NS = S5_read_ram;	
				end
				
		      S5_read_ram: begin
                w_ram<= 1'b0;

				if(!reset) begin
				NS = S5_read_ram;	
				end
				else begin
				NS = S0_idle;
				end
				end
				

        endcase
    end
endmodule

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

module multiplier(a,b,p);
    
    input [3:0] a,b;
	wire [3:0]m0;
	wire [4:0]m1;
	wire [5:0]m2;
	wire [6:0]m3;

	wire [7:0] s1,s2,s3;
	output [7:0] p;
	assign m0 = {4{a[0]}} & b[3:0];
	assign m1 = {4{a[1]}} & b[3:0];
	assign m2 = {4{a[2]}} & b[3:0];
	assign m3 = {4{a[3]}} & b[3:0];


	assign s1 = m0+ (m1<<1);
	assign s2 = s1+ (m2<<2);
	assign s3 = s2+ (m3<<3);
	assign p = s3;

endmodule

module RF(A, B, SA, SB, D, DA, W, rst, clk);
	output [3:0]A; // A bus
	output [3:0]B; // B bus
	input SA; // Select A - A Address
	input SB; // Select B - B Address
	input [3:0]D; // Data input
	input DA; // Data destination address
	input W; // write enable
	input rst; // positive logic asynchronous reset
	input clk;
	
	wire [1:0]load_enable;
	wire [3:0]R00, R01;
	
	
	Decoder1to2 decoder (load_enable, DA, W);
	RegisterNbit reg00 (D,R00,load_enable[0], rst, clk); //D-in, R00-out
	RegisterNbit reg01 (D,R01,load_enable[1], rst, clk);
	Mux2to1Nbit muxA (A,R00, R01, SA);
	Mux2to1Nbit muxB (B,R00, R01,SB); 

endmodule

module RegisterNbit(D, Q,  L, R, clock);
	parameter N = 4; // number of bits
	output reg [N-1:0]Q; // registered output
	input [N-1:0]D; // data input
	input L; // load enable
	input R; // positive logic asynchronous reset
	input clock; // positive edge clock
	
	always @(posedge clock or posedge R) begin
		if(R)
			Q <= 0;
		else if(L)
			Q <= D;
		else
			Q <= Q;
	end
endmodule

module Decoder1to2(m, S, en);
	input S; // select
	input en; // enable (positive logic)
	output [1:0]m; // 32 minterms
	
	assign m[0] = ~S&en;
	assign m[1] = S&en;
	
endmodule

module Mux2to1Nbit(o, i1,i2, s);
   input [3:0] i1,i2;
   input  s;
   output reg  [3:0] o;
 
always @(s or i1 or i2)
begin
   case (s)
      1'b0 : o = i1;
      1'b1 : o = i2;
      default : o = 4'b0;
   endcase
end
endmodule

