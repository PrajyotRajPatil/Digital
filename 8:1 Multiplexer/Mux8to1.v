module Mux8to1(
input [3:0]y1,
input [3:0]y2,
input [3:0]y3,
input [3:0]y4,
input [3:0]y5,
input [3:0]y6,
input [3:0]y7,
input [3:0]y8,
input s0,
input s1,
input s2,
output [3:0]z);

wire [3:0]z1,z2;

    Mux4to1 op1(.a1(y1), .a2(y2), .a3(y3), .a4(y4), .s0(s0), .s1(s1), .x(z1));
    Mux4to1 op2(.a1(y5), .a2(y6), .a3(y7), .a4(y8), .s0(s0), .s1(s1), .x(z2));
    Mux2to1 fop(.i1(z1), .i2(z2), .s2(s2), .y(z));

endmodule 

module Mux4to1(
input [3:0]a1,
input [3:0]a2,
input [3:0]a3,
input [3:0]a4,
input s0,
input s1,
output reg [3:0]x);

always @(*)begin
    case({s0,s1})
        2'b00:x=a1;
        2'b01:x=a2;
        2'b10:x=a3;
        2'b11:x=a4;
    endcase 
end
endmodule

module Mux2to1(
input [3:0]i1,
input [3:0]i2,
input s2,
output reg [3:0]y);

always@(*)begin
    case(s2)
        1'b0:y=i1;
        1'b1:y=i2;
    endcase 
end
endmodule 
