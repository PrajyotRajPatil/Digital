module decoder_3_8(
    input [2:0] in,
    input [7:0] out
    );
    
    assign out = 8'b00000001 << in;
    
endmodule
