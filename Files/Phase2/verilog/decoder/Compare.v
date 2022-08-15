module Compare(
    cost1,
    cost2,
    input1,
    input2,
    hamming1,
    hamming2,
    trace1,
    trace2,
    outputcost,
    outputtrace,
    column);

    parameter datanumber=72;

    input input1;
    input input2;
    input [10:0]column;
    input [10:0]cost1;
    input [10:0]cost2;
    input [3:0]hamming1;
    input [3:0]hamming2;
    input [1:datanumber/2+1]trace1;
    input [1:datanumber/2+1]trace2;
    output reg [10:0]outputcost;
    output reg[1:datanumber/2+1]outputtrace;
    integer i=1;

    always@(*)
        begin
        if(cost1+hamming1<cost2+hamming2)
        begin
            outputcost=cost1+hamming1;
            for (i=1;i<column;i=i+1)
                outputtrace[i]=trace1[i];
            outputtrace[column]=input1;
        end
        else
        begin
            outputcost=cost2+hamming2;
            for (i=1;i<column;i=i+1)
                outputtrace[i]=trace2[i];
            outputtrace[column]=input2;
        end
        end
endmodule