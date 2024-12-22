module enc_422Beh(
input i3,i2,i1,i0,
output reg y1,y0
    );
    
    always@(i3,i2,i1,i0)begin
        y1<=i3+i2;
        y0<=i3+i1;
    end
    
endmodule
