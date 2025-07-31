# FirForge

# Real-Time Signal Processing and Repeating System

### Description

- FirForge is a real-time Signal Processing and Repeating System built on Xilinx FPGA technology. This project combines low-level digital design with configurable software control to process analog or digital signals in real time.
- Developed in VHDL using Xilinx Vivado, the system captures incoming signals, applies FIR filtering and thresholding logic, and retransmits the output via DAC or digital interfaces. The goal is to deliver high-throughput and low-latency signal handling in a structured embedded systems environment.

---

## NOTICE

- Please read through this `README.md` to better understand the project's source code and setup instructions.
- Also, make sure to review the contents of the `License/` directory.
- Your attention to these details is appreciated — enjoy exploring the project!

---

## Problem Statement

- Achieving real-time performance in signal processing is often limited by microcontroller throughput and general-purpose CPU bottlenecks.
- This project was inspired by my first experience with FPGA development using Xilinx Vivado in a Digital System Design Lab. It aims to explore FPGA-based solutions for low-latency, real-time signal acquisition and processing.

---

## Project Goals

### Build a Real-Time Signal Processing and Repeating System on FPGA

- Design and implement a system capable of ingesting, filtering, and re-emitting signals with near-zero latency using hardware-based logic components.

### Leverage FPGA Parallelism for High-Performance Signal Handling

- Utilize the natural parallelism of FPGA architecture to optimize filtering, peak detection, and logic-based retransmission tasks.

### Combine Hardware Design with Software Control

- Enable runtime reconfiguration of signal processing parameters (e.g., gain, delay, channel selection) through a software interface communicating with the FPGA.

### Explore Embedded Systems Engineering in Practice

- Reinforce VHDL concepts learned in coursework and apply simulation, synthesis, and debugging workflows using Xilinx Vivado.

### Ignite and Nurture a Passion for Electronic Engineering

- Transform academic inspiration into a functional hardware project and deepen expertise in embedded systems and digital signal processing.

---

## Tools, Materials & Resources

### Tool: Xilinx Vivado

- Used for VHDL synthesis, simulation, and on-device programming.

### Material: FPGA Development Board

- A Xilinx-compatible board with ADC/DAC IO ports was used for real-time signal interfacing.

### Resource: Digital System Design Lab Materials

- Lab manuals and past course examples served as conceptual foundations for hardware logic.

---

## Design Decision

### Use of FIR Filtering

- Finite Impulse Response filters were selected for deterministic behavior and ease of implementation in parallel logic.

### Signal Conditional Repeating

- A thresholding logic layer determines whether a signal is repeated, allowing event-based transmission control.

### Hardware-Software Co-Design

- A serial or memory-mapped interface was planned to allow external software to update filter coefficients and control flow in real time.

---

## Features

### Real-Time Signal Acquisition

- Continuously captures analog/digital inputs using on-board ADCs or external digital buses.

### Hardware-Based Filtering and Detection

- Applies low-latency FIR filtering, signal shaping, and threshold detection directly in VHDL logic.

### Conditional Signal Repeating

- Implements logic to retransmit signals only if they meet specific criteria (e.g., amplitude, frequency thresholds).

---

## Block Diagram

```plaintext
                                  ┌────────────────────────┐
                                  │    Signal Input (ADC)  │
                                  └──────────┬─────────────┘
                                             ↓
                                ┌────────────▼─────────────┐
                                │   FIR Filter Module      │
                                └────────────┬─────────────┘
                                             ↓
                             ┌──────────────▼──────────────┐
                             │  Threshold Detector Logic   │
                             └──────────────┬──────────────┘
                                             ↓
                            ┌───────────────▼──────────────┐
                            │ Conditional Repeating Module │
                            └───────────────┬──────────────┘
                                             ↓
                                  ┌─────────▼──────────┐
                                  │  Output Signal DAC │
                                  └────────────────────┘


```

---

## Functional Overview

- Signals enter the system via analog/digital interfaces and are processed through a series of hardware logic blocks (filtering → detection → repeating).
- A lightweight software layer may configure filter coefficients and thresholds at runtime via a memory-mapped or UART interface.
- The output signal is re-emitted conditionally based on the detection stage results.

---

## Challenges & Solutions

### Timing Closure in High-Speed Design

- Carefully constrained clock domains, pipelining, and reduced combinational logic depth ensured timing closure in Vivado.

### Real-Time Debugging of Hardware Logic

- Used Vivado's Integrated Logic Analyzer (ILA) to probe signal transitions and verify module behavior without re-synthesis.

---

## Lessons Learned

### Hardware Timing Is Absolute

- Timing violations in an FPGA project are not bugs—they're failed logic promises. This project taught the value of static timing analysis and constraint management.

### Simulation Isn’t Optional

- Pre-synthesis simulation using testbenches was crucial for early-stage validation and dramatically reduced downstream debugging.

---

## Project Structure

```plaintext
root/
├── License/
│   ├── LICENSE.md
│   └── NOTICE.md
│
├── .gitattributes
│
├── .gitignore
│
└── README.md

```

---

### Future Enhancements

- Add I<sup>2</sup>C or UART software control interface for dynamic parameter tuning
- Extend support for multi-channel input and concurrent signal processing
- Integrate machine learning for adaptive filtering behavior (via HLS or external processor)
