`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:43 06/04/2021 
// Design Name: 
// Module Name:    tx_tb 
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
module encoder_tb2();

	
	reg	 clk;
	reg	 en;
	reg	reset;
	reg [1:0]rate;
	reg	  in;
	wire out;
	reg	 des;	  
	integer	e = 0;	
	integer	counter = 0;	
	integer i;
	integer  In, Out, f1, f2;
	
	initial 
		begin
		rate = 1;
		clk = 0;
		en  = 1;
		reset = 0;  
		#8 reset = 1;
		In  = $fopen("In_rate2.txt", "r");
		Out = $fopen("Out_rate2V.txt", "w");
		for (i=0 ; i<49 ; i = i+1)
			@(posedge clk);
		$stop;
	end

	always #5 clk = ~clk;

	always@(posedge clk)
	begin
		

			f1 = $fscanf(In, "%b\n", in);
			$fwrite(Out,"%b\n",out);
			
	end

	encoder dut(.Clk(clk), .reset(reset), .en(en), .rate(rate), .data_in(in), .data_out(out));
	  
endmodule