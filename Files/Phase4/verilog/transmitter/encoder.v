`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:29 06/07/2021 
// Design Name: 
// Module Name:    encode 
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
`timescale 1ns / 1ps
module encoder(
	data_in,
	data_out,
	Clk,
	reset,
	rate,
	en
);
	input data_in;
	input Clk;
	input reset;
	input rate;// 0: rate = 1/2 
	input en;
	output [1:0]  data_out;
	reg [1:0] counter=2'd0;
	
	reg [6:1]data_reg = 6'b000000;
	reg [1:0] delay;
	wire A;
	wire B;
	reg  f = 0;
	assign A = data_in ^ data_reg[2] ^ data_reg[3] ^ data_reg[5] ^ data_reg[6];
	assign B = data_in ^ data_reg[1] ^ data_reg[2] ^ data_reg[3] ^ data_reg[6];
	
	assign data_out = {B , A};
	
	always @(posedge Clk , negedge reset)
	begin
	
		if(!reset) begin
			data_reg <= 6'b000000;
			counter = 2'b00;
			f <= 0;
			end
		else if(en)
					begin
					data_reg <= {data_reg[5:1] , data_in};
				
			end
	end
	endmodule
