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

📌 Key Design Points
✅ Master initiates WISHBONE transactions (read/write operations).

✅ Slave decodes address, controls the counter and handles data transactions.

✅ Counter updates synchronously with the system clock ensuring deterministic operation.

✅ Status and counter value accessible via WISHBONE read access

WISHBONE-SoC-UP-DOWN-Counter-Project/
│
├── src/
│   ├── counter.v               # 32-bit up-down counter module
│   ├── wishbone_slave.v        # WISHBONE-compliant slave interface
│   ├── wishbone_master.v       # WISHBONE master test/demo module
│   └── top_module.v            # Top-level SoC integration module
│
└── README.md                   # Project documentation (this file)

🚀 Getting Started
1️⃣ Clone the Repository
bash
Copy
Edit
git clone https://github.com/AIAccelSid/WISHBONE-SoC-UP-DOWN-Counter-Project.git
cd WISHBONE-SoC-UP-DOWN-Counter-Project
2️⃣ Open in Vivado
Launch Xilinx Vivado.

Create a new RTL project (no board selected initially).

Add Verilog source files from src/.

Add constraints file from constraints/constraints.xdc.

Edit pin assignments to match your FPGA board.

3️⃣ Run Synthesis & Implementation
Run Synthesis.

Run Implementation.

Generate the Bitstream file.

4️⃣ Program the FPGA
Connect your FPGA development board.

Open Vivado’s Hardware Manager.

Program the device with the generated .bit file.

5️⃣ Observe Operation
Connect to the FPGA’s LEDs, serial console, or other peripherals.

Observe the counter’s behavior based on your constraints and control inputs.

✏️ How to Modify
Change Counter Width:
Modify the parameter inside counter.v to adjust bit-width.

Add New WISHBONE Registers:
Update the address mapping and logic in wishbone_slave.v.

Integrate with a Soft RISC-V CPU:
Connect the WISHBONE master signals to your RISC-V core’s memory bus interface.

🧠 Learnings & Concepts Covered
📖 WISHBONE protocol structure and interfacing.

📖 Master/Slave communication handshake techniques (ACK, STB, WE).

📖 Address decoding, register-mapped peripherals.

📖 SoC-level integration techniques in FPGA designs.

📖 Xilinx Vivado implementation flow: Synthesis → Implementation → Bitstream.

📖 Custom IP development and FPGA constraints management.

📑 References
📘 WISHBONE Specification vB4 (PDF)

📘 Xilinx Vivado Design Suite Documentation

📘 RISC-V and SoC Bus Interfacing Concepts

📜 License
This project is released under the MIT License.
Feel free to use, fork, modify, and distribute it. Contributions are highly welcome!

🙌 About the Author
Made with 💻⚙️ and a little bit of ☕ by Siddharth Singh Upadhyay
👨‍💻 AI & FPGA Hardware Engineer | ASIC & SoC Enthusiast | RISC-V Fanboy

GitHub: AIAccelSid

🚀 Build it. Tweak it. Break it. Learn it.

