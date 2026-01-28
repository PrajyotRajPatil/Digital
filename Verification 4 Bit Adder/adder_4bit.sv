`timescale 1ns / 1ps

module adder_4bit(
    input [3:0] p, q,
    output [3:0] sum_final,
    output carry_final    
    );
        wire cin;
        wire c1, c2, c3;
        
        assign cin=1'b0;
        
        full_adder fa1(p[0], q[0], cin, sum_final[0], c1);
        full_adder fa2(p[1], q[1], c1, sum_final[1], c2);
        full_adder fa3(p[2], q[2], c2, sum_final[2], c3);
        full_adder fa4(p[3], q[3], c3, sum_final[3], carry_final);
endmodule

module full_adder(
    input a, b, c,
    output sum, carry
    );
    
    assign sum = a^b^c;
    assign carry = (a&b)|(b&c)|(a&c);
    
endmodule

interface adder_4bit_intf;
    logic [3:0] p, q;
    logic [3:0] sum_final;
    logic carry_final;
endinterface
