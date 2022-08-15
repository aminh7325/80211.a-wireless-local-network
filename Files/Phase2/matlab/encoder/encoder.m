clear;
clc;
%%%tx
f = fopen('In.txt');
x = fscanf(f , '%d');
%encode
rate = 0;
if(rate == 0)%%0: rate = 1/2
o = fopen('Out_rate0.txt' , 'w+');
encode_state = [0 , 0 , 0 , 0 , 0 , 0 , 0];
encode_data = zeros(72 , 1);
for i=1:36
       encode_data(2*i-1) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + x(i) , 2);
       encode_data(2*i) = mod(encode_state(1)+encode_state(2) + encode_state(3) + encode_state(6) + x(i) , 2);
        encode_state(2:6) = encode_state(1:5);
        encode_state(1) = x(i);
        disp(encode_state);
end
fprintf(o , '%d \n' , encode_data );
fclose(o);
end
%%

rate = 1;
encode_data = zeros(length(x) , 1);
if(rate == 1) %% 1: rate = 2/3
  o = fopen('Out_rate1.txt' , 'w+');  
   encode_state = [0 , 0 , 0 , 0 , 0 , 0 , 0];
   for i=1:length(x)
        if mod(i, 2) == 1
            encode_data((3*i-1)/2) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + x(i) , 2);
            encode_data((3*i+1)/2) = mod(encode_state(1)+encode_state(2) + encode_state(3) + encode_state(6) + x(i) , 2);
        end
        if mod(i,2) == 0
            encode_data((3*i)/2) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + x(i) , 2);
        end
        
        encode_state(2:6) = encode_state(1:5);
        encode_state(1) = x(i);
   end
   fprintf( o , '%d\r\n' , encode_data);
   fclose(o);
end

%%
rate = 2;
encode_data = zeros(length(x) , 1);
if(rate == 2)
 o = fopen('Out_rate2.txt' , 'w+');  
   encode_state = [0 , 0 , 0 , 0 , 0 , 0 , 0];
   for i=1:length(x)  
        if mod(i, 3) == 2
            encode_data((4*i+1)/3) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + x(i) , 2);
        end
        
        if mod(i, 3) == 1
            encode_data((4*i-1)/3) = mod(encode_state(2)+ encode_state(3)+ encode_state(5)+encode_state(6) + x(i) , 2);
            encode_data((4*i+2)/3) = mod(encode_state(1)+encode_state(2) + encode_state(3) + encode_state(6) + x(i) , 2);
        end
        
        if mod(i, 3) == 0
            encode_data((4*i)/3) = mod(encode_state(1)+encode_state(2) + encode_state(3) + encode_state(6) + x(i) , 2);
        end
              
        encode_state(2:6) = encode_state(1:5);
        encode_state(1) = x(i);
   end
   fprintf( o , '%d\r\n' , encode_data);
   fclose(o);
   fclose(f);
end