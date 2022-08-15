`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:54 06/04/2021 
// Design Name: 
// Module Name:    scrambler 
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
module scrambler(
	 in_data,
	 Clk,
	 scrambler_seed,
	 reset,
	 en,
	 out_data
);
	input in_data;
	input reset;
	input Clk;
	input en;
	input[6:0]scrambler_seed;
	output out_data;
	
	wire feedback;
	reg [6:0]seed;
	
	assign feedback = seed[6] ^ seed[3];
	assign out_data = in_data ^ feedback;
	
	always@(posedge Clk)
	begin
	
		if(reset)begin
			seed <= scrambler_seed;
		end
		else if(en)begin
			seed <= {seed[5:0] , feedback};
		end
	
	end
	
	
	
endmodule
