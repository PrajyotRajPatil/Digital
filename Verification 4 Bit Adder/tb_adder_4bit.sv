`timescale 1ns / 1ps

class transaction;
    rand bit [3:0] p, q;
    bit [3:0] sum_final;
    bit carry_final;

    function transaction copy();
        transaction c= new();
        c.p=this.p;
        c.q=this.q;
        c.sum_final=this.sum_final;
        c.carry_final=this.carry_final;
        return c;
    endfunction
    
    function display(input string mode);
        $display("[%s]: P=%0d, Q=%0d, SUM=%0d, CARRY=%0d", mode, p, q, sum_final, carry_final);
    endfunction
endclass



class generator;
    transaction tr;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbxref;
    
    function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
        this.mbx=mbx;
        this.mbxref=mbxref;
        tr=new();
    endfunction
    
    event next, done;
    int i=0, count=0;
    
    task run();
        repeat(count) begin
            assert(tr.randomize()) else $error("[GEN]: Randomization Failed");
            mbx.put(tr.copy());
            mbxref.put(tr.copy());
            i++;
            $display("Iteration no. %0d",i);
            tr.display("GEN");
            @(next);
        end
       ->done;
    endtask
endclass



class driver;
    transaction tr;
    mailbox #(transaction) mbx;
    virtual adder_4bit_intf vintf;
    event drv_mon;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        forever begin
            tr=new();
            mbx.get(tr);
            vintf.p=tr.p;
            vintf.q=tr.q;
            tr.display("DRV");
            #1;
            ->drv_mon;
        end
    endtask
endclass



class monitor;
    transaction tr;
    mailbox #(transaction) mbx;
    event drv_mon;
    
    virtual adder_4bit_intf vintf;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        forever begin
            tr=new();
            @(drv_mon);         
            #1;
            tr.p=vintf.p;
            tr.q=vintf.q;
            tr.sum_final=vintf.sum_final;
            tr.carry_final=vintf.carry_final;
            mbx.put(tr);
            tr.display("MON");
        end
    endtask
endclass



class scoreboard;
    transaction tr;
    transaction trref;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbxref;
    event next;
    
    function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
        this.mbx=mbx;
        this.mbxref=mbxref;
    endfunction
    
    task run();
        bit[3:0] j;
        bit cout;
        forever begin
            tr=new();
            trref=new();
            mbx.get(tr);
            mbxref.get(trref);
            
            {cout,j}=trref.p+trref.q;
            
            if(tr.sum_final==j && tr.carry_final==cout)
            begin
                tr.display("SCO");
                $display("Data Matched");
                $display("----------------------------------------------------");
            end
            else begin
                begin
                tr.display("SCO");
                $display("Data Mis-Matched");
                $display("----------------------------------------------------");
            end
            end
            ->next;
        end
    endtask
endclass



class environment;
    transaction tr;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;
    event next, drv_mon;
    virtual adder_4bit_intf vintf;
    
    mailbox #(transaction) gdmbx;
    mailbox #(transaction) msmbx;
    mailbox #(transaction) mbxref;
    
    function new(virtual adder_4bit_intf vintf);
        gdmbx=new();
        msmbx=new();
        mbxref=new();
        
        gen=new(gdmbx, mbxref);
        drv=new(gdmbx);
        mon=new(msmbx);
        sco=new(msmbx, mbxref);
        
        this.vintf=vintf;
        drv.vintf=this.vintf;
        mon.vintf=this.vintf;
        
        gen.next=next;
        sco.next=next;
        drv.drv_mon=drv_mon;
        mon.drv_mon=drv_mon;
    endfunction
    
    task test();
        fork
            gen.run;
            drv.run;
            mon.run;
            sco.run;
        join_none
    endtask
    
    task finish();
        wait(gen.done.triggered);
        $finish;
    endtask
    
    task run();
        test;
        finish;
    endtask
endclass



module tb_adder_4bit;
    adder_4bit_intf vintf();
    environment env;
    
    adder_4bit DUT(.p(vintf.p), .q(vintf.q), .sum_final(vintf.sum_final), .carry_final(vintf.carry_final));
    
    initial begin 
        env=new(vintf);
        env.gen.count=25;
        env.run;
    end
endmodule
