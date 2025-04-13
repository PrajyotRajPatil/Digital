module tb_RAM_1_port_1024words;
 
reg wr_enable,clk;
reg [9:0]addr;
reg [31:0]in;
wire [31:0]out;

RAM_1_port_1024words dut(.clk(clk),.wr_enable(wr_enable),.in(in),.out(out),.addr(addr));

    task write(input [9:0] a, input [31:0] d);
    begin
        wr_enable = 1;
        addr = a;
        in = d;
        #10 clk = 1;
        #10 clk = 0;
    end   
    endtask

    task read(input [9:0] a);
    begin
        wr_enable = 0;
        addr = a;
        #10 clk = 1;
        #10 clk = 0;
    end    
    endtask

    initial begin
        clk = 0;
        wr_enable = 0;
        addr = 0;
        in = 0;

        write(10'd0, 32'hDEADBEEF);
        write(10'd1, 32'h12345678);
        write(10'd255, 32'hCAFEBABE);
        write(10'd1023, 32'hFEEDFACE);

        read(10'd0);
        $display("Read from addr 0: %h", out);
        read(10'd1);
        $display("Read from addr 1: %h", out);
        read(10'd255);
        $display("Read from addr 255: %h", out);
        read(10'd1023);
        $display("Read from addr 1023: %h", out);

        $finish;
    end
endmodule
