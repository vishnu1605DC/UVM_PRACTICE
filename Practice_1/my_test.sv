
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=my_env::type_id::create("env",this);
    set_inst_override_by_type("component_a.*",transa::get_type(),transa_b::get_type());
    
    
//     uvm_root::get().set_report_severity_action(UVM_WARNING, UVM_EXIT);
    //uvm_root::get().set_report_severity_action(UVM_ERROR,UVM_FATAL);
//   uvm_root::get().set_report_max_quit_count(1);  // stop after 1 error
  //  uvm_top.set_report_severity_action(UVM_WARNING, UVM_FATAL); 
    
    env.set_report_verbosity_level(UVM_LOW);
    //env.set_report_max_quit_count(1);  // stop after 1 error
    //env.set_timeout(1ms);              // global timeout
    
    uvm_factory::get().print();
    
  endfunction
  
  virtual function void end_of_elaboration();
    print();
  endfunction
endclass
