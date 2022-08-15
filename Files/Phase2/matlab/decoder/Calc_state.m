    function[state0 , in0 , out0 , state1 , in1 , out1]= Calc_state(in)
        CS = dec2bin(in-1 , 6);
        in0 = 0;
        in1 = 1;       
        state0 = 1 + bin2dec(['0',CS(1,1:5)]);
        state1 = 1 + bin2dec(['1',CS(1,1:5)]);
    a = dec2bin(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec('0'),bin2dec(CS(6))))),bin2dec(CS(5))))),bin2dec(CS(3))))),bin2dec(CS(2))))));
    b =dec2bin(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec('0'),bin2dec(CS(6))))),bin2dec(CS(3))))),bin2dec(CS(2))))),bin2dec(CS(1))))));
    out0 = bin2dec([a,b])+1; 
    a = dec2bin(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec('1'),bin2dec(CS(6))))),bin2dec(CS(5))))),bin2dec(CS(3))))),bin2dec(CS(2))))));
    b =dec2bin(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec(dec2bin(xor(bin2dec('1'),bin2dec(CS(6))))),bin2dec(CS(3))))),bin2dec(CS(2))))),bin2dec(CS(1))))));
    out1 = bin2dec([a,b])+1;
    end