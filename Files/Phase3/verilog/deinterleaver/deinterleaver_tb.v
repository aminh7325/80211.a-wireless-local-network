module deinterleaver_tb;
    reg [1:0] in;
    reg Clk=0;
    wire [95:0]out;
    wire ready;
    reg en = 0;

    integer In_data , Out_data , f1;
    integer i , j;
    always #5 Clk = ~Clk;

    initial
    begin

        In_data  = $fopen("Out_interleaver_m.txt", "r");
		Out_data = $fopen("Out_deinterleaver_v.txt", "w");
        for(i = 0 ; i < 300 ; i = i + 1)
            @(posedge Clk);
        $stop;

    end
    always @(posedge Clk) begin
        en = 1;
        f1 = $fscanf(In_data, "%b\n%b\n", in[0],in[1]);
        if(ready)begin
            for(j=0 ; j<96; j = j+1)
            $fwrite(Out_data , "%b\n" , out[j]);
            $stop;
        end
    end

     deinterleaver dut ( .in_data(in), .out_data(out),.Clk(Clk),.ready(ready) , .en(en));

endmodule