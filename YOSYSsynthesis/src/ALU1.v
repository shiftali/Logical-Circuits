module ALU1(input [15:0]inA,inB , input[2:0]opc , input inC , output reg [15:0]outW , output zer,neg);

    always @(opc,inA,inB,inC) begin
        outW=16'b0;
        case(opc)
            3'b000: outW= inA + inB +inC;
            3'b001: outW= inA + 16'd1;
            3'b010: outW = ($signed(inA) >= $signed(inB)) ? inA : inB; //use signed for negatives
            3'b011: outW = inA + (inB >>> 1);  //right shift to divide by 2
            3'b100: outW= inA & inB;
            3'b101: outW= inA | inB;
            3'b110: outW= ~inA;
            3'b111: outW = 16'b0;

            default: 
            outW = 16'bx;
        endcase
    end

    assign zer = (outW==16'b0);
    assign neg = outW[15];  //MSB

endmodule