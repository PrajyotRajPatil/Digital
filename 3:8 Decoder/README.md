# 3:8 Decoder
## Introduction 
A 3-to-8 decoder is a combinational circuit that takes a 3-bit binary input and activates exactly one of the eight outputs based on the input value. 
It’s widely used in digital systems for address decoding, memory selection, and control logic.

## Working Principle
The 3-to-8 decoder has:

3 inputs (in[2:0])

8 outputs (out[7:0])

Only one output is HIGH (1) at a time. The output bit that becomes 1 corresponds to the binary value of the input.

## Truth Table
| in[2:0] | out[7:0] |
|---------|----------|
|   000	  | 00000001 |
|   001	  | 00000010 |
|   010   |	00000100 |
|   011   |	00001000 |
|   100	  | 00010000 |
|   101   |	00100000 |
|   110	  | 01000000 |
|   111   |	10000000 |

## Applications
Address decoding in memory circuits.

Enabling specific registers in processors.

Control signal generation in microcontrollers.

Instruction decoding in CPUs.

State machine transition logic.

## Simulation
![Screenshot (117)](https://github.com/user-attachments/assets/95bd9758-9e6d-42cc-a07a-54a4fc05e946)

## Elaborated Design 
![Screenshot (118)](https://github.com/user-attachments/assets/69ee4181-afa1-471c-9ebc-8bdc537ecaca)
