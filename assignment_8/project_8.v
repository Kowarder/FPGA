`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2023 01:25:21 PM
// Design Name: 
// Module Name: project_8
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


module project_8(
    input clk,
    input reset,
    input en, 
    output [6:0] seg_cathode,
    output [3:0] seg_anode
    );
    
    wire [11:0] bn_cnt;
    wire [15:0] bcd_d_out;
    wire rdy;
    wire[1:0] cnt_q;
    wire[3:0] out_c;

    
    divider clk_divid(clk, clk_in);
    counter counter1(clk_in, reset, bn_cnt);
    BCDConvert BCD1(clk_in, en, bn_cnt, bcd_d_out);
    
    multi_seg_drive(clk_in, bcd_d_out, seg_anode, seg_cathode);

    
//    refresh_counter refresh(clk_in, cnt_q);
//    decoder_2_4 decode(clk_in, cnt_q, seg_anode);
    
//    seven_seg(clk_in, bcd_d_out, seg_anode, seg_cathode);
    
//    always@(posedge clk_in) begin
    
        
//    end
endmodule

module bin2BCD(
input clk,
input en,
input [11:0] bin_d_in,
output [15:0] bcd_d_out
// output rdy
);

//State variables
parameter IDLE = 3'b000;
parameter SETUP = 3'b001;
parameter ADD = 3'b010;
parameter SHIFT = 3'b011;
parameter DONE = 3'b100;

//reg [11:0] bin_data = 0;
reg [27:0] bcd_data = 0;
reg [2:0] state = 0;
reg busy = 0;
reg [3:0] sh_counter = 0;
reg [1:0] add_counter = 0;
reg result_rdy = 0;

always @(posedge clk)
begin
if(en)
begin
if(~busy)

begin
bcd_data <= {16'b0, bin_d_in};
state <= SETUP;
end
end

case(state)

IDLE:
begin
result_rdy <= 0;
busy <= 0;
end

SETUP:
begin
busy <= 1;
state <= ADD;
end

ADD:
begin

case(add_counter)
0:
begin
if(bcd_data[15:12] > 4)
begin
bcd_data[27:12] <= bcd_data[27:12] + 3;

end
add_counter <= add_counter + 1;
end

1:
begin
if(bcd_data[19:16] > 4)
begin
bcd_data[27:16] <= bcd_data[27:16] + 3;
end
add_counter <= add_counter + 1;
end

2:
begin
if((add_counter == 2) && (bcd_data[23:20] > 4))
begin
bcd_data[27:20] <= bcd_data[27:20] + 3;
end
add_counter <= add_counter + 1;
end

3:
begin
if((add_counter == 3) && (bcd_data[27:24] > 4))
begin
bcd_data[27:24] <= bcd_data[27:24] + 3;
end
add_counter <= 0;

state <= SHIFT;
end
endcase
end

SHIFT:
begin
sh_counter <= sh_counter + 1;
bcd_data <= bcd_data << 1;

if(sh_counter == 11)
begin
sh_counter <= 0;
state <= DONE;
end
else
begin
state <= ADD;
end

end

DONE:
begin
result_rdy <= 1;
state <= IDLE;
end
default:

begin
state <= IDLE;
end

endcase

end
assign bcd_d_out = bcd_data[27:12];
// assign rdy = result_rdy;
endmodule


module mux4_1(
  input clk,
  input [15:0] data,
  input [3:0] sel,
  output reg [3:0] data_out
);


always@(posedge clk) begin
  case(sel)
    1110: data_out = data[3:0];
    1101: data_out = data[7:4];
    1011: data_out = data[11:8];
    0111: data_out = data[15:12];
  endcase
  end
  
endmodule

module refresh_counter(
    input clk,
    output reg[1:0] cnt_q = 0
);

    reg[1:0] cnt_d = 0;
    always@(posedge clk) begin
        if(cnt_d == 2'b11)
            cnt_d = 2'b0;
         else
         cnt_d = cnt_d + 1'b1;
         cnt_q <= cnt_d;
    end
endmodule 

module decoder_2_4(
    input clk,
    input [1:0] cnt,
    output [3:0] out_c
);
    reg [3:0]out;
    always@(posedge clk) begin
    
        case(cnt)
            00:out = 4'b0001;
            01:out = 4'b0010;
            10:out = 4'b0100;
            11:out = 4'b1000;
        endcase
     end
     assign out_c = ~out;
endmodule

module Seven_seg_decoder(
    input clk,
    input [3:0] bcd,
    output reg[6:0] seg
); 



always @(posedge clk)    begin        
case (bcd) //case statement                   
    4'b0000: seg = 7'b0000001; //0
    4'b0001: seg = 7'b1001111; //1
    4'b0010: seg = 7'b0010010; //2
    4'b0011: seg = 7'b0000110; //3
    4'b0100: seg = 7'b1001100; //4
    4'b0101: seg = 7'b0100100; //5
    4'b0110: seg = 7'b0100000; //6
    4'b0111: seg = 7'b0001111; //7
    4'b1000: seg = 7'b0000000; //8
    4'b1001: seg = 7'b0000100; //9

default : seg = 7'b1111111;                     
endcase               
end                
endmodule

module multi_seg_drive(
input clk,
 input [15:0] bcd_in,
 output [3:0] sseg_a_o,
 output [6:0] sseg_c_o);

parameter g_s = 5;
parameter gt = 4;

wire [6:0] sseg_o;
reg [3:0] anode = 4'b0001;
reg [3:0] bcd_seg = 4'b0000;
reg [g_s-1:0] g_count =0;
wire [1:0] counter;
wire [3:0] de_out;

//refresh_counter refresh(clk, counter);
//decoder_2_4 decoder(clk, counter, anode);
mux4_1 mux(clk, bcd_in, anode, bcd_seg);



Seven_seg_decoder uut1(clk, bcd_seg,sseg_o);
always @(posedge clk)
     begin
    g_count =g_count+1;
        if(g_count == 0)
            begin
            if(anode == 4'b0001)
                begin
                anode = 4'b1000;
                end   
            else 
                begin
                anode = anode >>1;
                end
             end
end

assign  sseg_a_o = anode;
assign  sseg_c_o = bcd_seg;  
       
endmodule

module divider(
    input clk,
    output reg clk_out
);
    reg [31:0] counter = 32'd0;
    parameter DIVISOR = 100_000_000;
    
    always@(posedge clk) begin
        counter <= counter + 32'd1;
         if(counter>=(DIVISOR-1))
            counter <= 32'd0;
        clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
     end
endmodule

module counter(
    input clk,
    input reset,
    output reg[11:0] bin_cnt
);
   
    
    always@(posedge clk) begin
    if(reset == 1)
    bin_cnt <= 12'b000000000000;
    else begin
        if( bin_cnt == 12'b111111111111)
             bin_cnt = 12'b000000000000;
        else
             bin_cnt <=  bin_cnt + 12'b000000000001;
    end
   end
endmodule

module seven_seg(
    input clk,
    input[15:0]data,
    input[3:0]sel,
    output reg [6:0] seg_cathode
);
wire [3:0] data_out;
mux4_1 mux(clk, data, sel, data_out);
always @(data_out)
begin 
case(data_out)
    4'b0000: seg_cathode = 7'b0000001; //0
    4'b0001: seg_cathode = 7'b1001111; //1
    4'b0010: seg_cathode = 7'b0010010; //2
    4'b0011: seg_cathode = 7'b0000110; //3
    4'b0100: seg_cathode = 7'b1001100; //4
    4'b0101: seg_cathode = 7'b0100100; //5
    4'b0110: seg_cathode = 7'b0100000; //6
    4'b0111: seg_cathode = 7'b0001111; //7
    4'b1000: seg_cathode = 7'b0000000; //8
    4'b1001: seg_cathode = 7'b0000100; //9
endcase
end
  endmodule



