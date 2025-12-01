
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=my_env::type_id::create("env",this);
    
    env.set_report_verbosity_level(UVM_LOW);
    uvm_factory::get().print();
    
    
  endfunction
  
  virtual function void end_of_elaboration();
    print();
  endfunction
endclass
