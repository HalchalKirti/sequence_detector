`include "sequ.v"
module test ;
reg clock,res,in;
wire o;
seq_det qw(clock,in,res,o);
initial begin
    $dumpfile("seq.vcd");
    $dumpvars(0,test);
    clock = 1'b0;
    res = 1'b1;
    # 15 res =1'b0;
end   
always #5 clock=~clock;
initial begin
    #12 in = 0;
    #10 in=0;
    #10 in =1;
    #10 in =1;
    
     #10 in = 0;
    #10 in=1;
    #10 in =1;
    #10 in =0;
    #10 in = 0;
    #10 in=1;
    #10 in =1;
    #10 in =0;
    #10 $finish;
end
endmodule