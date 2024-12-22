module enc823_tb;

reg i0,i1,i2,i3,i4,i5,i6,i7;
wire y0,y1,y2;

enc823 c1(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7),.y0(y0),.y1(y1),.y2(y2));

initial begin
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00000001;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00000010;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00000100;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00001000;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00010000;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b00100000;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b01000000;#10;
{i0,i1,i2,i3,i4,i5,i6,i7}=8'b10000000;#10;
$finish;
end
endmodule
