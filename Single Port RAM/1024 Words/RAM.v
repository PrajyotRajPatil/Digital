module RAM_1_port_1024words(
    input [31:0] in,
    input [9:0] addr,
    input wr_enable,clk,
    output reg [31:0] out
    );
    
    reg [31:0] RAM [0:1023];
    
    always@(posedge clk) begin
        if(wr_enable)
            RAM[addr] <= in;
        out <= RAM[addr];
    end
endmodule
