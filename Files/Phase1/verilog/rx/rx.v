`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:56 06/04/2021 
// Design Name: 
// Module Name:    rx 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rx(
	 data_in,
	 n_pad,
	 Clk,
	 reset,
	 data_out,
	 ready
    );
	input data_in;
	input Clk;
	input reset;
	input [5:0] n_pad;
	output data_out;
	output reg ready;
	
	reg [23:0]signal_field = 24'd0;
	reg [8:0]Counter = 0;
	reg out;
	reg rst_scrambler;
	reg en_scrambler;
	reg in_scrambler;
	wire out_scrambler;
	reg phase1_ready;
	wire [11:0]length;
	wire [3:0]rate;
	reg [6:0] mem = 7'b0000000;
	parameter signal = 0 , service = 1  , psdu = 2 , tail_pad = 3 , service1 = 4 , preamble = 5;
	reg [6:0] scrambler_seed = 7'b0000000;
	reg [3:0] C_state;
	reg [11:0]preamble_check;
	
	assign data_out = out;
	assign length = signal_field[18:7];
	assign rate = signal_field[23:20];
	
	scrambler data_scramble (
    .in_data(data_in), 
    .Clk(Clk), 
    .scrambler_seed({mem[5:0],mem[6]^mem[3]}), 
    .reset(rst_scrambler), 
    .en(en_scrambler), 
    .out_data(out_scrambler)
    );
	
	
	always@(posedge Clk)begin
		if(reset)begin
			C_state <= preamble;
			Counter <= 7'd0;
			out <= 0;
			preamble_check <= 12'd0;
		end
		else
		begin
			case(C_state)
				
				preamble:begin
					preamble_check <= {preamble_check[10:0] , data_in};
					mem <= 7'd0;
					scrambler_seed <= 7'd0;
					if(preamble_check[10:0] == 11'b11111111111)
						C_state <= signal;
					else
						C_state <= preamble;
				
				end
				signal:begin
					if(Counter < 23)begin
						out <= data_in;
						Counter <= Counter + 1'b1;
						signal_field <= {signal_field[22:0] , data_in};
						ready <= 0;
						en_scrambler <= 1'b0;
						rst_scrambler <= 1'b1;
					end
					else begin
						out <= data_in;
						Counter <= 0;
						signal_field <= {signal_field[22:0] , data_in};
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
						in_scrambler <= data_in;
						C_state <= service;
					end
				end
				
				service:begin
					if(Counter < 7)begin
						out <= 0;
						Counter <= Counter + 1'b1;
						in_scrambler <= data_in;
						mem <= {mem[5:0] , data_in};
						en_scrambler <= 1'b0;
						if(Counter == 6)
						rst_scrambler <= 1'b1;
						else
						rst_scrambler <= 1'b0;
					end
					else begin
						out <= 0;
						Counter <= 0;
						in_scrambler <= data_in;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
						C_state <= service1;
					end
				end
				
				service1:begin
					if(Counter < 10)begin
						out <= 0;
						Counter <= Counter + 1'b1;
						in_scrambler <= data_in;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
					end
					else begin
						out <= out_scrambler;
						Counter <= 0;
						in_scrambler <= data_in;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
						C_state <= psdu;
					end
				end
				
				psdu:begin
					if(Counter < {length , 3'b000}) begin// 8bit * Num of frames
						out <= out_scrambler;
						Counter <= Counter + 1'b1;
						in_scrambler <= data_in;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
					end
					else begin 
						out <= out_scrambler;
						Counter <= 0;
						in_scrambler <= data_in;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
						C_state <= tail_pad;
					end
				end
				
				tail_pad:begin
					if(Counter < (6 + n_pad))begin
						out <= out_scrambler;
						Counter <= Counter + 1'b1;
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
					end
					else begin
						C_state <= preamble;
						ready <= 1;
					end
				end
			endcase	
		end
	end

endmodule
