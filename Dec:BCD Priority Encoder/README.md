# Decimal:BCD Priority Encoder
## Introduction
A Decimal-to-BCD (Binary-Coded Decimal) Priority Encoder is a combinational circuit that converts a single active decimal 
input (0–9) into its corresponding 4-bit BCD output.It prioritizes the highest-numbered active input when multiple inputs 
are active simultaneously, making it suitable for systems requiring conflict resolution.

## Working Principle
This encoder has 10 input lines (one for each decimal digit) and 4 output lines representing the BCD equivalent of the highest active input.
Priority encoding ensures that the highest-priority input (corresponding to the largest number) takes precedence in cases of simultaneous activation.

## Truth Table
| I[9] | I[8] | I[7] | I[6] | I[5] | I[4] | I[3] | I[2] | I[1] | I[0] | Y[3] | Y[2] | Y[1] | Y[0] |
|------|------|------|------|------|------|------|------|------|------|------|------|------|------|
|  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |
|  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  1   |  0   |  0   |  0   |  0   |
|  0   |  0   |  0   |  0   |  0   |  0   |  0   |  0   |  1   |  X   |  0   |  0   |  0   |  1   |
|  0   |  0   |  0   |  0   |  0   |  0   |  0   |  1   |  X   |  X   |  0   |  0   |  1   |  0   |
|  0   |  0   |  0   |  0   |  0   |  0   |  1   |  X   |  X   |  X   |  0   |  0   |  1   |  1   |
|  0   |  0   |  0   |  0   |  0   |  1   |  X   |  X   |  X   |  X   |  0   |  1   |  0   |  0   |
|  0   |  0   |  0   |  0   |  1   |  X   |  X   |  X   |  X   |  X   |  0   |  1   |  0   |  1   |
|  0   |  0   |  0   |  1   |  X   |  X   |  X   |  X   |  X   |  X   |  0   |  1   |  1   |  0   |
|  0   |  0   |  1   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  0   |  1   |  1   |  1   |
|  0   |  1   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  1   |  0   |  0   |  0   |
|  1   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  X   |  1   |  0   |  0   |  1   |

## Applications
Decimal-to-BCD Priority Encoders are commonly used in:

Digital Displays: Driving seven-segment displays for decimal digits.
Input Devices: Scanning numeric keyboards and input panels.
Data Compression: Reducing the number of data lines in decimal-to-digital systems.
Arithmetic Circuits: Encoding control signals in systems using decimal numbers.
Priority Resolvers: Handling simultaneous inputs with a predefined priority.

## Simulation 
![Sim](https://github.com/user-attachments/assets/8a367953-4b1c-45dc-9e85-86e4f05dbb33)

## Synthesis
![Syn1](https://github.com/user-attachments/assets/ca14020b-0034-4d77-9800-6c0c94310074)
