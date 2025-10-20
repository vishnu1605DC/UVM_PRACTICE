class transa extends uvm_object;
   rand bit[7:0] addr;
  rand bit[7:0] data;

  `uvm_object_utils_begin(transa)
  	`uvm_field_int(addr, UVM_ALL_ON)
  	`uvm_field_int(data, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "Packet");
    super.new(name);
  endfunction
endclass
  
class transa_b extends transa;
  rand bit[63:0] addr2;
  rand bit[63:0] data2;

  `uvm_object_utils_begin(transa_b)
  `uvm_field_int(addr2, UVM_ALL_ON)
  `uvm_field_int(data2, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "Pkt");
    super.new(name);
  endfunction
endclass
