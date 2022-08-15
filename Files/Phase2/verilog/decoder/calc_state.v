module calc_state(
    CS,
    NS0,
    NS1,
    out0,
    out1
);
    input [6:0]CS;
    output reg[6:0]NS0;
    output reg[6:0]NS1;
    output reg[2:0]out0;
    output reg[2:0]out1;


always @(CS) begin

    case (CS)
        1:begin 
                NS0 = 1;
                out0 = 1;
                NS1 = 33;
                out1 = 4;

        end
        2:begin
                 NS0 = 1;
                out0 = 4;
                NS1 = 33;
                out1 = 1;
        end
        3:begin   
                 NS0 = 2;
                out0 = 2;
                NS1 = 34;
                out1 = 3;
        end
        4:begin
                NS0 = 2;
                out0 = 3;
                NS1 = 34;
                out1 = 2;
        end
        5:begin
               NS0 = 3;
                out0 = 1;
                NS1 = 35;
                out1 = 4;
        end
        6:begin
                
               NS0 = 3;
                out0 = 4;
                NS1 = 35;
                out1 = 1;
        end
        7:begin
                 NS0 = 4;
                out0 = 2;
                NS1 = 36;
                out1 = 3;
        end
        8:begin
                NS0 = 4;
                out0 = 3;
                NS1 = 36;
                out1 = 2;
        end
        9:begin
                 NS0 = 5;
                out0 = 4;
                NS1 = 37;
                out1 = 1;
        end
        10:begin
                NS0 = 5;
                out0 = 1;
                NS1 = 37;
                out1 = 4;
        end
        11:begin
                NS0 = 6;
                out0 = 3;
                NS1 = 38;
                out1 = 2;
        end
        12:begin
                NS0 = 6;
                out0 = 2;
                NS1 = 38;
                out1 = 3;
        end
        13:begin
                NS0 = 7;
                out0 = 4;
                NS1 = 39;
                out1 = 1;
        end
        14:begin
                NS0 = 7;
                out0 = 1;
                NS1 = 39;
                out1 = 4;
        end
        15:begin
                NS0 = 8;
                out0 = 3;
                NS1 = 40;
                out1 = 2;
        end
        16:begin
                 NS0 = 8;
                out0 = 2;
                NS1 = 40;
                out1 = 3;
        end
        17:begin
                NS0 = 9;
                out0 = 4;
                NS1 = 41;
                out1 = 1;
        end
        18:begin
                NS0 = 9;
                out0 = 1;
                NS1 = 41;
                out1 = 4;
        end
        19:begin
                NS0 = 10;
                out0 = 3;
                NS1 = 42;
                out1 = 2;
        end
        20:begin
                NS0 = 10;
                out0 = 2;
                NS1 = 42;
                out1 = 3;
        end
        21:begin
                 NS0 = 11;
                out0 = 4;
                NS1 = 43;
                out1 = 1;
        end
        22:begin
                 NS0 = 11;
                out0 = 1;
                NS1 = 43;
                out1 = 4;
        end
        23:begin
                 NS0 = 12;
                out0 = 3;
                NS1 = 44;
                out1 = 2;
        end
        24:begin
                 NS0 = 12;
                out0 = 2;
                NS1 = 44;
                out1 = 3;
        end
        25:begin
                 NS0 = 13;
                out0 = 1;
                NS1 = 45;
                out1 = 4;
        end
        26:begin
                 NS0 = 13;
                out0 = 4;
                NS1 = 45;
                out1 = 1;
        end
        27:begin   
                 NS0 = 14;
                out0 = 2;
                NS1 = 46;
                out1 = 3;
        end
        28:begin   
                 NS0 = 14;
                out0 = 3;
                NS1 = 46;
                out1 = 2;
        end
        29:begin
                 NS0 = 15;
                out0 = 1;
                NS1 = 47;
                out1 = 4;
        end
        30:begin
                 NS0 = 15;
                out0 = 4;
                NS1 = 47;
                out1 = 1;
        end
        31:begin
                 NS0 = 16;
                out0 = 2;
                NS1 = 48;
                out1 = 3;
        end
        32:begin
                 NS0 = 16;
                out0 = 3;
                NS1 = 48;
                out1 = 2;
        end
        33:begin
                NS0 = 17;
                out0 = 3;
                NS1 = 49;
                out1 = 2;
        end
        34:begin
                NS0 = 17;
                out0 = 2;
                NS1 = 49;
                out1 = 3;
        end
        35:begin
                NS0 = 18;
                out0 = 4;
                NS1 = 50;
                out1 = 1;
        end
        36:begin
                NS0 = 18;
                out0 = 1;
                NS1 = 50;
                out1 = 4;
        end
        37:begin
                NS0 = 19;
                out0 = 3;
                NS1 = 51;
                out1 = 2;
        end
        38:begin
                NS0 = 19;
                out0 = 2;
                NS1 = 51;
                out1 = 3;
        end
        39:begin
                NS0 = 20;
                out0 = 4;
                NS1 = 52;
                out1 = 1;
        end
        40:begin
                NS0 = 20;
                out0 = 1;
                NS1 = 52;
                out1 = 4;
        end
        41:begin
                NS0 = 21;
                out0 = 2;
                NS1 = 53;
                out1 = 3;
        end
        42:begin
                NS0 = 21;
                out0 = 3;
                NS1 = 53;
                out1 = 2;
        end
        43:begin
                NS0 = 22;
                out0 = 1;
                NS1 = 54;
                out1 = 4;
        end
        44:begin
                NS0 = 22;
                out0 = 4;
                NS1 = 54;
                out1 = 1;
        end
        45:begin
                NS0 = 23;
                out0 = 2;
                NS1 = 55;
                out1 = 3;
        end
        46:begin
                NS0 = 23;
                out0 = 3;
                NS1 = 55;
                out1 = 2;
        end
        47:begin
                NS0 = 24;
                out0 = 1;
                NS1 = 56;
                out1 = 4;
        end
        48:begin
                NS0 = 24;
                out0 = 4;
                NS1 = 56;
                out1 = 1;
        end
        49:begin
                NS0 = 25;
                out0 = 2;
                NS1 = 57;
                out1 = 3;
        end
        50:begin
                NS0 = 25;
                out0 = 3;
                NS1 = 57;
                out1 = 2;
        end
        51:begin
                NS0 = 26;
                out0 = 1;
                NS1 = 58;
                out1 = 4;
        end
        52:begin
                NS0 = 26;
                out0 = 4;
                NS1 = 58;
                out1 = 1;
        end
        53:begin
                NS0 = 27;
                out0 = 2;
                NS1 = 59;
                out1 = 3;
        end
        54:begin
                NS0 = 27;
                out0 = 3;
                NS1 = 59;
                out1 = 2;
        end
        55:begin
                NS0 = 28;
                out0 = 1;
                NS1 = 60;
                out1 = 4;
        end
        56:begin
                NS0 = 28;
                out0 = 4;
                NS1 = 60;
                out1 = 1;
        end
        57:begin
                NS0 = 29;
                out0 = 3;
                NS1 = 61;
                out1 = 2;
        end
        58:begin
                NS0 = 29;
                out0 = 2;
                NS1 = 61;
                out1 = 3;
        end
        59:begin
                NS0 = 30;
                out0 = 4;
                NS1 = 62;
                out1 = 1;
        end
        60:begin
                NS0 = 30;
                out0 = 1;
                NS1 = 62;
                out1 = 4;
        end
        61:begin
                NS0 = 31;
                out0 = 3;
                NS1 = 63;
                out1 = 2;
        end
        62:begin
                NS0 = 31;
                out0 = 2;
                NS1 = 63;
                out1 = 3;
        end
        63:begin
                NS0 = 32;
                out0 = 4;
                NS1 = 64;
                out1 = 1;
        end
        64:begin
                NS0 = 32;
                out0 = 1;
                NS1 = 64;
                out1 = 4;
        end
    endcase
end
endmodule