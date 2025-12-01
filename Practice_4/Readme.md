# 🔁 UVM Practice 4 — Non-Blocking TLM 2.0 Initiator–Target Communication

This practice showcases **UVM TLM 2.0 non-blocking transport** using **initiator and target sockets**.  
A simple CPU-like initiator sends transactions to a target memory block and receives responses — illustrating **bidirectional communication** and **2.0-style TLM phases**.

---

## 📁 Files in This Practice

| File | Role |
|------|------|
| `transa.sv` | Transaction object with read/write request details |
| `initiator.sv` | CPU-like agent that initiates non-blocking transport |
| `target.sv` | Memory subsystem implementing the forward path for TLM 2.0 |

---

## 🚦 Core Concept

This example demonstrates **TLM-2.0 non-blocking transport** paths using:

- `nb_transport_fw` (forward path)
- `nb_transport_bw` (backward path)
- `uvm_tlm_phase_e` (communication phase)
- `uvm_tlm_sync_e` (synchronization response)
- `uvm_tlm_time` (delay modeling)

The **initiator and target can exchange data without blocking**, enabling realistic protocol-style handshakes similar to real hardware fabrics.

---

## ⚡ Component Details

### 🎯 `initiator.sv`

Acts as a **CPU** generating read/write requests.

Implements:

```systemverilog
function uvm_tlm_sync_e nb_transport_bw(
  transa pkt,
  ref uvm_tlm_phase_e phase,
  input uvm_tlm_time delay
);
Key Behaviors:

Sends transactions to the target

Receives responses asynchronously

Uses delay to mimic execution timing

🧱 target.sv
Acts as a memory subsystem.

Implements:

systemverilog
Copy code
function uvm_tlm_sync_e nb_transport_fw(
  transa pkt,
  ref uvm_tlm_phase_e phase,
  input uvm_tlm_time delay
);
Internal Memory Model:

systemverilog
Copy code
logic [31:0] mem [0:255];
Performs:

Writes pkt.data into memory on store operations

Reads from memory on load operations

Sends completion information back to the initiator via nb_transport_bw

🔁 Bidirectional Communication Flow
scss
Copy code
Initiator (nb_transport_fw) --> Target (Memory)
Initiator <-- (nb_transport_bw) Target
This round-trip establishes a request–response protocol, where both directions are handled using TLM 2.0 non-blocking transports.

🧩 What You Will Learn
✔️ How TLM-2.0 sockets differ from classic UVM TLM-1 connections
✔️ Forward vs backward paths in non-blocking transport
✔️ How phases like BEGIN_REQ, BEGIN_RESP, END_REQ, END_RESP enable temporal modeling
✔️ Modeling timing, latency, and sync responses using uvm_tlm_time and uvm_tlm_sync_e
✔️ How to build a simple but functional memory model in SystemVerilog

🖧 Communication Diagram
text
Copy code
┌────────────────┐     nb_transport_fw      ┌─────────────────────────┐
│  Initiator      │ ───────────────────────▶ │ Target (Memory System)  │
│ (CPU-like Agent)│                          │  mem[0:255] storage     │
└───────┬─────────┘                          └──────────┬──────────────┘
        │                                               │
        │  nb_transport_bw (response & phase updates)    │
        └───────────────────────────────────────────────┘
Flow Summary:

1️⃣ Initiator sends transaction request
2️⃣ Target executes read/write on memory
3️⃣ Target responds back to initiator
4️⃣ Final sync state determines continuation

🏁 Summary
This practice implements a lightweight memory access protocol using TLM-2.0 non-blocking mechanisms:

Path	Function	Direction
Forward Transport	nb_transport_fw	Initiator → Target
Backward Transport	nb_transport_bw	Target → Initiator

It offers a clean blueprint for designing TLM-2.0 based interconnects, CPUs, memory models, and bus protocols.

🚀 Next Steps
Enhance this environment by:

Adding burst transfers

Introducing address range checking

Extending protocol timing using different phases
