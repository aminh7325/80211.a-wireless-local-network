module hamming_calc(
    x,
    y,
    m,
    z,
    z1
);
    input [2:0] x;
    input [2:0] y;
    input [2:0] m;
    output reg[2:0] z;
    output reg[2:0] z1;

    always @(x , y) begin
        if(x==y)
            z=0;
        if(x==1&&y==2||y==1&&x==2)
            z=1;
        if(x==1&&y==3||y==1&&x==3)
            z=1;
        if(x==1&&y==4||y==1&&x==4)
            z=2;
        if(x==2&&y==3||y==2&&x==3)
            z=2;    
        if(x==2&&y==4||y==2&&x==4)
            z=1;
        if(x==3&&y==4||y==3&&x==4)
            z=1;
//in = 1
         if(x==m)
            z1=0;
        if(x==1&&m==2||m==1&&x==2)
            z1=1;
        if(x==1&&m==3||m==1&&x==3)
            z1=1;
        if(x==1&&m==4||m==1&&x==4)
            z1=2;
        if(x==2&&m==3||m==2&&x==3)
            z1=2;    
        if(x==2&&m==4||m==2&&x==4)
            z1=1;
        if(x==3&&m==4||m==3&&x==4)
            z1=1;
    end

endmodule