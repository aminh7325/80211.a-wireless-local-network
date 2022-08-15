module decoder_tb();
	parameter data_Num =72;
	reg	 clk;
	reg	reset;
	reg	 [1:0] in;
	wire [data_Num/2-1:0] out; 
	integer	i = 0;	
	integer  InData, OutData, f1, f2 , OutData2;
	
	initial 
		begin
		clk = 0;
		reset = 1;
		#4 reset = 0;  
		#4 reset = 1;
		InData  = $fopen("Out_rate0.txt", "r");
		OutData2 = $fopen("inV.txt", "w");
		for (i=0 ; i<200 ; i = i+1)
			@(posedge clk);
		$stop;
	end
	always #10 clk = ~clk;

	always@(posedge clk)
	begin
			  
			f1 = $fscanf(InData, "%b\n%b\n", in[1],in[0]);
		end

	viterbi_decoder dec(.Clk(clk), .reset(reset), .data_in(in), .data_out(out));
	  
endmodule