// initiator -> cpu
// target -> memory

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "transa.sv"
`include "initiator.sv"
`include "target.sv"
//`include "component_b.sv"
`include "my_env.sv"
`include "my_test.sv"
module tb_top;
  initial begin
    uvm_config_db#(int)::set(null,"*","repeat",5);
  run_test("my_test");
  end

endmodule
