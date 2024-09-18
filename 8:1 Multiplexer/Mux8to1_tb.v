module Mux8to1_tb;

reg [3:0]y1,y2,y3,y4,y5,y6,y7,y8;
reg s0,s1,s2;
wire [3:0]z;

Mux8to1 uut(.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7),.y8(y8),.s0(s0),.s1(s1),.s2(s2),.z(z));

initial begin
repeat(20) begin
        y1 = $random % 16;   // 4-bit random values (0 to 15)
        y2 = $random % 16;
        y3 = $random % 16;
        y4 = $random % 16;
        y5 = $random % 16;
        y6 = $random % 16;
        y7 = $random % 16;
        y8 = $random % 16;
        
        s0 = $random % 2;    // 1-bit random values (0 or 1)
        s1 = $random % 2;
        s2 = $random % 2;

        #1; // Small delay for output to stabilize
        $display("s2=%b s1=%b s0=%b | z=%b", s2, s1, s0, z);
        end
      #100 $finish;
end
endmodule
