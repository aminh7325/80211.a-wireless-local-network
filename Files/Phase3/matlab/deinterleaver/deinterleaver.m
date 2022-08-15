clear;
clc;
%%%rx
f = fopen('Out_interleaver_m.txt' , 'r');
o = fopen('Out_deinterleaver_m.txt' , 'w+');
in = fscanf(f , "%d");
N_CBPS = 48; %This part in Phase4 will be one of inputs that come from
             % Signal field of input frame
N_BPSC = 1; %This part in Phase4 will be one of inputs that come from
             % Signal field of input frame
if(N_BPSC/2 < 1)
    S = 1;
else
    S = N_BPSC/2;
end
step = length(in)/N_CBPS;
for i=1:step
    deInterleave_stage1 = zeros(N_CBPS , 1);
    for j=0:N_CBPS-1
         index =(S*floor(j/S) + mod((j + floor(16 * j/N_CBPS)) , S));
         deInterleave_stage1(16*index - (N_CBPS - 1)*floor(16*index/N_CBPS) + 1) = in(j+1 + (i-1)*N_CBPS);
    end
    fprintf(o , "%d \n" , deInterleave_stage1);
end

fclose(o);
fclose(f);
