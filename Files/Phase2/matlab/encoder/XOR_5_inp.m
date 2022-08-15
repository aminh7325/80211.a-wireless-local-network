function [X_or] = XOR_5_inp(in1 , in2 , in3 , in4 , in5 )
%UNTITLED2 Summary of this function goes here
D1 = xor(in1 , in2);
D2 = xor(in3 , in4);
D3 = xor(D1 , in5);
X_or = xor(D3 , D2);
end

