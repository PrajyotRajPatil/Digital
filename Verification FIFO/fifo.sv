`timescale 1ns / 1ps

module fifo(
input clk, rst, wr, rd,
input [7:0] din,
output empty, full,
output reg [7:0] dout);
    
reg [3:0] rdptr,wrptr;
reg [4:0] count;
reg [7:0] memory [15:0];

always@(posedge clk) 
begin
    if(rst==1)
    begin
        wrptr<=1'b0;
        rdptr<=1'b0;
        count<=1'b0;
    end
    
    else if(wr && !full)
    begin
        memory[wrptr]<=din;
        wrptr=wrptr+1;
        count=count+1;
    end
    
    else if(rd && !empty)
    begin
        dout<=memory[rdptr];
        rdptr<=rdptr+1;
        count<=count-1;
    end
end

assign empty = (count==0)? 1'b1 : 1'b0;
assign full = (count==16)? 1'b1 : 1'b0;
 
endmodule

interface fifo_intf;
  logic clk, rst, wr, rd;
  logic full, empty;
  logic [7:0] din;
  logic [7:0] dout;
endinterface
