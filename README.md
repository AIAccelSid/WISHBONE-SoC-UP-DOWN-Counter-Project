# WISHBONE-SoC-UP-DOWN-Counter-Project
# WISHBONE SoC Counter Project

Welcome to the **WISHBONE SoC Counter** project! This project demonstrates the use of the **WISHBONE** interface in FPGA design, utilizing **Xilinx Vivado** to create a **System-on-Chip (SoC)** design. The project integrates:

- **Counter Module**: A simple 32-bit counter controlled via the WISHBONE interface.
- **WISHBONE Master and Slave**: Implementing the WISHBONE protocol for communication between components.
- **FPGA Constraints**: The constraints files for FPGA pin and clock assignments.
- **SoC Integration**: Top-level integration for creating a full SoC.

## Features
- **WISHBONE Interface**: Open-source Verilog implementation.
- **Counter Module**: A basic counter that increments with each write command.
- **Xilinx Vivado**: Complete integration using Vivado tools and IP.
- **Constraints Files**: Includes Xilinx-specific constraints for FPGA programming.
- **SoC Design**: Full SoC-level integration with the WISHBONE interface.

## Requirements
- **Xilinx Vivado** (202X or later)
- **Xilinx FPGA board** (e.g., Artix-7 or Kintex-7)
- Basic knowledge of **Verilog**, **FPGA design**, and **SoC integration**.

## Getting Started
1. Clone the repository: 
    ```bash
    git clone https://github.com/AIAccelSid/WISHBONE-SoC-UP-DOWN-Counter-Project.git
    ```
2. Open the project in **Vivado** and check out the files in the `src/` and `constraints/` directories.
3. Modify the constraints as needed for your FPGA board (see `constraints/` folder).
4. Synthesize, implement, and generate the bitstream.
5. Program the FPGA, connect to the outputs, and observe the counter operation.

## Project Components
- **counter.v**: Simple 32-bit counter module.
- **wishbone_master.v / wishbone_slave.v**: Verilog modules implementing the WISHBONE protocol.
- **top_module.v**: Integrates counter with WISHBONE interface for SoC design.
- **constraints.xdc**: Pin and timing constraints for Vivado-based FPGA programming.

## License
This project is licensed under the MIT License.
