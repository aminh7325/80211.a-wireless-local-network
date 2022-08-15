clear;
clc;
Num_data_in = 72;
state_Num = 64;
state = 1:64;
node_Cost = zeros(state_Num , Num_data_in/2+1);
node = zeros(state_Num , Num_data_in/2+1);
f = fopen('Out_rate0.txt');
in = fscanf(f , '%d');
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
decoded=fopen('decoder_m.txt' , 'w+');
trace(min,:);
for i=1:36
        fprintf(decoded,'%c\n' , dec2bin(trace(min,i)));
end
fclose(decoded);