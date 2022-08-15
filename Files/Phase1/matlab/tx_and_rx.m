clear;
clc;
%%%tx
f = fopen('In.txt' , 'w+');
o = fopen('Out.txt' , 'w+');
x = fopen('N_pad.txt' , 'w+');
rate = dec2bin(13 , 4);
rate_param = SET_RATE_PARAMS(6);
length_n = dec2bin(20 , 12);
N_SYM = ceil((16 + 8*20+6)/rate_param.NDBPS);
N_DATA = N_SYM * rate_param.NDBPS;
N_PAD = N_DATA - (16 + 8 * 20 + 6);
n_pad = dec2bin(N_PAD , 6);
fprintf(x ,'%c' , n_pad(:));
scramble_state = [1 ,0 ,1 ,1 ,0 ,1 ,1 ];
psdu = floor(2.*rand(1 ,bin2dec([length_n,'000'])));
signal_preamble = ['111111111111'  , rate ,'0' ,length_n ,'0' ,'000000'];
for i=1:length(signal_preamble)
    fprintf(f ,'%c \t' , signal_preamble(i));
    fprintf(o ,'%c \t' , signal_preamble(i));
end
data = [zeros(1,16) ,psdu ,zeros(1,6) ,  zeros(1 , N_PAD)];
dataout = [zeros(1,16) ,psdu ,zeros(1,6) , zeros(1 , N_PAD)];
for i=1:length(data)
    fprintf(f ,'%d \t' , data(i));
    scramble_data = xor(scramble_state(1),scramble_state(4));
    scramble_state = [scramble_state(2:7) ,scramble_data];
    dataout(i) = xor(data(i) ,scramble_data);
    fprintf(o ,'%d \t' , dataout(i));
end
send = [signal_preamble , dataout];
fclose(f);
fclose(o);
fclose(x);
%%
%%%rx
scramble_state = [1 ,0 ,1 ,1 ,0 ,1 ,1 ];
flag = 1;
counter = 0;
while(flag)
    preamble(i) = send(i);
    if(preamble(i) == 1)
        counter = counter + 1;
    end
    if(counter == 12)
        flag = 0;
    end
end
for i=1:length(signal_preamble)-counter
    signal_d(i) = send(i+counter);
end
for i=25:length(send)-12
    scramble_data = xor(scramble_state(1),scramble_state(4));
    scramble_state = [scramble_state(2:7) ,scramble_data];
    data_d(i-24) = xor(send(i+counter) ,scramble_data);
end
%%
function RATE_PARAMS = SET_RATE_PARAMS(rate_tmp)
    switch(rate_tmp)
        case 6
            nbpsc = 1;
            ncbps = 48;
            ndbps = 24;
        case 12
            nbpsc = 2;
            ncbps = 96;
            ndbps = 48;
        case 24
            nbpsc = 4;
            ncbps = 192;
            ndbps = 96;
        otherwise
            disp('Error - RATE');
    end
    RATE_PARAMS = struct('NBPSC', nbpsc, 'NCBPS', ncbps, 'NDBPS', ndbps);

end

