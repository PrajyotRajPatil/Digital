# Single Port RAM Module for 1024 Words
## Introduction
A Single-Port RAM is a type of memory where only one access port is available for both read and write operations. It allows either a read or a write operation at a time, but not both simultaneously.

This specific implementation features:
🧮 1024 words
📦 32 bits per word
📍 10-bit address input (because 2^10 = 1024 )

## Working Principle
The RAM uses a clock (clk) for synchronous operation.

A write enable (wr_enable) signal determines if the operation is a write.

If wr_enable = 1, data from data_in is stored at the specified addr.

If wr_enable = 0, the data at addr is sent to data_out.

The address is 10 bits to cover all 1024 locations (from 0 to 1023).

## Applications
Cache memory in processors

Register file storage

Configuration memories

Control systems needing fast storage

Custom embedded memory for FPGAs

## Signal Descriptions
|  Signal   | Width |	 Direction |	Description  |
|-----------|-------|------------|---------------|
|    clk 	  | 1-bit |	   Input   |  Clock signal |
| wr_enable	| 1-bit	|    Input   |  Write Enable |
|   addr	  | 10-bit|	   Input	 |  Address line |
| data_in   |	32-bit|	   Input	 | Data in memory|
| data_out	| 32-bit|	  Output	 | Data from memory|

## Simulation
![Screenshot (126)](https://github.com/user-attachments/assets/4b098666-29a8-47bb-b64f-462bac9074e5)
![Screenshot 2025-04-13 210433](https://github.com/user-attachments/assets/5337f534-9bfd-4d65-bf84-e3e0b34a689c)

## Elaborated Design
![Screenshot (127)](https://github.com/user-attachments/assets/aaf52c03-3a36-4604-8d66-71424e8f8285)
