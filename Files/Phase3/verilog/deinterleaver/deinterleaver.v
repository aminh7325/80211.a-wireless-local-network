module deinterleaver(
    in_data,
    out_data,
    Clk,
    ready,
    en
);
    parameter N_CBPS = 48;
    parameter N_BPSC = 1;
    parameter length = 96;
    input [1:0]in_data;
    input Clk;
    input en;
    output [length-1:0]out_data;
    output reg ready;

    wire[2:0] S_deinterleave;
    reg [47:0] counter = 0;
    reg [10:0]step_counter = 0;
    wire [10:0]step;
    wire [10:0]first_permutation0 , first_permutation1;
    wire [10:0]second_permutation0 , second_permutation1;
    reg [length-1:0]deinterleave_stage2;

    assign S_deinterleave = (N_BPSC/2 < 1) ? 1 : N_BPSC/2;
    assign step = length/N_CBPS;

    assign first_permutation0 = S_deinterleave * (counter/S_deinterleave) + (counter + 16 * counter/N_CBPS)%S_deinterleave;
    assign first_permutation1 = S_deinterleave * ((counter + 1)/S_deinterleave) + ((counter + 1) + 16 * (counter + 1)/N_CBPS)%S_deinterleave;
    assign second_permutation0 = 16*first_permutation0 - (N_CBPS - 1)*(16*first_permutation0/N_CBPS);
    assign second_permutation1 = 16*first_permutation1 - (N_CBPS - 1)*(16*first_permutation1/N_CBPS);

    assign out_data = (ready) ? deinterleave_stage2 : 0;

    always @(counter) begin

    
        if(counter == N_CBPS)begin

            step_counter <= step_counter + 1;
            counter <= 0;

        end
    
    end

    always @(posedge Clk) begin

        if(en)begin
            
            counter <= counter + 2 ;
            deinterleave_stage2[step_counter * N_CBPS + second_permutation0] <= in_data[0];
            deinterleave_stage2[step_counter * N_CBPS + second_permutation1] <= in_data[1];

            if(step_counter == step)begin
                ready <= 1'b1;
                step_counter <= 0;
                counter <= 0;
            end
            else
                ready <= 1'b0;
        end
    end

    endmodule