module FourBit_Parallel_adder_tb();

reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;

FourBit_Parallel_adder uut(.A(a),.B(b),.CIN(cin),.SUM(sum),.CARRY(carry));

initial begin
a=4'b0000;
b=4'b0000;
cin=1'b0;
#10;

a=4'b0001;
b=4'b0001;
cin=1'b0;
#10;

a=4'b0001;
b=4'b0001;
cin=1'b1;
#10;

a=4'b0010;
b=4'b0001;
cin=1'b0;
#10;

end
endmodule
