# 🛰️ WISHBONE SoC Up-Down Counter Project

## 📚 Introduction

Welcome to the **WISHBONE SoC Up-Down Counter Project** — a hands-on demonstration of integrating the **WISHBONE open-source bus protocol** into FPGA-based System-on-Chip (SoC) designs. This project combines **modular Verilog RTL design**, **WISHBONE-compliant master-slave interfaces**, and **Xilinx Vivado implementation flows** to create a flexible, scalable counter peripheral within a SoC environment.

Whether you're a student, a hardware engineer, or a tech hobbyist looking to understand SoC interfacing via open bus protocols, this project provides a complete workflow:  
📌 RTL design → Bus interfacing → SoC integration → Synthesis → FPGA implementation.

---

## 📌 Why WISHBONE?

**WISHBONE** is an open-source, royalty-free SoC bus protocol standard designed for portability and simplicity. It allows various IP cores (processors, peripherals, accelerators) to communicate via a common interface.

**Advantages:**
- Open-source and license-free.
- Simple signal structure (CLK, RST, STB, WE, ACK, etc.).
- Supports both Master and Slave devices.
- Scalable for simple to complex SoC designs.
- Compatible with custom IP cores and soft CPUs like **RISC-V**.

This project is a practical example of how a **custom counter peripheral** can be controlled via WISHBONE, providing hands-on exposure to SoC bus interfacing techniques.

---

## 📦 Project Overview

The project includes:

| 📁 File / Module        | 📖 Description                                |
|:-----------------------|:----------------------------------------------|
| `counter.v`              | 32-bit up-down counter peripheral             |
| `wishbone_master.v`      | WISHBONE master interface for demo/testing    |
| `wishbone_slave.v`       | WISHBONE slave module wrapping the counter    |
| `top_module.v`           | SoC-level integration with master and slave   |

| `README.md`              | This documentation file                      |

---

## 🎯 Project Features

- **📡 WISHBONE Bus Integration**: Clean, modular, open-source implementation.
- **🔢 Up-Down Counter**: 32-bit, direction-selectable, enable-controlled counter.
- **🖧 SoC Integration**: Combines master, slave, and peripheral in a unified SoC.
- **📑 Xilinx Vivado Project**: Designed for easy integration into Vivado IDE.


## ⚙️ Requirements

- **Xilinx Vivado (2020.1 or later)**
- **Xilinx FPGA Board** (Recommended: Artix-7 AC701, Nexys A7, or Kintex-7)
- **Basic knowledge of:**
  - Verilog HDL
  - WISHBONE protocol (vB4 spec preferred)
  - FPGA development flows (Synthesis, Implementation, Bitstream Generation)
  - SoC design principles

---

## 📊 WISHBONE Address Mapping

| Address       | Width | Functionality                          |
|:---------------|:--------|:------------------------------------------|
| `0x00000000`    | 32-bit  | Control Register `[1] up_down, [0] enable` |
| `0x00000004`    | 32-bit  | Current counter value                      |

**Control Bits:**
- `enable` (bit 0): Enables counter operation.
- `up_down` (bit 1): `1` = Count up, `0` = Count down.

---

## 📐 Design Architecture

```text
+------------+        +---------------+       +-----------------+
| WISHBONE   |        | WISHBONE Slave|       | Counter Peripheral|
| Master     +------->+ Interface     +------>+ (32-bit Counter)  |
| (Host CPU) |        | (with control |       |                  |
+------------+        |  + status reg)|       +-----------------+
                      +---------------+
