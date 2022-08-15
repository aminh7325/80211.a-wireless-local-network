module viterbi_decoder(
    data_in,
    Clk,
    reset,
    data_out
);
    parameter state1 = 1 , state2 = 2 , state3 = 3 ,state4 = 4 , state5 = 5 ,state6 = 6 , state7 = 7 ,state8 = 8 ,state9 = 9 ,state10 = 10 ,state11 = 11
     , state12 = 12 , state13 = 13 , state14 = 14 , state15 = 15 , state16 = 16 , state17 = 17 , state18 = 18 , state19 = 19 , state20 = 20 , state21 = 21 ,state22 = 22
     , state23 = 23 , state24 = 24 , state25 = 25 , state26 = 26 , state27 = 27 , state28 = 28 , state29 = 29 , state30 = 30 , state31 = 31 , state32 = 32 , state33 = 33
    , state34 = 34 , state35 = 35 , state36 = 36 , state37 = 37 , state38 = 38 , state39 = 39 , state40 = 40 , state41 = 41 , state42 = 42 , state43 = 43 , state44 = 44
    , state45 = 45 , state46 = 46 , state47 = 47 , state48 = 48 , state49 = 49 , state50 = 50 , state51 = 51 , state52 = 52 , state53 = 53 , state54 = 54 , state55 = 55
    , state56 = 56 , state57 = 57 , state58 = 58 , state59 = 59 , state60 = 60 , state61 = 61 , state62 = 62 , state63 = 63 , state64 = 64;

    parameter state_Num = 64;
    parameter data_Num = 72;

    input [1:0]data_in;
    input Clk;
    input reset;
    output reg[data_Num/2-1 : 0]data_out;

    reg [10:0]cost[1:state_Num][1:data_Num/2+1];
    wire [10:0]cost_wire[1:state_Num];
    reg [1:data_Num/2]trace[1:state_Num];
    wire [1:data_Num/2]next_trace[1:state_Num];
    reg [1:data_Num/2]next_trace_reg[1:state_Num];  
    wire [6:0]NS_0[1:state_Num];
    wire [6:0]NS_1[1:state_Num];
    wire [2:0]out_0[1:state_Num];
    wire [2:0]out_1[1:state_Num];
    wire [2:0]hamming0[1:state_Num];
    wire [2:0]hamming1[1:state_Num];
    wire in0;
    wire in1;
    reg [10:0]counter;
    reg [6:0]index=6'd1;
    integer i , j;
    assign in0 = 0;
    assign in1 = 1;

    always@(posedge Clk, negedge reset)
    begin
	if(!reset)
	begin
		counter<=1;
		for(i=1;i<=state_Num;i=i+1)
		begin
			for(j=1;j<=data_Num/2+1;j=j+1)
			begin
			if(i==1&&j==1)
			cost[i][j]<=11'd0;
			else
			cost[i][j]<=11'd300;
			end
			for(j=1;j<data_Num/2+1;j=j+1)
			begin
			if(i==1)
			trace[i][j]<=1'd0;
			end
		end
	end
	else
	begin
	counter<=counter+1;
	for(i=1;i<=state_Num;i=i+1)
	begin
	trace[i]<=next_trace[i];
    cost[i][counter+1]<= cost_wire[i];
	end
	if(counter==data_Num/2)
	begin
	
		for(i=2;i<=state_Num;i=i+1)
		begin
			begin
				if(cost[i][data_Num/2+1]<cost[index][data_Num/2+1])
				index=i;
			end
		end	
		data_out<=next_trace[index];
	end
	end
end

    calc_state c_state1(.CS(state1), .NS0(NS_0[1]), .NS1(NS_1[1]) , .out0(out_0[1]),.out1(out_1[1]) );
    calc_state c_state2(.CS(state2), .NS0(NS_0[2]), .NS1(NS_1[2]) , .out0(out_0[2]),.out1(out_1[2]) );
    calc_state c_state3(.CS(state3), .NS0(NS_0[3]), .NS1(NS_1[3]) , .out0(out_0[3]),.out1(out_1[3]) );
    calc_state c_state4(.CS(state4), .NS0(NS_0[4]), .NS1(NS_1[4]) , .out0(out_0[4]),.out1(out_1[4]) );
    calc_state c_state5(.CS(state5), .NS0(NS_0[5]), .NS1(NS_1[5]) , .out0(out_0[5]),.out1(out_1[5]) );
    calc_state c_state6(.CS(state6), .NS0(NS_0[6]), .NS1(NS_1[6]) , .out0(out_0[6]),.out1(out_1[6]) );
    calc_state c_state7(.CS(state7), .NS0(NS_0[7]), .NS1(NS_1[7]) , .out0(out_0[7]),.out1(out_1[7]) );
    calc_state c_state8(.CS(state8), .NS0(NS_0[8]), .NS1(NS_1[8]) , .out0(out_0[8]),.out1(out_1[8]) );
    calc_state c_state9(.CS(state9), .NS0(NS_0[9]), .NS1(NS_1[9]) , .out0(out_0[9]),.out1(out_1[9]) );
    calc_state c_state10(.CS(state10), .NS0(NS_0[10]), .NS1(NS_1[10]) , .out0(out_0[10]),.out1(out_1[10]) );
    calc_state c_state11(.CS(state11), .NS0(NS_0[11]), .NS1(NS_1[11]) , .out0(out_0[11]),.out1(out_1[11]) );
    calc_state c_state12(.CS(state12), .NS0(NS_0[12]), .NS1(NS_1[12]) , .out0(out_0[12]),.out1(out_1[12]) );
    calc_state c_state13(.CS(state13), .NS0(NS_0[13]), .NS1(NS_1[13]) , .out0(out_0[13]),.out1(out_1[13]) );
    calc_state c_state14(.CS(state14), .NS0(NS_0[14]), .NS1(NS_1[14]) , .out0(out_0[14]),.out1(out_1[14]) );
    calc_state c_state15(.CS(state15), .NS0(NS_0[15]), .NS1(NS_1[15]) , .out0(out_0[15]),.out1(out_1[15]) );
    calc_state c_state16(.CS(state16), .NS0(NS_0[16]), .NS1(NS_1[16]) , .out0(out_0[16]),.out1(out_1[16]) );
    calc_state c_state17(.CS(state17), .NS0(NS_0[17]), .NS1(NS_1[17]) , .out0(out_0[17]),.out1(out_1[17]) );
    calc_state c_state18(.CS(state18), .NS0(NS_0[18]), .NS1(NS_1[18]) , .out0(out_0[18]),.out1(out_1[18]) );
    calc_state c_state19(.CS(state19), .NS0(NS_0[19]), .NS1(NS_1[19]) , .out0(out_0[19]),.out1(out_1[19]) );
    calc_state c_state20(.CS(state20), .NS0(NS_0[20]), .NS1(NS_1[20]) , .out0(out_0[20]),.out1(out_1[20]) );
    calc_state c_state21(.CS(state21), .NS0(NS_0[21]), .NS1(NS_1[21]) , .out0(out_0[21]),.out1(out_1[21]) );
    calc_state c_state22(.CS(state22), .NS0(NS_0[22]), .NS1(NS_1[22]) , .out0(out_0[22]),.out1(out_1[22]) );
    calc_state c_state23(.CS(state23), .NS0(NS_0[23]), .NS1(NS_1[23]) , .out0(out_0[23]),.out1(out_1[23]) );
    calc_state c_state24(.CS(state24), .NS0(NS_0[24]), .NS1(NS_1[24]) , .out0(out_0[24]),.out1(out_1[24]) );
    calc_state c_state25(.CS(state25), .NS0(NS_0[25]), .NS1(NS_1[25]) , .out0(out_0[25]),.out1(out_1[25]) );
    calc_state c_state26(.CS(state26), .NS0(NS_0[26]), .NS1(NS_1[26]) , .out0(out_0[26]),.out1(out_1[26]) );
    calc_state c_state27(.CS(state27), .NS0(NS_0[27]), .NS1(NS_1[27]) , .out0(out_0[27]),.out1(out_1[27]) );
    calc_state c_state28(.CS(state28), .NS0(NS_0[28]), .NS1(NS_1[28]) , .out0(out_0[28]),.out1(out_1[28]) );
    calc_state c_state29(.CS(state29), .NS0(NS_0[29]), .NS1(NS_1[29]) , .out0(out_0[29]),.out1(out_1[29]) );
    calc_state c_state30(.CS(state30), .NS0(NS_0[30]), .NS1(NS_1[30]) , .out0(out_0[30]),.out1(out_1[30]) );
    calc_state c_state31(.CS(state31), .NS0(NS_0[31]), .NS1(NS_1[31]) , .out0(out_0[31]),.out1(out_1[31]) );
    calc_state c_state32(.CS(state32), .NS0(NS_0[32]), .NS1(NS_1[32]) , .out0(out_0[32]),.out1(out_1[32]) );
    calc_state c_state33(.CS(state33), .NS0(NS_0[33]), .NS1(NS_1[33]) , .out0(out_0[33]),.out1(out_1[33]) );
    calc_state c_state34(.CS(state34), .NS0(NS_0[34]), .NS1(NS_1[34]) , .out0(out_0[34]),.out1(out_1[34]) );
    calc_state c_state35(.CS(state35), .NS0(NS_0[35]), .NS1(NS_1[35]) , .out0(out_0[35]),.out1(out_1[35]) );
    calc_state c_state36(.CS(state36), .NS0(NS_0[36]), .NS1(NS_1[36]) , .out0(out_0[36]),.out1(out_1[36]) );
    calc_state c_state37(.CS(state37), .NS0(NS_0[37]), .NS1(NS_1[37]) , .out0(out_0[37]),.out1(out_1[37]) );
    calc_state c_state38(.CS(state38), .NS0(NS_0[38]), .NS1(NS_1[38]) , .out0(out_0[38]),.out1(out_1[38]) );
    calc_state c_state39(.CS(state39), .NS0(NS_0[39]), .NS1(NS_1[39]) , .out0(out_0[39]),.out1(out_1[39]) );
    calc_state c_state40(.CS(state40), .NS0(NS_0[40]), .NS1(NS_1[40]) , .out0(out_0[40]),.out1(out_1[40]) );
    calc_state c_state41(.CS(state41), .NS0(NS_0[41]), .NS1(NS_1[41]) , .out0(out_0[41]),.out1(out_1[41]) );
    calc_state c_state42(.CS(state42), .NS0(NS_0[42]), .NS1(NS_1[42]) , .out0(out_0[42]),.out1(out_1[42]) );
    calc_state c_state43(.CS(state43), .NS0(NS_0[43]), .NS1(NS_1[43]) , .out0(out_0[43]),.out1(out_1[43]) );
    calc_state c_state44(.CS(state44), .NS0(NS_0[44]), .NS1(NS_1[44]) , .out0(out_0[44]),.out1(out_1[44]) );
    calc_state c_state45(.CS(state45), .NS0(NS_0[45]), .NS1(NS_1[45]) , .out0(out_0[45]),.out1(out_1[45]) );
    calc_state c_state46(.CS(state46), .NS0(NS_0[46]), .NS1(NS_1[46]) , .out0(out_0[46]),.out1(out_1[46]) );
    calc_state c_state47(.CS(state47), .NS0(NS_0[47]), .NS1(NS_1[47]) , .out0(out_0[47]),.out1(out_1[47]) );
    calc_state c_state48(.CS(state48), .NS0(NS_0[48]), .NS1(NS_1[48]) , .out0(out_0[48]),.out1(out_1[48]) );
    calc_state c_state49(.CS(state49), .NS0(NS_0[49]), .NS1(NS_1[49]) , .out0(out_0[49]),.out1(out_1[49]) );
    calc_state c_state50(.CS(state50), .NS0(NS_0[50]), .NS1(NS_1[50]) , .out0(out_0[50]),.out1(out_1[50]) );
    calc_state c_state51(.CS(state51), .NS0(NS_0[51]), .NS1(NS_1[51]) , .out0(out_0[51]),.out1(out_1[51]) );
    calc_state c_state52(.CS(state52), .NS0(NS_0[52]), .NS1(NS_1[52]) , .out0(out_0[52]),.out1(out_1[52]) );
    calc_state c_state53(.CS(state53), .NS0(NS_0[53]), .NS1(NS_1[53]) , .out0(out_0[53]),.out1(out_1[53]) );
    calc_state c_state54(.CS(state54), .NS0(NS_0[54]), .NS1(NS_1[54]) , .out0(out_0[54]),.out1(out_1[54]) );
    calc_state c_state55(.CS(state55), .NS0(NS_0[55]), .NS1(NS_1[55]) , .out0(out_0[55]),.out1(out_1[55]) );
    calc_state c_state56(.CS(state56), .NS0(NS_0[56]), .NS1(NS_1[56]) , .out0(out_0[56]),.out1(out_1[56]) );
    calc_state c_state57(.CS(state64), .NS0(NS_0[57]), .NS1(NS_1[57]) , .out0(out_0[57]),.out1(out_1[57]) );
    calc_state c_state58(.CS(state58), .NS0(NS_0[58]), .NS1(NS_1[58]) , .out0(out_0[58]),.out1(out_1[58]) );
    calc_state c_state59(.CS(state59), .NS0(NS_0[59]), .NS1(NS_1[59]) , .out0(out_0[59]),.out1(out_1[59]) );
    calc_state c_state60(.CS(state60), .NS0(NS_0[60]), .NS1(NS_1[60]) , .out0(out_0[60]),.out1(out_1[60]) );
    calc_state c_state61(.CS(state61), .NS0(NS_0[61]), .NS1(NS_1[61]) , .out0(out_0[61]),.out1(out_1[61]) );
    calc_state c_state62(.CS(state62), .NS0(NS_0[62]), .NS1(NS_1[62]) , .out0(out_0[62]),.out1(out_1[62]) );
    calc_state c_state63(.CS(state63), .NS0(NS_0[63]), .NS1(NS_1[63]) , .out0(out_0[63]),.out1(out_1[63]) );
    calc_state c_state64(.CS(state64), .NS0(NS_0[64]), .NS1(NS_1[64]) , .out0(out_0[64]),.out1(out_1[64]) );

    hamming_calc hamming_state1(.x(data_in) , .y(out_0[1]) , .m(out_1[1]), .z(hamming0[1]) , .z1(hamming1[1]));
    hamming_calc hamming_state2(.x(data_in) , .y(out_0[2]) , .m(out_1[2]), .z(hamming0[2]) , .z1(hamming1[2]));
    hamming_calc hamming_state3(.x(data_in) , .y(out_0[3]) , .m(out_1[3]), .z(hamming0[3]) , .z1(hamming1[3]));
    hamming_calc hamming_state4(.x(data_in) , .y(out_0[4]) , .m(out_1[4]), .z(hamming0[4]) , .z1(hamming1[4]));
    hamming_calc hamming_state5(.x(data_in) , .y(out_0[5]) , .m(out_1[5]), .z(hamming0[5]) , .z1(hamming1[5]));
    hamming_calc hamming_state6(.x(data_in) , .y(out_0[6]) , .m(out_1[6]), .z(hamming0[6]) , .z1(hamming1[6]));
    hamming_calc hamming_state7(.x(data_in) , .y(out_0[7]) , .m(out_1[7]), .z(hamming0[7]) , .z1(hamming1[7]));
    hamming_calc hamming_state8(.x(data_in) , .y(out_0[8]) , .m(out_1[8]), .z(hamming0[8]) , .z1(hamming1[8]));
    hamming_calc hamming_state9(.x(data_in) , .y(out_0[9]) , .m(out_1[9]), .z(hamming0[9]) , .z1(hamming1[9]));
    hamming_calc hamming_state10(.x(data_in) , .y(out_0[10]) , .m(out_1[10]), .z(hamming0[10]) , .z1(hamming1[10]));
    hamming_calc hamming_state11(.x(data_in) , .y(out_0[11]) , .m(out_1[11]), .z(hamming0[11]) , .z1(hamming1[11]));
    hamming_calc hamming_state12(.x(data_in) , .y(out_0[12]) , .m(out_1[12]), .z(hamming0[12]) , .z1(hamming1[12]));
    hamming_calc hamming_state13(.x(data_in) , .y(out_0[13]) , .m(out_1[13]), .z(hamming0[13]) , .z1(hamming1[13]));
    hamming_calc hamming_state14(.x(data_in) , .y(out_0[14]) , .m(out_1[14]), .z(hamming0[14]) , .z1(hamming1[14]));
    hamming_calc hamming_state15(.x(data_in) , .y(out_0[15]) , .m(out_1[15]), .z(hamming0[15]) , .z1(hamming1[15]));
    hamming_calc hamming_state16(.x(data_in) , .y(out_0[16]) , .m(out_1[16]), .z(hamming0[16]) , .z1(hamming1[16]));
    hamming_calc hamming_state17(.x(data_in) , .y(out_0[17]) , .m(out_1[17]), .z(hamming0[17]) , .z1(hamming1[17]));
    hamming_calc hamming_state18(.x(data_in) , .y(out_0[18]) , .m(out_1[18]), .z(hamming0[18]) , .z1(hamming1[18]));
    hamming_calc hamming_state19(.x(data_in) , .y(out_0[19]) , .m(out_1[19]), .z(hamming0[19]) , .z1(hamming1[19]));
    hamming_calc hamming_state20(.x(data_in) , .y(out_0[20]) , .m(out_1[20]), .z(hamming0[20]) , .z1(hamming1[20]));
    hamming_calc hamming_state21(.x(data_in) , .y(out_0[21]) , .m(out_1[21]), .z(hamming0[21]) , .z1(hamming1[21]));
    hamming_calc hamming_state22(.x(data_in) , .y(out_0[22]) , .m(out_1[22]), .z(hamming0[22]) , .z1(hamming1[22]));
    hamming_calc hamming_state23(.x(data_in) , .y(out_0[23]) , .m(out_1[23]), .z(hamming0[23]) , .z1(hamming1[23]));
    hamming_calc hamming_state24(.x(data_in) , .y(out_0[24]) , .m(out_1[24]), .z(hamming0[24]) , .z1(hamming1[24]));
    hamming_calc hamming_state25(.x(data_in) , .y(out_0[25]) , .m(out_1[25]), .z(hamming0[25]) , .z1(hamming1[25]));
    hamming_calc hamming_state26(.x(data_in) , .y(out_0[26]) , .m(out_1[26]), .z(hamming0[26]) , .z1(hamming1[26]));
    hamming_calc hamming_state27(.x(data_in) , .y(out_0[27]) , .m(out_1[27]), .z(hamming0[27]) , .z1(hamming1[27]));
    hamming_calc hamming_state28(.x(data_in) , .y(out_0[28]) , .m(out_1[28]), .z(hamming0[28]) , .z1(hamming1[28]));
    hamming_calc hamming_state29(.x(data_in) , .y(out_0[29]) , .m(out_1[29]), .z(hamming0[29]) , .z1(hamming1[29]));
    hamming_calc hamming_state30(.x(data_in) , .y(out_0[30]) , .m(out_1[30]), .z(hamming0[30]) , .z1(hamming1[30]));
    hamming_calc hamming_state31(.x(data_in) , .y(out_0[31]) , .m(out_1[31]), .z(hamming0[31]) , .z1(hamming1[31]));
    hamming_calc hamming_state32(.x(data_in) , .y(out_0[32]) , .m(out_1[32]), .z(hamming0[32]) , .z1(hamming1[32]));
    hamming_calc hamming_state33(.x(data_in) , .y(out_0[33]) , .m(out_1[33]), .z(hamming0[33]) , .z1(hamming1[33]));
    hamming_calc hamming_state34(.x(data_in) , .y(out_0[34]) , .m(out_1[34]), .z(hamming0[34]) , .z1(hamming1[34]));
    hamming_calc hamming_state35(.x(data_in) , .y(out_0[35]) , .m(out_1[35]), .z(hamming0[35]) , .z1(hamming1[35]));
    hamming_calc hamming_state36(.x(data_in) , .y(out_0[36]) , .m(out_1[36]), .z(hamming0[36]) , .z1(hamming1[36]));
    hamming_calc hamming_state37(.x(data_in) , .y(out_0[37]) , .m(out_1[37]), .z(hamming0[37]) , .z1(hamming1[37]));
    hamming_calc hamming_state38(.x(data_in) , .y(out_0[38]) , .m(out_1[38]), .z(hamming0[38]) , .z1(hamming1[38]));
    hamming_calc hamming_state39(.x(data_in) , .y(out_0[39]) , .m(out_1[39]), .z(hamming0[39]) , .z1(hamming1[39]));
    hamming_calc hamming_state40(.x(data_in) , .y(out_0[40]) , .m(out_1[40]), .z(hamming0[40]) , .z1(hamming1[40]));
    hamming_calc hamming_state41(.x(data_in) , .y(out_0[41]) , .m(out_1[41]), .z(hamming0[41]) , .z1(hamming1[41]));
    hamming_calc hamming_state42(.x(data_in) , .y(out_0[42]) , .m(out_1[42]), .z(hamming0[42]) , .z1(hamming1[42]));
    hamming_calc hamming_state43(.x(data_in) , .y(out_0[43]) , .m(out_1[43]), .z(hamming0[43]) , .z1(hamming1[43]));
    hamming_calc hamming_state44(.x(data_in) , .y(out_0[44]) , .m(out_1[44]), .z(hamming0[44]) , .z1(hamming1[44]));
    hamming_calc hamming_state45(.x(data_in) , .y(out_0[45]) , .m(out_1[45]), .z(hamming0[45]) , .z1(hamming1[45]));
    hamming_calc hamming_state46(.x(data_in) , .y(out_0[46]) , .m(out_1[46]), .z(hamming0[46]) , .z1(hamming1[46]));
    hamming_calc hamming_state47(.x(data_in) , .y(out_0[47]) , .m(out_1[47]), .z(hamming0[47]) , .z1(hamming1[47]));
    hamming_calc hamming_state48(.x(data_in) , .y(out_0[48]) , .m(out_1[48]), .z(hamming0[48]) , .z1(hamming1[48]));
    hamming_calc hamming_state49(.x(data_in) , .y(out_0[49]) , .m(out_1[49]), .z(hamming0[49]) , .z1(hamming1[49]));
    hamming_calc hamming_state50(.x(data_in) , .y(out_0[50]) , .m(out_1[50]), .z(hamming0[50]) , .z1(hamming1[50]));
    hamming_calc hamming_state51(.x(data_in) , .y(out_0[51]) , .m(out_1[51]), .z(hamming0[51]) , .z1(hamming1[51]));
    hamming_calc hamming_state52(.x(data_in) , .y(out_0[52]) , .m(out_1[52]), .z(hamming0[52]) , .z1(hamming1[52]));
    hamming_calc hamming_state53(.x(data_in) , .y(out_0[53]) , .m(out_1[53]), .z(hamming0[53]) , .z1(hamming1[53]));
    hamming_calc hamming_state54(.x(data_in) , .y(out_0[54]) , .m(out_1[54]), .z(hamming0[54]) , .z1(hamming1[54]));
    hamming_calc hamming_state55(.x(data_in) , .y(out_0[55]) , .m(out_1[55]), .z(hamming0[55]) , .z1(hamming1[55]));
    hamming_calc hamming_state56(.x(data_in) , .y(out_0[56]) , .m(out_1[56]), .z(hamming0[56]) , .z1(hamming1[56]));
    hamming_calc hamming_state57(.x(data_in) , .y(out_0[57]) , .m(out_1[57]), .z(hamming0[57]) , .z1(hamming1[57]));
    hamming_calc hamming_state58(.x(data_in) , .y(out_0[58]) , .m(out_1[58]), .z(hamming0[58]) , .z1(hamming1[58]));
    hamming_calc hamming_state59(.x(data_in) , .y(out_0[59]) , .m(out_1[59]), .z(hamming0[59]) , .z1(hamming1[59]));
    hamming_calc hamming_state60(.x(data_in) , .y(out_0[60]) , .m(out_1[60]), .z(hamming0[60]) , .z1(hamming1[60]));
    hamming_calc hamming_state61(.x(data_in) , .y(out_0[61]) , .m(out_1[61]), .z(hamming0[61]) , .z1(hamming1[61]));
    hamming_calc hamming_state62(.x(data_in) , .y(out_0[62]) , .m(out_1[62]), .z(hamming0[62]) , .z1(hamming1[62]));
    hamming_calc hamming_state63(.x(data_in) , .y(out_0[63]) , .m(out_1[63]), .z(hamming0[63]) , .z1(hamming1[63]));
    hamming_calc hamming_state64(.x(data_in) , .y(out_0[64]) , .m(out_1[64]), .z(hamming0[64]) , .z1(hamming1[64]));

    Compare NS_state1(.cost1(cost[1][counter]),.cost2(cost[2][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[1]),.hamming2(hamming0[2]),.trace1(trace[1]),.trace2(trace[2]),.outputcost(cost_wire[1]),.outputtrace(next_trace[1]),.column(counter));
    Compare NS_state2(.cost1(cost[3][counter]),.cost2(cost[4][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[3]),.hamming2(hamming0[4]),.trace1(trace[3]),.trace2(trace[4]),.outputcost(cost_wire[2]),.outputtrace(next_trace[2]),.column(counter));
    Compare NS_state3(.cost1(cost[5][counter]),.cost2(cost[6][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[5]),.hamming2(hamming0[6]),.trace1(trace[5]),.trace2(trace[6]),.outputcost(cost_wire[3]),.outputtrace(next_trace[3]),.column(counter));
    Compare NS_state4(.cost1(cost[7][counter]),.cost2(cost[8][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[7]),.hamming2(hamming0[8]),.trace1(trace[7]),.trace2(trace[8]),.outputcost(cost_wire[4]),.outputtrace(next_trace[4]),.column(counter));
    Compare NS_state5(.cost1(cost[9][counter]),.cost2(cost[10][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[9]),.hamming2(hamming0[10]),.trace1(trace[9]),.trace2(trace[10]),.outputcost(cost_wire[5]),.outputtrace(next_trace[5]),.column(counter));
    Compare NS_state6(.cost1(cost[11][counter]),.cost2(cost[12][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[11]),.hamming2(hamming0[12]),.trace1(trace[11]),.trace2(trace[12]),.outputcost(cost_wire[6]),.outputtrace(next_trace[6]),.column(counter));
    Compare NS_state7(.cost1(cost[13][counter]),.cost2(cost[14][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[13]),.hamming2(hamming0[14]),.trace1(trace[13]),.trace2(trace[14]),.outputcost(cost_wire[7]),.outputtrace(next_trace[7]),.column(counter));
    Compare NS_state8(.cost1(cost[15][counter]),.cost2(cost[16][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[15]),.hamming2(hamming0[16]),.trace1(trace[15]),.trace2(trace[16]),.outputcost(cost_wire[8]),.outputtrace(next_trace[8]),.column(counter));
    Compare NS_state9(.cost1(cost[17][counter]),.cost2(cost[18][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[17]),.hamming2(hamming0[18]),.trace1(trace[17]),.trace2(trace[18]),.outputcost(cost_wire[9]),.outputtrace(next_trace[9]),.column(counter));
    Compare NS_state10(.cost1(cost[19][counter]),.cost2(cost[20][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[19]),.hamming2(hamming0[20]),.trace1(trace[19]),.trace2(trace[20]),.outputcost(cost_wire[10]),.outputtrace(next_trace[10]),.column(counter));
    Compare NS_state11(.cost1(cost[21][counter]),.cost2(cost[22][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[21]),.hamming2(hamming0[22]),.trace1(trace[21]),.trace2(trace[22]),.outputcost(cost_wire[11]),.outputtrace(next_trace[11]),.column(counter));
    Compare NS_state12(.cost1(cost[23][counter]),.cost2(cost[24][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[23]),.hamming2(hamming0[24]),.trace1(trace[23]),.trace2(trace[24]),.outputcost(cost_wire[12]),.outputtrace(next_trace[12]),.column(counter));
    Compare NS_state13(.cost1(cost[25][counter]),.cost2(cost[26][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[25]),.hamming2(hamming0[26]),.trace1(trace[25]),.trace2(trace[26]),.outputcost(cost_wire[13]),.outputtrace(next_trace[13]),.column(counter));
    Compare NS_state14(.cost1(cost[27][counter]),.cost2(cost[28][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[27]),.hamming2(hamming0[28]),.trace1(trace[27]),.trace2(trace[28]),.outputcost(cost_wire[14]),.outputtrace(next_trace[14]),.column(counter));
    Compare NS_state15(.cost1(cost[29][counter]),.cost2(cost[30][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[29]),.hamming2(hamming0[30]),.trace1(trace[29]),.trace2(trace[30]),.outputcost(cost_wire[15]),.outputtrace(next_trace[15]),.column(counter));
    Compare NS_state16(.cost1(cost[31][counter]),.cost2(cost[32][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[31]),.hamming2(hamming0[32]),.trace1(trace[31]),.trace2(trace[32]),.outputcost(cost_wire[16]),.outputtrace(next_trace[16]),.column(counter));
    Compare NS_state17(.cost1(cost[33][counter]),.cost2(cost[34][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[33]),.hamming2(hamming0[34]),.trace1(trace[33]),.trace2(trace[34]),.outputcost(cost_wire[17]),.outputtrace(next_trace[17]),.column(counter));
    Compare NS_state18(.cost1(cost[35][counter]),.cost2(cost[36][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[35]),.hamming2(hamming0[36]),.trace1(trace[35]),.trace2(trace[36]),.outputcost(cost_wire[18]),.outputtrace(next_trace[18]),.column(counter));
    Compare NS_state19(.cost1(cost[37][counter]),.cost2(cost[38][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[37]),.hamming2(hamming0[38]),.trace1(trace[37]),.trace2(trace[38]),.outputcost(cost_wire[19]),.outputtrace(next_trace[19]),.column(counter));
    Compare NS_state20(.cost1(cost[39][counter]),.cost2(cost[40][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[39]),.hamming2(hamming0[40]),.trace1(trace[39]),.trace2(trace[40]),.outputcost(cost_wire[20]),.outputtrace(next_trace[20]),.column(counter));
    Compare NS_state21(.cost1(cost[41][counter]),.cost2(cost[42][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[41]),.hamming2(hamming0[42]),.trace1(trace[41]),.trace2(trace[42]),.outputcost(cost_wire[21]),.outputtrace(next_trace[21]),.column(counter));
    Compare NS_state22(.cost1(cost[43][counter]),.cost2(cost[44][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[43]),.hamming2(hamming0[44]),.trace1(trace[43]),.trace2(trace[44]),.outputcost(cost_wire[22]),.outputtrace(next_trace[22]),.column(counter));
    Compare NS_state23(.cost1(cost[45][counter]),.cost2(cost[46][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[45]),.hamming2(hamming0[46]),.trace1(trace[45]),.trace2(trace[46]),.outputcost(cost_wire[23]),.outputtrace(next_trace[23]),.column(counter));
    Compare NS_state24(.cost1(cost[47][counter]),.cost2(cost[48][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[47]),.hamming2(hamming0[48]),.trace1(trace[47]),.trace2(trace[48]),.outputcost(cost_wire[24]),.outputtrace(next_trace[24]),.column(counter));
    Compare NS_state25(.cost1(cost[49][counter]),.cost2(cost[50][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[49]),.hamming2(hamming0[50]),.trace1(trace[49]),.trace2(trace[50]),.outputcost(cost_wire[25]),.outputtrace(next_trace[25]),.column(counter));
    Compare NS_state26(.cost1(cost[51][counter]),.cost2(cost[52][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[51]),.hamming2(hamming0[52]),.trace1(trace[51]),.trace2(trace[52]),.outputcost(cost_wire[26]),.outputtrace(next_trace[26]),.column(counter));
    Compare NS_state27(.cost1(cost[53][counter]),.cost2(cost[54][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[53]),.hamming2(hamming0[54]),.trace1(trace[53]),.trace2(trace[54]),.outputcost(cost_wire[27]),.outputtrace(next_trace[27]),.column(counter));
    Compare NS_state28(.cost1(cost[55][counter]),.cost2(cost[56][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[55]),.hamming2(hamming0[56]),.trace1(trace[55]),.trace2(trace[56]),.outputcost(cost_wire[28]),.outputtrace(next_trace[28]),.column(counter));
    Compare NS_state29(.cost1(cost[57][counter]),.cost2(cost[58][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[57]),.hamming2(hamming0[58]),.trace1(trace[57]),.trace2(trace[58]),.outputcost(cost_wire[29]),.outputtrace(next_trace[29]),.column(counter));
    Compare NS_state30(.cost1(cost[59][counter]),.cost2(cost[60][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[59]),.hamming2(hamming0[60]),.trace1(trace[59]),.trace2(trace[60]),.outputcost(cost_wire[30]),.outputtrace(next_trace[30]),.column(counter));
    Compare NS_state31(.cost1(cost[61][counter]),.cost2(cost[62][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[61]),.hamming2(hamming0[62]),.trace1(trace[61]),.trace2(trace[62]),.outputcost(cost_wire[31]),.outputtrace(next_trace[31]),.column(counter));
    Compare NS_state32(.cost1(cost[63][counter]),.cost2(cost[64][counter]),.input1(1'b0),.input2(1'b0),.hamming1(hamming0[63]),.hamming2(hamming0[64]),.trace1(trace[63]),.trace2(trace[64]),.outputcost(cost_wire[32]),.outputtrace(next_trace[32]),.column(counter));
    Compare NS_state33(.cost1(cost[1][counter]),.cost2(cost[2][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[1]),.hamming2(hamming0[2]),.trace1(trace[1]),.trace2(trace[2]),.outputcost(cost_wire[33]),.outputtrace(next_trace[33]),.column(counter));
    Compare NS_state34(.cost1(cost[3][counter]),.cost2(cost[4][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[3]),.hamming2(hamming0[4]),.trace1(trace[3]),.trace2(trace[4]),.outputcost(cost_wire[34]),.outputtrace(next_trace[34]),.column(counter));
    Compare NS_state35(.cost1(cost[5][counter]),.cost2(cost[6][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[5]),.hamming2(hamming0[6]),.trace1(trace[5]),.trace2(trace[6]),.outputcost(cost_wire[35]),.outputtrace(next_trace[35]),.column(counter));
    Compare NS_state36(.cost1(cost[7][counter]),.cost2(cost[8][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[7]),.hamming2(hamming0[8]),.trace1(trace[7]),.trace2(trace[8]),.outputcost(cost_wire[36]),.outputtrace(next_trace[36]),.column(counter));
    Compare NS_state37(.cost1(cost[9][counter]),.cost2(cost[10][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[9]),.hamming2(hamming0[10]),.trace1(trace[9]),.trace2(trace[10]),.outputcost(cost_wire[37]),.outputtrace(next_trace[37]),.column(counter));
    Compare NS_state38(.cost1(cost[11][counter]),.cost2(cost[12][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[11]),.hamming2(hamming0[12]),.trace1(trace[11]),.trace2(trace[12]),.outputcost(cost_wire[38]),.outputtrace(next_trace[38]),.column(counter));
    Compare NS_state39(.cost1(cost[13][counter]),.cost2(cost[14][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[13]),.hamming2(hamming0[14]),.trace1(trace[13]),.trace2(trace[14]),.outputcost(cost_wire[39]),.outputtrace(next_trace[39]),.column(counter));
    Compare NS_state40(.cost1(cost[15][counter]),.cost2(cost[16][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[15]),.hamming2(hamming0[16]),.trace1(trace[15]),.trace2(trace[16]),.outputcost(cost_wire[40]),.outputtrace(next_trace[40]),.column(counter));
    Compare NS_state41(.cost1(cost[17][counter]),.cost2(cost[18][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[17]),.hamming2(hamming0[18]),.trace1(trace[17]),.trace2(trace[18]),.outputcost(cost_wire[41]),.outputtrace(next_trace[41]),.column(counter));
    Compare NS_state42(.cost1(cost[19][counter]),.cost2(cost[20][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[19]),.hamming2(hamming0[20]),.trace1(trace[19]),.trace2(trace[20]),.outputcost(cost_wire[42]),.outputtrace(next_trace[42]),.column(counter));
    Compare NS_state43(.cost1(cost[21][counter]),.cost2(cost[22][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[21]),.hamming2(hamming0[22]),.trace1(trace[21]),.trace2(trace[22]),.outputcost(cost_wire[43]),.outputtrace(next_trace[43]),.column(counter));
    Compare NS_state44(.cost1(cost[23][counter]),.cost2(cost[24][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[23]),.hamming2(hamming0[24]),.trace1(trace[23]),.trace2(trace[24]),.outputcost(cost_wire[44]),.outputtrace(next_trace[44]),.column(counter));
    Compare NS_state45(.cost1(cost[25][counter]),.cost2(cost[26][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[25]),.hamming2(hamming0[26]),.trace1(trace[25]),.trace2(trace[26]),.outputcost(cost_wire[45]),.outputtrace(next_trace[45]),.column(counter));
    Compare NS_state46(.cost1(cost[27][counter]),.cost2(cost[28][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[27]),.hamming2(hamming0[28]),.trace1(trace[27]),.trace2(trace[28]),.outputcost(cost_wire[46]),.outputtrace(next_trace[46]),.column(counter));
    Compare NS_state47(.cost1(cost[29][counter]),.cost2(cost[30][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[29]),.hamming2(hamming0[30]),.trace1(trace[29]),.trace2(trace[30]),.outputcost(cost_wire[47]),.outputtrace(next_trace[47]),.column(counter));
    Compare NS_state48(.cost1(cost[31][counter]),.cost2(cost[32][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[31]),.hamming2(hamming0[32]),.trace1(trace[31]),.trace2(trace[32]),.outputcost(cost_wire[48]),.outputtrace(next_trace[48]),.column(counter));
    Compare NS_state49(.cost1(cost[33][counter]),.cost2(cost[34][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[33]),.hamming2(hamming0[34]),.trace1(trace[33]),.trace2(trace[34]),.outputcost(cost_wire[49]),.outputtrace(next_trace[49]),.column(counter));
    Compare NS_state50(.cost1(cost[35][counter]),.cost2(cost[36][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[35]),.hamming2(hamming0[36]),.trace1(trace[35]),.trace2(trace[36]),.outputcost(cost_wire[50]),.outputtrace(next_trace[50]),.column(counter));
    Compare NS_state51(.cost1(cost[37][counter]),.cost2(cost[38][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[37]),.hamming2(hamming0[38]),.trace1(trace[37]),.trace2(trace[38]),.outputcost(cost_wire[51]),.outputtrace(next_trace[51]),.column(counter));
    Compare NS_state52(.cost1(cost[39][counter]),.cost2(cost[40][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[39]),.hamming2(hamming0[40]),.trace1(trace[39]),.trace2(trace[40]),.outputcost(cost_wire[52]),.outputtrace(next_trace[52]),.column(counter));
    Compare NS_state53(.cost1(cost[41][counter]),.cost2(cost[42][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[41]),.hamming2(hamming0[42]),.trace1(trace[41]),.trace2(trace[42]),.outputcost(cost_wire[53]),.outputtrace(next_trace[53]),.column(counter));
    Compare NS_state54(.cost1(cost[43][counter]),.cost2(cost[44][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[43]),.hamming2(hamming0[44]),.trace1(trace[43]),.trace2(trace[44]),.outputcost(cost_wire[54]),.outputtrace(next_trace[54]),.column(counter));
    Compare NS_state55(.cost1(cost[45][counter]),.cost2(cost[46][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[45]),.hamming2(hamming0[46]),.trace1(trace[45]),.trace2(trace[46]),.outputcost(cost_wire[55]),.outputtrace(next_trace[55]),.column(counter));
    Compare NS_state56(.cost1(cost[47][counter]),.cost2(cost[48][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[47]),.hamming2(hamming0[48]),.trace1(trace[47]),.trace2(trace[48]),.outputcost(cost_wire[56]),.outputtrace(next_trace[56]),.column(counter));
    Compare NS_state57(.cost1(cost[49][counter]),.cost2(cost[50][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[49]),.hamming2(hamming0[50]),.trace1(trace[49]),.trace2(trace[50]),.outputcost(cost_wire[57]),.outputtrace(next_trace[57]),.column(counter));
    Compare NS_state58(.cost1(cost[51][counter]),.cost2(cost[52][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[51]),.hamming2(hamming0[52]),.trace1(trace[51]),.trace2(trace[52]),.outputcost(cost_wire[58]),.outputtrace(next_trace[58]),.column(counter));
    Compare NS_state59(.cost1(cost[53][counter]),.cost2(cost[54][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[53]),.hamming2(hamming0[54]),.trace1(trace[53]),.trace2(trace[54]),.outputcost(cost_wire[59]),.outputtrace(next_trace[59]),.column(counter));
    Compare NS_state60(.cost1(cost[55][counter]),.cost2(cost[56][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[55]),.hamming2(hamming0[56]),.trace1(trace[55]),.trace2(trace[56]),.outputcost(cost_wire[60]),.outputtrace(next_trace[60]),.column(counter));
    Compare NS_state61(.cost1(cost[57][counter]),.cost2(cost[58][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[57]),.hamming2(hamming0[58]),.trace1(trace[57]),.trace2(trace[58]),.outputcost(cost_wire[61]),.outputtrace(next_trace[61]),.column(counter));
    Compare NS_state62(.cost1(cost[59][counter]),.cost2(cost[60][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[59]),.hamming2(hamming0[60]),.trace1(trace[59]),.trace2(trace[60]),.outputcost(cost_wire[62]),.outputtrace(next_trace[62]),.column(counter));
    Compare NS_state63(.cost1(cost[61][counter]),.cost2(cost[62][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[61]),.hamming2(hamming0[62]),.trace1(trace[61]),.trace2(trace[62]),.outputcost(cost_wire[63]),.outputtrace(next_trace[63]),.column(counter));
    Compare NS_state64(.cost1(cost[63][counter]),.cost2(cost[64][counter]),.input1(1'b1),.input2(1'b1),.hamming1(hamming0[63]),.hamming2(hamming0[64]),.trace1(trace[63]),.trace2(trace[64]),.outputcost(cost_wire[64]),.outputtrace(next_trace[64]),.column(counter));

    


endmodule