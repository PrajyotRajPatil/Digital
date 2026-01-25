`timescale 1ns / 1ps

class transaction;
    rand bit rd, wr, full, empty, oper;
    randc bit [7:0] din, dout;
    
    constraint oper_ctrl
    {
        oper dist{1:/50 , 0:/50};
    }
endclass

class generator;
    transaction tr;
    mailbox #(transaction) mbx;
    int count=0;
    int i=0;
    event next, done;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
        tr=new();
    endfunction
    
    task run();
        repeat (count)
        begin
            assert(tr.randomize()) else $error ("Randomization Failed");
            i++;
            mbx.put(tr);
            $display("[GEN]: oper:%0d Iter:%0d",tr.oper,i);
            @(next);
        end
        -> done;
    endtask
endclass

class driver;
    virtual fifo_intf vintf;
    mailbox #(transaction) mbx;
    transaction datac;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task reset();
        vintf.rst<=1'b1;
        vintf.wr<=1'b0;
        vintf.rd<=1'b0;
        vintf.din<=0;
        repeat (5) @(posedge vintf.clk);
        vintf.rst<=1'b0;
        $display("[DRV]: DUT Reset done");
        $display("---------------------------------------");
    endtask
    
    task write();
        @(posedge vintf.clk);
        vintf.rst<=1'b0;
        vintf.rd<=1'b0;
        vintf.wr<=1'b1;
        vintf.din<=$urandom_range(1,15);
        @(posedge vintf.clk);
        vintf.wr<=1'b0;
        $display("[DRV]: DATA WRITE data:%0d",vintf.din);
        @(posedge vintf.clk);
    endtask
    
    task read();
        @(posedge vintf.clk);
        vintf.rst<=1'b0;
        vintf.rd<=1'b1;
        vintf.wr<=1'b0;
        @(posedge vintf.clk);
        vintf.rd<=1'b0;
        $display("[DRV]: DATA READ");
        @(posedge vintf.clk);
    endtask
    
    task run();
        forever begin
            mbx.get(datac);
            if(datac.oper==1)
                write();
            else
                read();
        end
    endtask
    
endclass

class monitor;
    virtual fifo_intf vintf;
    transaction tr;
    mailbox #(transaction) mbx;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        tr=new();
        
        forever begin
            repeat(2) @(posedge vintf.clk);
            tr.wr=vintf.wr;
            tr.rd=vintf.rd;
            tr.din=vintf.din;
            tr.full=vintf.full;
            tr.empty=vintf.empty;
            @(posedge vintf.clk);
            tr.dout=vintf.dout;
            
            mbx.put(tr);
            $display("[MON]: wr:%0d rd:%0d din:%0d dout:%0d full:%0d empty%0d",tr.wr, tr.rd, tr.din, tr.dout, tr.full, tr.empty);
        end
    endtask
endclass

class scoreboard;
    mailbox #(transaction) mbx;
    transaction tr;
    event next;
    bit [7:0] din[$];
    bit [7:0] temp;
    int err = 0;
    
    function new(mailbox #(transaction) mbx);
        this.mbx=mbx;
    endfunction
    
    task run();
        forever begin
            mbx.get(tr);
            $display("[SCO]: wr:%0d rd:%0d din:%0d dout:%0d full:%0d empty%0d",tr.wr, tr.rd, tr.din, tr.dout, tr.full, tr.empty);
            
            if(tr.wr==1'b1)
            begin
                if(tr.full==1'b0)
                begin
                    din.push_front(tr.din);
                    $display("[SCO]: DATA STORED IN QUEUE :%0d",tr.din);
                end
                else
                    $display("FIFO IS FULL");
                    
            $display("------------------------------------------------------");
            end
            -> next;
        end
    endtask
endclass

class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;
    
    mailbox #(transaction) g_dmbx;
    mailbox #(transaction) m_smbx;
    
    event nextgs;
    
    virtual fifo_intf vintf;
    
    function new(virtual fifo_intf vintf);
        g_dmbx=new();
        gen=new(g_dmbx);
        drv=new(g_dmbx);
        m_smbx=new();
        mon=new(m_smbx);
        sco=new(m_smbx);
        this.vintf=vintf;
        drv.vintf=this.vintf;
        mon.vintf=this.vintf;
        gen.next=nextgs;
        sco.next=nextgs;
    endfunction
    
    task pre_test();
        drv.reset();
    endtask
    
    task test();
        fork 
            gen.run();
            drv.run();
            mon.run();
            sco.run();
        join_any
    endtask
    
    task post_test();
        wait(gen.done.triggered);
        $display("----------------------------------------------");
        $display("Error Count: %0d",sco.err);
        $display("----------------------------------------------");
        $finish();
    endtask
    
    task run();
        pre_test();
        test();
        post_test();
    endtask        
endclass

module fifo_tb;
    fifo_intf vintf();
    
    fifo DUT(vintf.clk, vintf.rst, vintf.wr, vintf.rd, vintf.din, vintf.empty, vintf.full,  vintf.dout);
    
    initial begin
        vintf.clk<=0;
    end
    
    always #10 vintf.clk=~vintf.clk;
    
    environment env;
    
    initial begin
        env=new(vintf);
        env.gen.count=10;
        env.run();
    end
endmodule
