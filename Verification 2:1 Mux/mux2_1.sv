`timescale 1ns / 1ps

module mux2_1(
input [3:0] a, b,
input sel,
output [3:0]y
    );

assign y = (sel?b:a);

endmodule

interface mux2_1_intf;
logic [3:0] a, b;
logic sel;
logic [3:0] y;
endinterface
