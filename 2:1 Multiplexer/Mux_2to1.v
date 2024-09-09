module Mux_2to1(
    input [3:0] a,
    input [3:0]b,
    input sel,
    output reg [3:0]y
    );
    
    always@(a or b or sel)begin
    case(sel)
        1'b0:y<=a;
        1'b1:y<=b;
    endcase
    end
        
endmodule
