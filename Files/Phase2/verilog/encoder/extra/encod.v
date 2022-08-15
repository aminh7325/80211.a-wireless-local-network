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
	input [1:0]rate;// 0: rate = 1/2  1: rate = 2/3  
	input en;
	output reg data_out;
	reg [1:0] counter=2'b0;
	
	reg [6:1]data_reg = 6'b000000;
	reg [1:0] delay;
	wire A;
	wire B;
	reg  flag_reset;

	assign A = data_in ^ data_reg[2] ^ data_reg[3] ^ data_reg[5] ^ data_reg[6];
	assign B = data_in ^ data_reg[1] ^ data_reg[2] ^ data_reg[3] ^ data_reg[6];
	
	always @(posedge Clk , negedge reset)
	begin
	
		if(!reset) begin
			data_reg <= 6'b000000;
			counter = 2'b00;
			flag_reset <= 0;
			end
		else if(en)
				begin
                    flag_reset <= 1;

                    if(counter && flag_reset)begin
                        data_reg <= {data_reg[5:1],data_in};
                    end

                    if((counter<=rate) && flag_reset)begin
                        counter <= counter + 1 ;
                    end

                    else
                    begin
                        counter <= 0;
                    end

			    end
	end

    always @(*) begin
        case ({rate , counter})

            //rate = 1/2
            {2'd0 , 2'd0}: data_out = A;
            {2'd0 , 2'd1}: data_out = B;
            //rate = 2/3
            {2'd1 , 2'd0}: data_out = A;
            {2'd1 , 2'd1}: data_out = B;
            {2'd1 , 2'd2}: data_out = A;
            //rate = 3/4
            {2'd2 , 2'd0}: data_out = A;
            {2'd2 , 2'd1}: data_out = B;
            {2'd2 , 2'd2}: data_out = A;
            {2'd2 , 2'd3}: data_out = B;
            
        endcase        
    end


	endmodule
