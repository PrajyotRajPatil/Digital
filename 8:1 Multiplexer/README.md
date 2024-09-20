# 8:1 Multiplexer
## Introduction
An 8:1 Multiplexer (MUX) is a combinational circuit that selects one of eight input signals and forwards it to the output based on three control signals (select lines). It is an essential component in digital systems for data routing, control signal selection, and function generation, providing a more complex selection mechanism than smaller MUX configurations.

## Working Principle
The 8:1 MUX has eight inputs (I0 to I7), three select lines (Sel[2:0]), and one output.
The select lines determine which input is passed through to the output.
Each combination of the select lines corresponds to one specific input being connected to the output.

When Sel = 000, the output (Y) is equal to I0
When Sel = 001, the output (Y) is equal to I1
When Sel = 010, the output (Y) is equal to I2
When Sel = 011, the output (Y) is equal to I3
When Sel = 100, the output (Y) is equal to I4
When Sel = 101, the output (Y) is equal to I5
When Sel = 110, the output (Y) is equal to I6
When Sel = 111, the output (Y) is equal to I7

## Truth Table
The following truth table illustrates the behavior of an 8:1 MUX, showing how the select lines determine which input is connected to the output.

|I0[3:0]|I1[3:0]|I2[3:0]|I3[3:0]|I4[3:0]|I5[3:0]|I6[3:0]|I7[3:0]|Sel[2:0]|Y[3:0]|
|-------|-------|-------|-------|-------|-------|-------|-------|--------|------|
| 0000	| 0000	| 0000	| 0000	| 0000	| 0000	| 0000	| 0000	|   000	 | 0000 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   000	 | 0000 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   001	 | 1111 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   010	 | 1010 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   011	 | 1100 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   100  | 0011 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   101  | 0101 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   110  | 0110 |
| 0000	| 1111	| 1010	| 1100	| 0011	| 0101	| 0110	| 1001	|   111	 | 1001 |

## Applications
**An 8:1 Multiplexer is used in various fields for more complex data selection and routing:**

*Data Routing: Directing multiple data inputs to a single output channel.*

*Function Generation: Creating a more comprehensive logic function using fewer resources.*

*Signal Multiplexing: Choosing from a larger set of signals for efficient transmission and switching.*

*Control Systems: Allowing for the selection of different control paths based on control inputs.*

*Communication Systems: Multiplexing different data streams for efficient utilization of transmission media.*

## Simulation
![sim](https://github.com/user-attachments/assets/3f7f7beb-8402-4a6f-aad4-f3b790544a42)

## Synthesis
![syn1](https://github.com/user-attachments/assets/e8c2c8c5-9c5c-411a-a520-dd25ce99b923)
![syn2](https://github.com/user-attachments/assets/0cbcd38e-6ce5-4db9-97d6-2868e71635dd)
