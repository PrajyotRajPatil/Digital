`timescale 1ns / 1ps
module dff (dff_intf.DUT vintf);
    always@(posedge vintf.clk)
    begin
        if(vintf.rst==1)
            vintf.dout<=0;
        else
            vintf.dout<=vintf.din;
    end
endmodule

interface dff_intf;
    logic clk;
    logic rst;
    logic din;
    logic dout;
    
    modport DUT (
        input  clk,
        input  rst,
        input  din,
        output dout
    );
endinterface
