 # 🚀 UVM Practice Project — Comprehensive Testbench

Welcome to my UVM (Universal Verification Methodology) practice repository!  
This project is a hands-on implementation that covers most of the core concepts used in a professional UVM testbench 🧠✨

## 🧾 Overview

This repo contains a fully functional UVM environment that demonstrates:

- 🧱 **Transaction-Level Modeling (TLM):** Blocking & Non-Blocking Put
- 🧰 **Factory Overrides:** Both Type & Instance
- ⚙️ **UVM Config DB usage:** Flexible parameter passing
- 🕵️ **Object-Oriented Testbench Architecture**
- 🧭 **Reporting Mechanism:** Verbosity levels, severity & actions
- 🧠 **UVM Field Utility Macros:** Automation of standard methods
- 🧪 **Complete UVM Test Environment**

## 🧱 Project Structure

```
uvm-practice/
├── obj_class.sv          # 🧾 Transaction class (with field macros)
├── component_a.sv        # 🚀 TLM initiator (sender)
├── component_b.sv        # 🛡️ TLM receiver (responder)
├── env.sv                # 🌿 UVM environment connecting components
├── test.sv               # 🧪 Test class with factory override & config db
├── top_tb.sv             # 🏁 Top-level testbench
├── Makefile / run.do     # 🧰 Simulation script 
└── README.md             # 📖 You're here!
```

## 🧪 Implemented Concepts (Highlights)

### 🧾 1. Object Class

- Defined a transaction class using `uvm_object`.
- Added fields using:
  ```systemverilog
  `uvm_object_utils_begin()
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(data, UVM_ALL_ON)
  `uvm_object_utils_end
  ```
- Used for TLM data transfer.

### 🚀 2. UVM TLM – Blocking & Nonblocking

- **Blocking put (`put()`)**: Sender waits until receiver accepts the transaction.
- **Nonblocking put (`try_put()`, `can_put()`)**: Sender attempts and retries if not ready.
- Demonstrates real hardware-style handshaking 🧠

### 🧭 3. Reporting Mechanism

- Controlled verbosity using `+UVM_VERBOSITY`.
- Used `uvm_info`, `uvm_warning`, `uvm_error`, and `uvm_fatal`.
- Explored `set_report_severity_action()` to downgrade or redirect messages.

### 🧰 4. Factory Override

- Implemented:
  - ✅ Type Override
  - ✅ Instance Override
- Dynamically replace components/objects at runtime:
  ```systemverilog
  factory.set_type_override_by_type(typeA::get_type(), typeB::get_type());
  ```

### ⚙️ 5. UVM Config DB

- Used to pass configuration parameters cleanly:
  ```systemverilog
  uvm_config_db#(int)::set(this, "*", "num_tx", 5);
  ```
- Promotes decoupled and reusable component design.

### 🧠 6. Field Utility Macros

- Reduced boilerplate using `uvm_field_*` macros.
- Automated `do_copy`, `do_compare`, and `do_print` methods.
- Makes transactions lightweight and clean.

### 🌿 7. Complete UVM Testbench Architecture

- ✅ Transaction class
- ✅ Initiator (Component A)
- ✅ Receiver (Component B)
- ✅ Environment (`env`)
- ✅ Test class with factory override
- ✅ Top-level TB file

> 📌 This structure reflects real-world UVM project flow — making it ideal for both practice and interview prep 💼  
> ✅ Works with QuestaSim / ModelSim (UVM precompiled).

## 🌟 Why This Project is Special

- 🧠 Covers multiple core UVM features in one place.
- 📚 Clean & modular code structure.
- 🧪 Great for interview preparation and concept revision.
- 💡 Easily extendable to sequences, drivers, monitors, and scoreboards.

## 📬 Future Enhancements (Coming Soon 🚧)

- ✅ Add sequence & sequencer
- 🧪 Add scoreboard for functional checking
- 📊 Integrate coverage collection
- 🔄 Add virtual interfaces and config flow

---

**Feel free to fork or star if you find this useful! Contributions and suggestions are welcome.**
