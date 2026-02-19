`timescale 1ns/1ns
module compare_TB ();
    reg clk, rst, j;
    wire moore,mealy;
    moore10110_post instant(.clk(clk) , .rst(rst) , .j(j) , .w(moore));
    mealy10110_post instantt(.clk(clk) , .rst(rst) , .j(j) , .w(mealy));
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
       j=1'b1; #20;//for mealy
       j=1'b0; #100;
       j=1'b1; #350;
       j=1'b0; #220;
       rst=1'b1; #50;
       $finish;
    end
endmodule