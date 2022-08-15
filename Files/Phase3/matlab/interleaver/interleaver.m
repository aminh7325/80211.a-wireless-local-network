clear;
clc;
%%%tx
f = fopen('Out_rate0.txt' , 'r');
o = fopen('Out_interleaver_m.txt' , 'w+');
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
    Interleave_stage1 = zeros(N_CBPS , 1);
    for j=0:N_CBPS-1
         index =((N_CBPS/16)*(mod(j , 16)) + floor(j/16)+1);
         Interleave_stage1(S*floor(index/S) + mod((index + N_CBPS - floor(16*index/N_CBPS)) , S)) = in(j+1 + (i-1)*N_CBPS);
         disp([in(j+1 + (i-1)*N_CBPS), S*floor(index/S) + mod((index + N_CBPS - floor(16*index/N_CBPS)) , S)-1] );
    end
    fprintf(o , "%d \n" , Interleave_stage1);
end

fclose(o);
fclose(f);
