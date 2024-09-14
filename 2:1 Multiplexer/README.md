# 2:1 Multiplexer
## Introduction
The 2:1 Multiplexer (MUX) is a basic digital circuit that selects one of the two input signals and forwards it to the output based on a control signal (select line).
Multiplexers are fundamental components in digital systems used for routing data, signal selection, and data processing.

## Working Principle
A 2:1 MUX has two inputs, one select line, and one output. The select line determines which input is connected to the output:
When the select line (sel) is 0, the output (y) is equal to input a.
When the select line (sel) is 1, the output (y) is equal to input b.

## Truth Table
|Sel|A[3:0]|B[3:0]|Y[3:0]|
|---|------|------|------|
| 0 | 0000 | 0000 | 0000 |
| 0 | 0000 | 1111 | 0000 |
| 1 | 0000 | 1111 | 1111 |
| 0 | 1010 | 0101 | 1010 |
| 1 | 1010 | 0101 | 0101 |
| 0 | 1111 | 0000 | 1111 |
| 1 | 1111 | 0000 | 0000 |
| 0 | 1100 | 0011 | 1100 |
| 1 | 1100 | 0011 | 0011 |

## Applications
**2:1 Multiplexers are widely used in various digital systems and applications, such as:**

*Data Routing: Directing data paths in communication systems.*

*Function Generators: Combining multiple functions into one circuit.*

*Arithmetic Circuits: Selecting between operands in ALUs.*

*Memory Access: Controlling access to shared memory.*

*Signal Selection: Choosing signals in control systems.*

*Processor Design: Routing different data sources to a single destination.*

## Simulation
![sim](https://github.com/user-attachments/assets/f993881d-83c2-4861-b5bf-cc50747af642)

## Synthesis
![syn](https://github.com/user-attachments/assets/fbf96b3a-a311-4b8a-8d38-de03756ec126)
