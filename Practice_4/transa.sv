class transa extends uvm_object;
  randc logic [7:0]addr;
  randc logic [31:0] data;
   randc bit write;
  `uvm_object_utils_begin(transa)
    `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(data, UVM_ALL_ON)
  `uvm_field_int(write, UVM_ALL_ON)
    `uvm_object_utils_end
    
  function new(string name="transa");
    super.new(name);
  endfunction
endclass
