# 4:2 Encoder
## Introduction
A 4:2 Encoder is a combinational logic circuit that compresses four input lines into two output lines. 
It represents the binary equivalent of the active input line, making it a fundamental component in digital
systems for reducing the number of signal lines or selecting one among many inputs.

## Working Principle
A 4:2 Encoder has four inputs and two outputs. The outputs represent the binary code of the input line that is active (high).
If more than one input is active simultaneously,the encoder does not work as intended and may result in undefined behavior unless
additional circuitry, like priority logic, is added.

## Truth Table
| I3 | I2 | I1 | I0 | Y1 | Y0 |
|----|----|----|----|----|----|
|  0 | 	0 |  0 |  1 |  0 |	0 |
|  0 | 	0 |  1 |  0 |  0 |	1 |
|  0 | 	1 |  0 |  0 |  1 |	0 |
|  1 | 	0 |  0 |  1 |  1 |	1 |

## Applications
4:2 Encoders are widely used in various digital systems and applications, such as:

Data Compression: Reducing the number of signal lines in communication systems.
Priority Encoding: Extending with priority logic to handle multiple active inputs.
Multiplexers and Demultiplexers: For routing data in digital communication.
Arithmetic and Logic Units (ALUs): Encoding control signals.
Keyboard Encoding: Determining which key is pressed in keyboards.

## Simulation 
![Sim](https://github.com/user-attachments/assets/57e9e81d-cdce-49a9-b275-a67ecaac31d5)

## Synthesis
![Syn1](https://github.com/user-attachments/assets/34fb9b69-ef64-447b-9e4f-089686d60495)
![Syn2](https://github.com/user-attachments/assets/57bc462f-1dc8-490e-85d8-66032b0fa1ea)
