# 🧪 UVM_PRACTICE — Practice 2: TLM Non-Blocking Ports / Imp ✨

A small UVM practice testbench focused on **TLM non-blocking ports/imp** to explore producer/consumer interactions using `can_` / `try_` style handshakes.

---

## 🚀 Overview

This practice testbench contains four components designed to exercise **UVM TLM non-blocking semantics**:

- `component_a` — implements a non-blocking **put port** (producer)
- `component_b` — implements a non-blocking **put implementation** (consumer)
- `component_a1` — implements a non-blocking **get port**
- `component_b1` — implements a non-blocking **get implementation**

The goal is to demonstrate:
- Non-blocking TLM transfers (producer checks availability before push)
- Usage pattern: `can_put()` → `try_put()` (sender-side checks)
- Flexible port ↔ implementation connectivity
- A minimal, extendable testbench skeleton

---

## 🧩 What This Demonstrates

- `uvm_nonblocking_put_port` / `uvm_nonblocking_put_imp`
- `uvm_nonblocking_get_port` / `uvm_nonblocking_get_imp`
- Proper `can_put` / `try_put` style flow
- How producers and consumers can handshake without blocking

---

## 🔧 Components & Roles

| Component         | Type                          | Role        | Description                                                 |
|--------------------|-------------------------------|-------------|-------------------------------------------------------------|
| `component_a`      | `uvm_nonblocking_put_port`    | Producer    | Checks `can_put` and sends via `try_put`                     |
| `component_b`      | `uvm_nonblocking_put_imp`     | Consumer    | Receives transactions and accepts/rejects based on state    |
| `component_a1`     | `uvm_nonblocking_get_port`    | Producer/Consumer | Uses `can_get` / `try_get` for non-blocking pulls       |
| `component_b1`     | `uvm_nonblocking_get_imp`     | Provider    | Supplies transactions via non-blocking get                  |

---


