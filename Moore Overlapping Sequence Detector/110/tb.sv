module moore_overlap_110_tb;

reg clk,rst,in;
wire out;

moore_overlap_110 uut(.in(in),.out(out),.clk(clk),.rst(rst));

always #5 clk = ~clk;


task apply_input(input  i);
        begin
            @(posedge clk);
            in = i;
        end
    endtask
    
 initial begin   
        clk = 0;
        rst = 1;
        in = 0;
        #10;
        rst = 0;
        
        apply_input(1);  
        apply_input(1);  
        apply_input(0);  
        apply_input(1);  
        apply_input(1);  
        apply_input(0);  
        apply_input(0);  
        apply_input(1);  
        apply_input(0);
        
        #20;
     $finish;
end
    
initial begin
     $display("Time\tclk\trst\tin\tout\tstate");
     $monitor("%0t\t%b\t%b\t%b\t%b\t", $time, clk, rst, in, out);
end
    
endmodule
