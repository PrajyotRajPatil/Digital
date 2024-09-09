# FourBit Parallel Adder
## Introduction
The four-bit parallel adder is a digital circuit designed to efficiently add two four-bit binary numbers. 
It combines multiple full adders (FAs) to perform addition simultaneously on each bit position, 
providing a faster alternative to cascaded adders like ripple carry adders.

## Truth Table
|A[3:0]|B[3:0]|Cin|Sum[3:0]| Carry |
|------|------|---|--------|-------|
| 0000 | 0000 | 0 |  0000  |   0   |
| 0001 | 0001 | 0 |  0010  |   0   |
| 0110 | 0011 | 0 |  1001  |   0   |
| 1010 | 0101 | 0 |  1111  |   0   |
| 1100 | 1100 | 1 |  1001  |   1   |
| 1111 | 1111 | 1 |  1111  |   1   |

## Working Principle
The Four-Bit Parallel Adder works by connecting four full adders in series, 
each adder handling a pair of corresponding bits from the two input binary numbers and the carry from the previous stage.

## Applications
**Four-bit parallel adders are essential components in various digital systems, including:**
*Arithmetic Logic Units (ALUs): Perform mathematical operations (addition, subtraction, multiplication, etc.) within 
microprocessors and other processors.*

*Digital Signal Processors (DSPs): Handle real-time signal processing applications, requiring fast numeric computations.*

*High-performance computing: Used in systems where speed and efficiency are critical.*

## Simulation
![sim](https://github.com/user-attachments/assets/e94a9ff1-1bb9-4297-973a-47f550c60920)

## Synthesis
![syn1](https://github.com/user-attachments/assets/db67d6a4-7509-4fcd-a0a5-74ba47076c7a)
![syn2](https://github.com/user-attachments/assets/b4113876-8b0c-494b-aa6e-2baee2daaf89)
![syn3](https://github.com/user-attachments/assets/1e500b1d-2542-4786-808a-ef1539305448)
