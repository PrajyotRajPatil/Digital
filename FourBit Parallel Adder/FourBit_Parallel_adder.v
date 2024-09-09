module FourBit_Parallel_adder(A,B,CIN,SUM,CARRY);

input [3:0]A,B;
input CIN;
output [3:0]SUM;
output CARRY;

wire c1,c2,c3;

full_adder FA0(A[0],B[0],CIN,SUM[0],c1);
full_adder FA1(A[1],B[1],c1,SUM[1],c2);
full_adder FA2(A[2],B[2],c2,SUM[2],c3);
full_adder FA3(A[3],B[3],c3,SUM[3],CARRY);

endmodule

module full_adder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;

assign sum=a^b^c;
assign carry=((a&b)|(b&c)|(a&c));

endmodule 
