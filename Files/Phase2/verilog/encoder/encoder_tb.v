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
module encode_tb();
	
	reg	 clk;
	reg	 en;
	reg	reset;
	wire [1:0]rate;
	reg	  in;
	wire [1:0] out;
	reg	 des;	  
	integer	e = 0;	
	integer	i = 0;	
	integer  InData, OutData, f1, f2 , OutData2;

	assign rate = 0;
	
	initial 
		begin
		clk = 0;
		en  = 1;
		reset = 1;
		#4 reset = 0;  
		#4 reset = 1;
		InData  = $fopen("In.txt", "r");
		OutData2 = $fopen("Out_rate0V.txt", "w");
		f1 = $fscanf(InData, "%b\n", in);
		for (i=0 ; i<26 ; i = i+1)
			@(posedge clk);
		$stop;
	end
	always #10 clk = ~clk;

	always@(posedge clk)
	begin
			  
			f1 = $fscanf(InData, "%b\n", in);
			$fwrite(OutData2,"%b\n%b\n",out[0] , out[1]);
			
		end

	encoder enc(.Clk(clk), .reset(reset), .en(en), .rate(rate), .data_in(in), .data_out(out));
	  
endmodule