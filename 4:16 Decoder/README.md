# 4:16 Decoder
## Introduction
A 4-to-16 decoder is a combinational circuit that converts a 4-bit binary input into 16 unique outputs. 
Only one output is HIGH (1) at any time, and all others are LOW (0), corresponding to the binary input value.

## Working Principle
The 4-to-16 decoder has:

4 inputs (in[3:0])

16 outputs (out[15:0])

It activates exactly one of the 16 outputs depending on the binary value of the input.

## Truth Table 
| in[3:0] |     out[15:0]    |
|---------|------------------|
|  0000   | 0000000000000001 |
|  0001   | 0000000000000010 |
|  0010   | 0000000000000100 |
|  0011   | 0000000000001000 |
|  0100   | 0000000000010000 |
|  0101   | 0000000000100000 |
|  0110   | 0000000001000000 |
|  0111   | 0000000010000000 |
|  1000   | 0000000100000000 |
|  1001   | 0000001000000000 |
|  1010   | 0000010000000000 |
|  1011   | 0000100000000000 |
|  1100   | 0001000000000000 |
|  1101   | 0010000000000000 |
|  1110   | 0100000000000000 |
|  1111   | 1000000000000000 |

## Simulation
![Screenshot (119)](https://github.com/user-attachments/assets/fa2bcdf4-6bbe-430e-8226-5e9808ca7865)

## Elaborated Design 
![Screenshot (120)](https://github.com/user-attachments/assets/f6ca21f8-3722-4c37-a47b-3de8f993f32a)
