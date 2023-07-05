//sequence to be detected is "0110";
module seq_det (
    clk,a,reset,out
);
    input clk,a,reset;
    output reg out;
    parameter s0 = 0,s1=1,s2=2,s3=3;
    reg [0:1] PS,NS;
    always @(posedge clk or posedge reset)
    if(reset)
    PS <=0;
    else
    PS<=NS;
    always @(PS,a)
    case (PS)
        s0:begin
          out = a ? 0 :0;
          NS =a?s0:s1;  
        end 
        s1:begin
          out = a?0:0;
          NS =a?s2:s1;  
        end 
        s2:begin
          out = a?0:0;
          NS =a?s3:s1;  
        end 
        s3:begin
          out = a?0:1;
          NS =a?s0:s1;  
        end 
    endcase
endmodule