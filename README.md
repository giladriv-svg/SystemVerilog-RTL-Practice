# ⚡ SystemVerilog RTL Design & Verification Journey

This repository documents my progress through the "100 Days of RTL" challenge. My focus is on writing clean, synthesizable SystemVerilog code and implementing self-checking testbenches.

## 🛠️ Tech Stack
* **Language:** SystemVerilog / Verilog
* **Simulation:** Vivado / ModelSim / EDA Playground
* **Methodology:** Directed testing with randomized inputs

## 📂 Progress Log

| Day | Module | Description | Key Concept | Status |
| :--- | :--- | :--- | :--- | :--- |
| **01** | `mux_2to1` | 2-to-1 Multiplexer | Combinational Logic | ✅ Verified |
| **02** | `d_flip_flop` | D-Flip Flop with Async Reset | Sequential Logic | ✅ Verified |
| **03** | `edge_detector`| Rising Edge Pulse Generator | State Sampling | ✅ Verified |
| **04** | `alu_4bit` | Arithmetic Logic Unit | Case-based Logic | ✅ Verified |
| **05** | `fsm_seq_det` | 1011 Sequence Detector | Mealy/Moore FSM | 🚧 WIP |

## 🔬 Verification Approach
Every design in this repo includes a Testbench (`_tb.sv`). I use:
1. **Initial Blocks:** For stimulus generation.
2. **Task-based Testing:** To keep testbenches modular.
3. **Automated Checks:** Using `if/else` or `assertions` to flag errors in the console.

## 📈 Simulation Example


---
*This is an active learning project. Updates are pushed as I progress through more complex modules like FIFOs, Round-Robin Schedulers, and SPI controllers.*
