
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=my_env::type_id::create("env",this);
    
    
    set_type_override_by_type(transa::get_type(),transa_b::get_type());
  
    
    uvm_factory::get().print();   
  endfunction
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
endclass
