# Risc-Process
# MIPS 32-bit Pipelined Processor

## Overview
This repository contains a Verilog implementation of a **MIPS 32-bit Pipelined Processor** with **5 stages**:

1. **Instruction Fetch (IF)**
2. **Instruction Decode (ID)**
3. **Execution (EX)**
4. **Memory Access (MEM)**
5. **Write Back (WB)**

The processor supports **arithmetic, logical, load/store, and branch instructions**. It is implemented using **clock gating techniques** with two-phase clocking (`clk1` and `clk2`).

---

## Features
- **Pipelined Architecture**: Implements a **5-stage pipeline** for instruction execution.
- **Hazard Handling**: Basic mechanisms for data hazards and branch prediction.
- **Register File**: Stores 32 registers for operations.
- **Instruction Memory (IMEM) & Data Memory (DMEM)**: Memory for storing instructions and data.
- **Control Unit**: Determines instruction type and signals execution flow.
- **Branch Handling**: Includes conditional branching with `beqz` and `bneqz`.
- **Multi-cycle Execution**: Uses two-phase clocking to optimize processing.

---

## Processor Design

### **Pipeline Stages**

#### 1. **Instruction Fetch (IF)**
- Fetches instruction from memory.
- Handles branch predictions.
- Updates the **Program Counter (PC)**.

#### 2. **Instruction Decode (ID)**
- Decodes the fetched instruction.
- Reads registers.
- Sign-extends immediate values.
- Identifies instruction type.

#### 3. **Execution (EX)**
- Executes ALU operations (ADD, SUB, AND, OR, SLT, MUL, etc.).
- Computes memory addresses for `lw` and `sw`.
- Evaluates branch conditions.

#### 4. **Memory Access (MEM)**
- Reads/Writes data to memory.
- Handles store (`sw`) and load (`lw`) operations.

#### 5. **Write Back (WB)**
- Writes results back to the register file.
- Ensures correct forwarding of data to future instructions.

---

## Supported Instructions

### **Register-Register ALU Operations**
| Opcode | Instruction | Description |
|--------|------------|-------------|
| 000000 | ADD  | R[rd] = R[rs] + R[rt] |
| 000001 | SUB  | R[rd] = R[rs] - R[rt] |
| 000010 | AND  | R[rd] = R[rs] & R[rt] |
| 000011 | OR   | R[rd] = R[rs] | R[rt] |
| 000100 | SLT  | R[rd] = (R[rs] < R[rt]) ? 1 : 0 |
| 000101 | MUL  | R[rd] = R[rs] * R[rt] |

### **Immediate Operations**
| Opcode | Instruction | Description |
|--------|------------|-------------|
| 001010 | ADDI  | R[rt] = R[rs] + Imm |
| 001011 | SUBI  | R[rt] = R[rs] - Imm |
| 001100 | SLTI  | R[rt] = (R[rs] < Imm) ? 1 : 0 |

### **Memory Instructions**
| Opcode | Instruction | Description |
|--------|------------|-------------|
| 001000 | LW  | Load word from memory |
| 001001 | SW  | Store word in memory |

### **Branch Instructions**
| Opcode | Instruction | Description |
|--------|------------|-------------|
| 001101 | BNEQZ  | Branch if R[rs] ≠ 0 |
| 001110 | BEQZ  | Branch if R[rs] == 0 |

### **Special Instructions**
| Opcode | Instruction | Description |
|--------|------------|-------------|
| 111111 | HALT  | Stop execution |

---

## Files & Modules

| File | Description |
|------|-------------|
| `pipe_mips_32.v` | Main MIPS pipelined processor design |
| `testbench.v` | Testbench for verifying processor behavior |
| `README.md` | Documentation for the project |

---

## How to Simulate
### **Using Vivado
1. Open your simulator (Vivado).
2. Load `pipe_mips_32.v` and `testbench.v`.
3. Run the simulation and observe the output.
4. Check register/memory values to verify execution.

---

## Example Test Case
### **Instruction Sequence**
```
ADDI R1, R0, #10  // R1 = 10
ADDI R2, R0, #20  // R2 = 20
ADD R3, R1, R2    // R3 = R1 + R2 (30)
SW R3, 0(R4)      // Store R3 at memory[R4]
HALT              // Stop execution
```

### **Expected Results**
- `R1 = 10`
- `R2 = 20`
- `R3 = 30`
- `mem[R4] = 30`

---

## Future Enhancements
- **Data Hazard Handling (Forwarding & Stalling)**
- **Full Branch Prediction Implementation**
- **Floating-Point Operations Support**

---

## Contributors
- **Your Name** - Bolisetty Thulasi Vignan

---

## License
This project is open-source and licensed under the MIT License.

