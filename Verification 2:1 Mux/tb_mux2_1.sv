`timescale 1ns / 1ps


class transaction;
    rand bit [3:0] a, b;
    bit [3:0] y;
    rand bit sel;

    constraint sel_dist {
        sel dist{1:/50 , 0:/50};
    }

    function transaction copy();
        transaction c=new();
        c.a=this.a;
        c.b=this.b;
        c.sel=this.sel;
        c.y=this.y;
        return c;
    endfunction
    function display(input string mode);
        $display("[%0s]: A:%0d, B:%0d, Sel: %0d, Y:%0d", mode, a, b, sel, y);
    endfunction
endclass



class generator;
    transaction tr;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbx_ref;
    
    int count=0;
    event next,done;
    
    function new(mailbox #(transaction) mbx, mailbox #(transaction)mbx_ref);
        this.mbx = mbx;
        this.mbx_ref=mbx_ref;
        tr=new();
    endfunction
    
    task run();
        repeat(count)
        begin
            assert(tr.randomize())else $error("[GEN]: Randomization Failed");
            mbx.put(tr.copy());
            mbx_ref.put(tr.copy());
            tr.display("GEN");
            @(next);
        end
        ->done;
    endtask
endclass



class driver;
    transaction tr;
    mailbox #(transaction) mbx;
    virtual mux2_1_intf vintf;
    event drv_mon;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        forever begin
            tr=new();
            mbx.get(tr);
            vintf.a   <= tr.a;
            vintf.b   <= tr.b;
            vintf.sel <= tr.sel;
            tr.display("DRV");
            ->drv_mon;
        end
    endtask
endclass



class monitor;
    transaction tr;
    mailbox #(transaction) mbx;

    virtual mux2_1_intf vintf;
    event drv_mon;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        forever begin
            wait(drv_mon.triggered);
            #1; 
            tr = new();
            tr.a   = vintf.a;
            tr.b   = vintf.b;
            tr.sel = vintf.sel;
            tr.y   = vintf.y;
            mbx.put(tr);
            tr.display("MON");
        end
    endtask
endclass



class scoreboard;
    transaction tr;
    transaction tr_ref;
    event next;
    mailbox #(transaction) mbx;
    mailbox #(transaction) mbx_ref;
    
    function new(mailbox #(transaction) mbx, mailbox #(transaction) mbx_ref);
        this.mbx=mbx;
        this.mbx_ref=mbx_ref;
    endfunction
    
    task run();
        bit [3:0] y;
        forever begin
            mbx.get(tr);
            mbx_ref.get(tr_ref);
            
            y=tr_ref.sel?tr_ref.b:tr_ref.a;
            
            if(tr.y === y)
            begin
                tr.display("SCO");
                $display("Data Matched");
                $display("----------------------------------------------------");
            end
            else 
            begin
                $display("Data Mis-Matched");
                $display("----------------------------------------------------");
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
    
    mailbox #(transaction) gdmbx;
    mailbox #(transaction) msmbx;
    mailbox #(transaction) mbx_ref;
    
    virtual mux2_1_intf vintf;
    
    function new(virtual mux2_1_intf vintf);
        gdmbx=new();
        msmbx=new();
        mbx_ref=new();
        
        gen=new(gdmbx, mbx_ref);
        drv=new(gdmbx);
        mon=new(msmbx);
        sco=new(msmbx, mbx_ref);
        
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
            gen.run();
            drv.run();
            mon.run();
            sco.run();
        join_none
    endtask
    
    task finish();
        wait(gen.done.triggered);
        $finish();
    endtask
    
    task run();
        test();
        finish();
    endtask
endclass

module tb_mux2_1;
    mux2_1_intf vintf();
    environment env;
    
    mux2_1 DUT(.a(vintf.a), .b(vintf.b), .sel(vintf.sel), .y(vintf.y));
    initial begin
        env=new(vintf);
        env.gen.count=40;
        env.run();
    end
endmodule
