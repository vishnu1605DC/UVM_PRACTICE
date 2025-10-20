import uvm_pkg::*;
`include "uvm_macros.svh"
`include "transa.sv"
// `include "component_a.sv"
// `include "component_b.sv"
`include "component_a1.sv"
`include "component_b1.sv"
`include "my_env.sv"
`include "my_test.sv"
module tb_top();
  initial begin
    uvm_config_db#(int)::set(null,"*","repeat",5);
    uvm_config_db#(int)::set(null,"*","timeout",100);
    run_test("my_test");
  end
endmodule
