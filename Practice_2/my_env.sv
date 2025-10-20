
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  component_a1 comp_a;
  component_b1 comp_b;
//   component_a comp_a;
//   component_b comp_b;
  //int num;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   /* comp_a=component_a::type_id::create("comp_a",this);
    comp_b=component_b::type_id::create("comp_b",this);
    if(!uvm_config_db#(int)::get(this," ","repeat",num)) begin
      `uvm_fatal("Loop","Config db failed to pass value to repeat loop")
    end
    comp_a.num=num;
    */
    comp_a=component_a1::type_id::create("comp_a",this);
    comp_b=component_b1::type_id::create("comp_b",this);
    
    
    
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    comp_b.get_port.connect(comp_a.get_imp);
  endfunction
  
endclass
  
    
