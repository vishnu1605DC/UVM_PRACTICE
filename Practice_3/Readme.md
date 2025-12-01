# 🧪 UVM Practice 3 — Blocking TLM & TLM FIFO Concepts

This practice testbench explores **UVM TLM blocking semantics** and demonstrates how transactions can be transferred either **directly** between components or via a **TLM FIFO**.

You will find **one transaction object** and **multiple UVM components** that showcase different communication patterns using **blocking put/get interfaces**.

---

## 📁 Components Overview

This practice contains the following SystemVerilog files:

| File | Role |
|------|------|
| `transa.sv` | Transaction object passed across components |
| `component_a.sv` | Producer with a `uvm_blocking_put_port` |
| `component_b.sv` | Consumer implementing `uvm_blocking_put_imp` |
| `component_b1.sv` | Consumer implementing a `uvm_blocking_get_port` for FIFO-based pulls |
| `env.sv` | Environment that optionally instantiates a **TLM FIFO** and connects ports |
| `test.sv` | UVM test instantiating the environment |
| `tb_top.sv` | Top-level module with UVM run |

---

## 🎯 What This Practice Demonstrates

Depending on configuration, this testbench can show **two distinct TLM concepts**:

### 🅰️ Mode 1 — Blocking Put Communication  
**`component_a ➝ component_b`**

- `component_a` calls `put()` in the run phase
- `component_b` implements `put_imp()` to consume data
- Demonstrates **blocking put semantics**, ensuring the sender waits until the receiver accepts the transaction

**Key Insight:**  
✔️ Simple producer → consumer handoff using **blocking put**

---

### 🅱️ Mode 2 — TLM FIFO Communication  
**`component_a ➝ FIFO ➝ component_b1`**

- Environment declares and connects a **TLM FIFO**
- `component_a` performs **blocking put** into FIFO
- `component_b1` uses **blocking get** to retrieve transactions

**Key Insight:**  
✔️ FIFO acts as a transaction queue  
✔️ Components become decoupled in time — producer and consumer run independently

---

## 🔧 TLM Interfaces Used

| Interface | Used In | Purpose |
|----------|---------|---------|
| `uvm_blocking_put_port` | `component_a` | Sends transactions synchronously |
| `uvm_blocking_put_imp` | `component_b` | Receives blocking put calls |
| `uvm_blocking_get_port` | `component_b1` | Retrieves transactions from FIFO |
| `uvm_tlm_fifo` | `env` | Stores transactions for decoupled access |

---

## 🧠 Learning Outcomes

By examining this practice, you will understand:

✨ How blocking TLM communication forces producer/consumer synchronization  
✨ How to connect ports and implementations correctly  
✨ How a TLM FIFO enables **temporal decoupling** between components  
✨ How testbench flexibility increases via interchangeable components

---

## 🏁 Summary

This practice showcases **two approaches** to TLM data movement:

| Approach | Communication Path | Highlight |
|---------|-------------------|----------|
| Direct Blocking Put | `component_a ➝ component_b` | Tight producer-consumer coupling |
| TLM FIFO Based | `component_a ➝ FIFO ➝ component_b1` | Loosely coupled timing with transaction buffering |
