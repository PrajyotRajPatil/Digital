module moore_overlap_110(
    input bit clk,
    input logic rst,
    input logic in,
    output logic out
    );
    
    typedef enum logic [1:0] {s0,s1,s2,s3} state_t;
    state_t state;
    
    always@(posedge clk or posedge rst)begin
    
    if(rst)begin
    out<=1'b0;
    state<=s0;
    end
    
    else begin 
        case(state)
        s0: begin
            out<=1'b0;
            if(in)
            state<=s1;
            end
        
        s1: begin 
            out<=1'b0;
            if(in)
            state<=s2;
            else
            state<=s0;
            end
        s2: begin
            out<=1'b0;
            if(!in)
            state<=s3;
            else
            state<=s2;
            end
        s3: begin
            out<=1'b1;
            if(in)
            state<=s1;
            else
            state<=s0;
            end
         endcase
      end
    end
    
endmodule
