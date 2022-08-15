clear;
clc;
f = fopen('Out_Transmitter.txt' , 'r');%Read data that transmitter send
o = fopen('Out_Receiver.txt' , 'w+');%Save output of receiver for verification
data_in = fscanf(f , "%d");
flag = 1;
counter = 1;
while(flag)%Check when a new frame come
    preamble(counter) = data_in(counter);
    if(preamble(counter) == 1)
        counter = counter + 1;
    end
    if(counter == 12)
        flag = 0;
        preamble(counter) = data_in(counter);
    end
end
for i=1:24 %Save SIGNAL Frame
    signal_d(i) = data_in(i+counter);
end
index = i + counter;
rate = signal_d(1:4);
rate_bin = dec2bin(rate);
length_d = signal_d(6:17);
rate_param = SET_RATE_PARAMS_R(rate_bin);%Calculate different parameters of Data rate
                                     % of 6Mbit/s (NBPSC ,NCBPS ,NDBPS)
N_SYM = ceil((16 + 8*5+6)/rate_param.NDBPS);
N_DATA = N_SYM * rate_param.NDBPS;
N_PAD = N_DATA - (16 + 8 * 5 + 6);
n_pad = dec2bin(N_PAD , 6);
in = data_in(index+1:index+(N_DATA*2));
scramble_state = [1 ,0 ,1 ,1 ,0 ,1 ,1 ];

%%Deinterleaver
N_CBPS = rate_param.NCBPS; %This part in Phase4 will be one of inputs that come from
             % Signal field of input frame
N_BPSC = rate_param.NBPSC; %This part in Phase4 will be one of inputs that come from
             % Signal field of input frame
if(N_BPSC/2 < 1)
    S = 1;
else
    S = N_BPSC/2;
end
step = length(in)/N_CBPS;
out_deinterleaver = zeros(2*N_DATA , 1);
for i=1:step
    deInterleave_stage1 = zeros(N_CBPS , 1);
    for j=0:N_CBPS-1
         index =(S*floor(j/S) + mod((j + floor(16 * j/N_CBPS)) , S));
         deInterleave_stage1(16*index - (N_CBPS - 1)*floor(16*index/N_CBPS) + 1) = in(j+1 + (i-1)*N_CBPS);
         out_deinterleaver(16*index - (N_CBPS - 1)*floor(16*index/N_CBPS) + 1 + (i-1)*N_CBPS) = in(j+1 + (i-1)*N_CBPS);
    end
end
%%
%%Viterbi_Decoder
Num_data_in = N_DATA*2;
state_Num = 64;
state = 1:64;
node_Cost = zeros(state_Num , Num_data_in/2+1);
node = zeros(state_Num , Num_data_in/2+1);
in = out_deinterleaver;
for i=1:Num_data_in/2
    a = dec2bin(in(2*i-1));
    b = dec2bin(in(2*i));
    data(i) = bin2dec([a , b])+1;
end
node(1,1) = 1;%%Mark node as visited
trace = zeros(state_Num , Num_data_in/2 );
trace_back = zeros(state_Num , Num_data_in/2 );
for i=1:Num_data_in/2
    for j=1:state_Num
        if(node(j , i) == 1)
            [Next_state0 , in0 , out0 , Next_state1 , in1 , out1] = Calc_state(state(j));
             if(cost_calc(data(i) , out0) + node_Cost(j , i) < node_Cost(Next_state0 , i+1)  || node(Next_state0 , i+1)==0)
                 node(Next_state0 , i+1) = 1;
                 node_Cost(Next_state0 , i+1) = cost_calc(data(i) , out0) + node_Cost(j , i);
                 if(i==1)
                      trace(Next_state0 , i) = in0;
                 else
                      trace(Next_state0 , 1:i) = [trace_back(j , 1:i-1) , in0];
                 end
             end
             if(cost_calc(data(i) , out1) + node_Cost(j , i) < node_Cost(Next_state1 , i+1)  || node(Next_state1 , i+1)==0)
                 node(Next_state1 , i+1) = 1;
                 node_Cost(Next_state1 , i+1) = cost_calc(data(i) , out1) + node_Cost(j , i);
                 if(i==1)
                      trace(Next_state1 , i) = in1;
                 else
                      trace(Next_state1 , 1:i) = [trace_back(j , 1:i-1) , in1];
                 end
             end
            
        end 
    end
    trace_back = trace;
end
%Compare last iteration for find node that we should trace back
min = 1;
for i=2 : state_Num
    if(node_Cost(i ,Num_data_in/2+1) < node_Cost(min ,Num_data_in/2+1))
        min = i;
    end  
end
decode = zeros(Num_data_in/2 , 1);
for i=1:Num_data_in/2
       decode(i) = trace(min,i);
end
%%
%Descramble
data_d = zeros(Num_data_in/2 , 1);
for i=1:Num_data_in/2
    scramble_data = xor(scramble_state(1),scramble_state(4));
    scramble_state = [scramble_state(2:7) ,scramble_data];
    data_d(i) = xor(decode(i) ,scramble_data);
end

for i=1:counter
   fprintf(o , "%d \n" ,   preamble(i));
end
for i=1:24
   fprintf(o , "%d \n" ,   signal_d(i));
end
for i=1:Num_data_in/2
   fprintf(o , "%d \n" ,   data_d(i));
end
fclose(f);
fclose(o);