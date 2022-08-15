`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:31 06/04/2021 
// Design Name: 
// Module Name:    frame 
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
module transmitter(
	 data_in,
	 n_pad,
	 Clk,
	 reset,
	 data_out,
	 ready
    );
    parameter frame_size = 180;
	input data_in;
	input Clk;
	input reset;
	input [5:0] n_pad;
	output [frame_size-1:0]data_out;
	output  ready;
	
	
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
    reg [35:0]signal_frame;
    wire [1:0]out_stage2;
    wire ready_final;
	wire [143:0]out_stage3; 
	parameter signal_preamble = 0 , service = 1  , psdu = 2 , tail_pad = 3;
	wire [6:0] scrambler_seed = 7'b1011011;
	reg [2:0] C_state;
	
	
	assign length = signal_field[18:7];
	assign rate = signal_field[23:20];

    assign data_out = ready_final ? {out_stage3,signal_frame } : 0;
    assign ready = ready_final;
	
	scrambler data_scramble (
    .in_data(data_in), 
    .Clk(Clk), 
    .scrambler_seed(scrambler_seed), 
    .reset(rst_scrambler), 
    .en(en_scrambler), 
    .out_data(out_scrambler)
    );
	
	
	always@(posedge Clk)begin
		if(reset)begin
			C_state <= signal_preamble;
			Counter <= 7'd0;
			out <= 0;
		end
		else
		begin
			case(C_state)
			
				signal_preamble:begin
					if(Counter < 35)begin
						out <= data_in;
						Counter <= Counter + 1'b1;
                        signal_frame <= {data_in , signal_frame[35:1]};
						signal_field <= {signal_field[22:0] , data_in};
						en_scrambler <= 1'b0;
						rst_scrambler <= 1'b1;
					end
					else begin
						out <= data_in;
						Counter <= 0;
                        signal_frame <= {data_in , signal_frame[35:1] };
						signal_field <= {signal_field[22:0] , data_in};
						en_scrambler <= 1'b1;
						rst_scrambler <= 1'b0;
						in_scrambler <= data_in;
						C_state <= service;
					end
				end
				
				service:begin
					if(Counter < 15)begin
                        phase1_ready <= 1;
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
				end
			endcase	
		end
	end

    encoder stage2 (.data_in(out), .data_out(out_stage2),.Clk(Clk),.reset(1'b1),.rate(1'b0),.en(phase1_ready));
    interleaver stage3( .in_data({out_stage2}), .out_data(out_stage3),  .Clk(Clk), .ready(ready_final), .en(phase1_ready));



endmodule
