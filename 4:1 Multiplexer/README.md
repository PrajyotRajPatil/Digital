# 4:1 Multiplexer 
## Introduction
The 4:1 Multiplexer (MUX) is a digital circuit that selects one of four input signals and forwards it to the output based on two control signals (select lines).
Multiplexers are widely used in digital systems for data routing, function selection, and signal processing.

## Working Principle
A 4:1 MUX has four inputs, two select lines, and one output. The select lines (Sel[1:0]) determine which input is connected to the output:
When Sel = 00, the output (Y) is equal to input A.
When Sel = 01, the output (Y) is equal to input B.
When Sel = 10, the output (Y) is equal to input C.
When Sel = 11, the output (Y) is equal to input D.

## Truth Table
|I0[3:0]|I1[3:0]|I2[3:0]|I3[3:0]|Sel[1:0]|Y[3:0]|
|-------|-------|-------|-------|-------|-------|
|  0000	|  0000	| 0000	| 0000 	|   00  |	 0000 |
|  0000	|  1111	| 1010	| 1100	|   00	|  0000 |
|  0000	|  1111	| 1010	| 1100	|   01	|  1111 |
|  0000	|  1111	| 1010	| 1100	|   10	|  1010 |
|  0000	|  1111	| 1010	| 1100	|   11	|  1100 |
|  1010	|  0101	| 0011	| 1111	|   00	|  1010 |
|  1010	|  0101	| 0011	| 1111	|   01	|  0101 |
|  1010	|  0101	| 0011	| 1111	|   10	|  0011 |
|  1010	|  0101	| 0011	| 1111	|   11	|  1111 |

## Applications
**4:1 Multiplexers are widely used in various digital systems and applications, such as:**

*Data Routing: Directing data from multiple sources to a single destination.*

*Function Generators: Implementing multiple functions using a single circuit.*

*Control Systems: Selecting control signals in automated systems.*

*Signal Selection: Multiplexing different signals for efficient data transmission.*

*Processor Design: Routing different data buses to a single processing unit.*

## Simulation
![sim](https://github.com/user-attachments/assets/2f21b72f-796b-4059-bf24-8a18501ec079)

## Synthesis
![syn1](https://github.com/user-attachments/assets/1dddff90-b71b-4658-9db5-4b4ae9c9e173)
![syn2](https://github.com/user-attachments/assets/81844b8f-7eed-4311-9d85-63f579d351e6)
