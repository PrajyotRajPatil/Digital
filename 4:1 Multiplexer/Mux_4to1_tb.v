module Mux_4to1_tb;

reg [3:0]a,b,c,d;
reg [1:0]sel;
wire [3:0]y;

Mux_4to1 uut(.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(y));

initial begin

a=4'b0000;b=4'b0001;c=4'b0010;d=4'b0011;sel=2'b00;
#10;
a=4'b0000;b=4'b0001;c=4'b0010;d=4'b0011;sel=2'b01;
#10;
a=4'b0000;b=4'b0001;c=4'b0010;d=4'b0011;sel=2'b10;
#10;
a=4'b0000;b=4'b0001;c=4'b0010;d=4'b0011;sel=2'b11;
#10;
a=4'b1111;b=4'b1110;c=4'b1101;d=4'b1100;sel=2'b00;
#10;
a=4'b1111;b=4'b1110;c=4'b1101;d=4'b1100;sel=2'b01;
#10;
a=4'b1111;b=4'b1110;c=4'b1101;d=4'b1100;sel=2'b10;
#10;
a=4'b1111;b=4'b1110;c=4'b1101;d=4'b1100;sel=2'b11;
#10;

$finish;
end
endmodule
