# 8:3 Encoder
## Introduction
An 8:3 Encoder is a combinational logic circuit that compresses eight input lines into three output lines.
It outputs the binary representation of the active input line. Encoders are essential for data compression and efficient signal transmission in digital systems.

## Working Principle
The 8:3 Encoder has eight inputs and three outputs. The outputs correspond to the binary code of the input line that is active (high).
If multiple inputs are active simultaneously, the encoder's behavior becomes undefined unless additional logic, like priority encoding, is implemented.

## Truth Table
| I7 | I6 | I5 | I4 | I3 | I2 | I1 | I0 | Y2 | Y1 | Y0 |
|----|----|----|----|----|----|----|----|----|----|----|
|  0 | 	0 |  0 |  0 |  0 |	0 |  0 | 	1 |  0 |  0 |  0 |
|  0 | 	0 |  0 |  0 |  0 |	0 |  1 | 	0 |  0 |  0 |  1 |
|  0 | 	0 |  0 |  0 |  0 |	1 |  0 | 	0 |  0 |  1 |  0 |
|  0 | 	0 |  0 |  0 |  1 |	0 |  0 | 	0 |  0 |  1 |  1 |
|  0 | 	0 |  0 |  1 |  0 |	0 |  0 | 	0 |  1 |  0 |  0 |
|  0 | 	0 |  1 |  0 |  0 |	0 |  0 | 	0 |  1 |  0 |  1 |
|  0 | 	1 |  0 |  0 |  0 |	0 |  0 | 	0 |  1 |  1 |  0 |
|  1 | 	0 |  0 |  0 |  0 |	0 |  0 | 	0 |  1 |  1 |  1 |

## Applications
8:3 Encoders are widely used in various digital systems and applications, such as:

Data Compression: Reducing the number of data lines in communication systems.
Priority Encoding: Resolving multiple active inputs with priority logic.
Control Signals: Encoding control signals in microprocessors and ALUs.
Keyboard Scanning: Determining which key is pressed in a keyboard matrix.
Multiplexers and Demultiplexers: Used for routing data efficiently in digital circuits.

## Simulation 
![Sim](https://github.com/user-attachments/assets/bb34632f-de9d-4138-bc68-2a46cec07f15)

## Synthesis
![Syn1](https://github.com/user-attachments/assets/5b642fc1-adc1-4645-a11b-94b1eacf5f76)
![Syn2](https://github.com/user-attachments/assets/2ec64f8a-d8d5-484f-b565-54129f5ebb1a)
![Syn3](https://github.com/user-attachments/assets/6aa0a83c-1a08-4d17-81a5-0e26b1b52955)
