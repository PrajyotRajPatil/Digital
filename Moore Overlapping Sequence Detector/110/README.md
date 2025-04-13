# Moore Overlapping 110 detection
## Introduction
A Moore FSM is a type of finite state machine where the output depends only on the current state, not on the input. 
This example detects the binary sequence 110 in a serial bit stream, and allows overlapping sequences.

## Working Peinciple
Input: A serial bit stream (x)

Output: A detection signal (y)

Output y = 1 only after detecting "110", regardless of what's next

Overlapping is allowed, e.g., input 110110 should detect two sequences

## Application
Sequence detection in serial data streams

Bit pattern monitoring in communication systems

Control logic in microcontrollers

Error detection systems

Digital signal processing tasks

## Simulation
![Screenshot (122)](https://github.com/user-attachments/assets/350d36e3-42a2-40be-8c30-047691ada038) 
![Screenshot (121)](https://github.com/user-attachments/assets/ad1891bc-e64f-44a6-b9a8-dd3ba5b39e05)

## Elaborated Design
![Screenshot (123)](https://github.com/user-attachments/assets/5db4aefe-250e-4f71-b00a-51a873d62855)
