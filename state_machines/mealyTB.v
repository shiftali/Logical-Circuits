`timescale 1ns/1ns
module mealyTB ();
    reg clk, rst, j;
    wire w_mealy,w_mealyPost;
    mealy10110 instant(.clk(clk) , .rst(rst) , .j(j) , .w(w_mealy));
    mealy10110_post instantt(.clk(clk) , .rst(rst) , .j(j) , .w(w_mealyPost));
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