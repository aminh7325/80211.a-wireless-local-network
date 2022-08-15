clear;
clc;
%%%Data Frame & Scramble
f = fopen('In.txt' , 'w+');
o = fopen('Out_Transmitter.txt' , 'w+');
x = fopen('N_pad.txt' , 'w+');
rate = dec2bin(13 , 4);
rate_param = SET_RATE_PARAMS(6);%Calculate different parameters of Data rate
                                % of 6Mbit/s (NBPSC ,NCBPS ,NDBPS)
length_n = dec2bin(5 , 12); %Make a PSDU with the length of 8*5 bits
%Calculate N_pad
N_SYM = ceil((16 + 8*5+6)/rate_param.NDBPS);
N_DATA = N_SYM * rate_param.NDBPS;
N_PAD = N_DATA - (16 + 8 * 5 + 6);
n_pad = dec2bin(N_PAD , 6);

fprintf(x ,'%c' , n_pad(:));%Save N_pad for verilog simulation
scramble_state = [1 ,0 ,1 ,1 ,0 ,1 ,1 ];
psdu = floor(2.*rand(1 ,bin2dec([length_n,'000'])));
signal_preamble = ['111111111111'  , rate ,'0' ,length_n ,'0' ,'000000'];

for i=1:length(signal_preamble)
    fprintf(f ,'%c \n' , signal_preamble(i));
    fprintf(o ,'%c \n' , signal_preamble(i));
end
data = [zeros(1,16) ,psdu ,zeros(1,6) ,  zeros(1 , N_PAD)];%DATA Frame that should be scrambled
dataout = [zeros(1,16) ,psdu ,zeros(1,6) , zeros(1 , N_PAD)];%Scrambled DATA Frame that should send to encoder
%Scramble
for i=1:length(data)
    fprintf(f ,'%d \n' , data(i));
    scramble_data = xor(scramble_state(1),scramble_state(4));
    scramble_state = [scramble_state(2:7) ,scramble_data];
    dataout(i) = xor(data(i) ,scramble_data);
end
fclose(f);
fclose(x);
%%
%Encoder
rate = 0;
if(rate == 0)%%0: rate = 1/2
encode_state = [0 , 0 , 0 , 0 , 0 , 0 , 0];
encode_data = zeros(2*length(dataout) , 1);
for i=1:length(dataout)
       encode_data(2*i-1) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + dataout(i) , 2);
       encode_data(2*i) = mod(encode_state(1)+encode_state(2) + encode_state(3) + encode_state(6) + dataout(i) , 2);
        encode_state(2:6) = encode_state(1:5);
        encode_state(1) = dataout(i);
end
end
%%
%Interleaver
N_CBPS = rate_param.NCBPS; %As we said in Phase3 these two parts came from Datarate of dataframe
N_BPSC = rate_param.NBPSC; 
             
if(N_BPSC/2 < 1)
    S = 1;
else
    S = N_BPSC/2;
end
step = length(encode_data)/N_CBPS;
for i=1:step
    Interleave_stage1 = zeros(N_CBPS , 1);
    for j=0:N_CBPS-1
         index =((N_CBPS/16)*(mod(j , 16)) + floor(j/16)+1);
         Interleave_stage1(S*floor(index/S) + mod((index + N_CBPS - floor(16*index/N_CBPS)) , S)) = encode_data(j+1 + (i-1)*N_CBPS);
         Interleave(S*floor(index/S) + mod((index + N_CBPS - floor(16*index/N_CBPS)) , S) + (i-1)*N_CBPS) = encode_data(j+1 + (i-1)*N_CBPS);
         disp([encode_data(j+1 + (i-1)*48), S*floor(index/S) + mod((index + N_CBPS - floor(16*index/N_CBPS)) , S)-1] );
    end
    fprintf(o , "%d\n" , Interleave_stage1);
end

fclose(o);
