module minimal_ALU(input [15:0]inA,inB , input[2:0]opc , input inC , output reg [15:0]outW , output zer,neg);

    wire [15:0] add_inB = 
    (opc==3'b000) ? inB : 
    (opc==3'b001) ? 16'd1 :
    (opc==3'b010) ? ~inB : //A+~B = A-B
    (inB>>>1);

    wire add_inC = 
    (opc==3'b000) ? inC :
    (opc==3'b010) ? 1'b1 : //for 2's complement of B
    1'b0;

    wire [15:0] add_out = inA + add_inB + add_inC;

    always @(opc,inA,inB,inC) begin
        outW=16'b0;
        case(opc)
        
            3'b010: outW = (add_out[15]==0) ? inA : inB;
             
            3'b100: outW= inA & inB;
            3'b101: outW= inA | inB;
            3'b110: outW= ~inA;
            3'b111: outW = 16'b0;
            default: outW = add_out;
        endcase
    end

    assign zer = (outW==16'b0);
    assign neg = outW[15];  //MSB

endmodule
