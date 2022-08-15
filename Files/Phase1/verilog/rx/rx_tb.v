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
module rx_tb();

	reg Clk;
	reg reset;
	reg in;
	reg [5:0]pad_in;
	wire out;
	integer op1, op_out ,op2;
	integer i , k=0 , temp;
	wire ready;
	reg inreg[220:0];
	
rx DUT(
	 .data_in(in),
	 .n_pad(pad_in),
	 .Clk(Clk),
	 .reset(reset),
	 .data_out(out),
	 .ready(ready)
    );

	initial
	begin
		Clk = 0;
		reset = 1;
		$readmemb("Out.txt" , inreg);
		op_out = $fopen ("In_v.txt" , "w");
		op2 = $fopen("N_pad.txt" , "r");
		#20;
		reset = 0;
		for(i=0 ; i < 229 ; i = i+1)
		  @(posedge Clk);
		$stop;
	end	 
	 
	always #10 Clk = ~Clk;

	always@(posedge Clk)
	begin
		temp = $fscanf(op2 , "%b" , pad_in);
		in = inreg[k];
		#5 k = k+1;
		$fwrite(op_out,"%b \t",out);
	end
endmodule

