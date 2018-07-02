# Pipeline MIPS CPU
This project implements the theory of MIPS pipeline by Verilog and is simulated by ModelSim. 

### Know More
The five stages are **Instruction Fetch(IF), Instruction Decode(ID), Execution(EX), Memory(MEM),** and **Write Back(WB)**. In this design, one clock cycle is 20 ns; every signal is triggered at a positive edge. Data in register and memory are provided. The testing instructions include **lw, beq, add, sub, j, or,** and **sw**.

Below is the screenshot of the simulation of lw instruction:
![alt text](https://github.com/liliw/PIPELINED-MIPS-CPU/blob/master/mips_pipeline/%231_lw.png)

Please check [CA_FinalReport_v2.pdf](./mips_pipeline/CA_FinalReport_v2.pdf) for more information.

## Built With
- ModelSim - The simulator used

## Authors
- Li-Wei Li

## Acknowledgement
- Computer Organization and Design: the Hardware/Software Interface. 5th Edition. 
