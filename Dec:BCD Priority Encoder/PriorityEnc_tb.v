module PriorityEnc_tb;

reg [9:0]i;
wire [3:0]y;

PriorityEnc c1(.i(i),.y(y));

initial begin
i=10'b0011001100;#10;
i=10'b0000000100;#10;
i=10'b1000001000;#10;
i=10'b1111111111;#10;
i=10'b0000000000;#10;
$finish;
end
endmodule
