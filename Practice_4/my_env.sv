
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  initiator init;
  target targ;
  int num;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    init=initiator::type_id::create("init",this);
    targ=target::type_id::create("targ",this);
    if(!uvm_config_db#(int)::get(this," ","repeat",num)) begin
      `uvm_fatal("ENV Build Phase","Config db failed to pass value to repeat loop")
    end
    init.count=num;
    
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    init.init_socket.connect(targ.targ_socket);
  endfunction
  
endclass
  
    
