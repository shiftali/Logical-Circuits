`timescale 1ns/1ns
module mooreTB ();
    reg clk, rst, j;
    wire w_moore ,wMpost;
    moore10110 instant(.clk(clk) , .rst(rst) , .j(j) , .w(w_moore));
    mealy10110 instantt(.clk(clk) , .rst(rst) , .j(j) , .w(wMpost));
    initial begin
        clk=1'b0; #100;
        forever begin
            clk = ~clk; #100;
        end
    end

    initial begin
       rst = 1'b0;
       j=1'b0; #220;
       j=1'b1; #200;
       j=1'b0; #220; 
       j=1'b1; #300;
       j=1'b0; #100;
       j=1'b1; #20;//vase mealy gozashtam
       j=1'b0; #100;
       j=1'b1; #350;
       j=1'b0; #220;
       rst=1'b1; #20;
       $finish;
    end
endmodule