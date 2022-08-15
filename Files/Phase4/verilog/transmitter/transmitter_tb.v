`timescale 1ns / 1ps
module transmitter_tb();

	reg Clk;
	reg reset;
	reg in;
	reg [5:0]pad_in;
	wire [179:0]out;
	integer op1, op_out ,op2;
	integer i , tempin , temp , j;
	wire ready;
	reg inreg[230:0];
	
transmitter DUT(
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
		op1 = $fopen("In.txt" , "r");
		op2 = $fopen("N_pad.txt" , "r");
		op_out = $fopen ("Out_Transmitter_V.txt" , "w");
		#20;
		reset = 0;
		for(i=0 ; i < 2000 ; i = i+1)
		  @(posedge Clk);
		$stop;
	end	 
	 
	always #10 Clk = ~Clk;

	always@(posedge Clk)
	begin
		temp = $fscanf(op2 , "%b" , pad_in);
		tempin = $fscanf(op1 , "%b" , in);
		if(ready)
            begin
            for(j=0 ; j<180; j = j+1)
            $fwrite(op_out , "%b\n" , out[j]);
            $stop;
            end
	end
endmodule