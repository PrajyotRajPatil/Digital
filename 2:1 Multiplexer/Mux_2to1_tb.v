module Mux_2to1_tb;
reg [3:0]a,b;
reg sel;
wire [3:0]y;

Mux_2to1 uut(.a(a),.b(b),.sel(sel),.y(y));

initial begin

a=4'b0000;b=4'b1111;sel=1'b0;
#10;
a=4'b0000;b=4'b1111;sel=1'b1;
#10;
a=4'b1111;b=4'b0001;sel=1'b0;
#10;
a=4'b1111;b=4'b0001;sel=1'b1;
#10;

$finish;
end
endmodule
