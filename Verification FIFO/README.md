# FIFO Elaborated Schematic
<img width="1500" height="724" alt="Screenshot 2026-01-19 115559" src="https://github.com/user-attachments/assets/9a267b24-37fd-4fc0-86ba-59814b88632b" />

# FIFO Verification Waveform
<img width="1845" height="416" alt="Screenshot 2026-01-19 154810" src="https://github.com/user-attachments/assets/3420f63c-766f-40a8-9cde-44d535709972" />

# FIFO Verification Log
#### Vivado Simulator does not support tracing of System Verilog Dynamic Type object.
#### INFO: [Wavedata 42-43] There are no traceable objects to add.
#### # run 1000ns
#### [DRV]: DUT Reset done
#### ---------------------------------------
#### [GEN]: oper:1 Iter:1
#### [DRV]: DATA WRITE data:10
#### [MON]: wr:1 rd:0 din:10 dout:0 full:0 empty1
#### [SCO]: wr:1 rd:0 din:10 dout:0 full:0 empty1
#### [SCO]: DATA STORED IN QUEUE :10
#### ------------------------------------------------------
#### [GEN]: oper:1 Iter:2
#### [DRV]: DATA WRITE data:3
#### [MON]: wr:1 rd:0 din:3 dout:0 full:0 empty0
#### [SCO]: wr:1 rd:0 din:3 dout:0 full:0 empty0
#### [SCO]: DATA STORED IN QUEUE :3
#### ------------------------------------------------------
#### [GEN]: oper:0 Iter:3
#### [DRV]: DATA READ
#### [MON]: wr:0 rd:1 din:3 dout:10 full:0 empty0
#### [SCO]: wr:0 rd:1 din:3 dout:10 full:0 empty0
#### [GEN]: oper:1 Iter:4
#### [DRV]: DATA WRITE data:8
#### [MON]: wr:1 rd:0 din:8 dout:10 full:0 empty0
#### [SCO]: wr:1 rd:0 din:8 dout:10 full:0 empty0
#### [SCO]: DATA STORED IN QUEUE :8
#### ------------------------------------------------------
#### [GEN]: oper:1 Iter:5
#### [DRV]: DATA WRITE data:15
#### [MON]: wr:1 rd:0 din:15 dout:10 full:0 empty0
#### [SCO]: wr:1 rd:0 din:15 dout:10 full:0 empty0
#### [SCO]: DATA STORED IN QUEUE :15
#### ------------------------------------------------------
#### [GEN]: oper:0 Iter:6
#### [DRV]: DATA READ
#### [MON]: wr:0 rd:1 din:15 dout:3 full:0 empty0
#### [SCO]: wr:0 rd:1 din:15 dout:3 full:0 empty0
#### [GEN]: oper:0 Iter:7
#### [DRV]: DATA READ
#### [MON]: wr:0 rd:1 din:15 dout:8 full:0 empty0
#### [SCO]: wr:0 rd:1 din:15 dout:8 full:0 empty0
#### [GEN]: oper:0 Iter:8
#### [DRV]: DATA READ
#### [MON]: wr:0 rd:1 din:15 dout:15 full:0 empty0
#### [SCO]: wr:0 rd:1 din:15 dout:15 full:0 empty0
#### [GEN]: oper:0 Iter:9
#### [DRV]: DATA READ
#### [MON]: wr:0 rd:1 din:15 dout:15 full:0 empty1
#### [SCO]: wr:0 rd:1 din:15 dout:15 full:0 empty1
#### [GEN]: oper:1 Iter:10
#### [DRV]: DATA WRITE data:13
#### [MON]: wr:1 rd:0 din:13 dout:15 full:0 empty1
#### [SCO]: wr:1 rd:0 din:13 dout:15 full:0 empty1
#### [SCO]: DATA STORED IN QUEUE :13
#### ------------------------------------------------------
#### ----------------------------------------------
#### Error Count: 0
#### ----------------------------------------------
#### $finish called at time : 690 ns : File "E:/DVLSI Verification Vivado/fifo_sv_verification/fifo_sv_verification.srcs/sources_1/new/fifo_tb.sv" Line 200
#### INFO: [USF-XSim-96] XSim completed. Design snapshot 'fifo_tb_behav' loaded.
#### INFO: [USF-XSim-97] XSim simulation ran for 1000ns
#### launch_simulation: Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 2514.055 ; gain = 0.000
