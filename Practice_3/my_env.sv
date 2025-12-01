
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  component_a comp_a;
//  component_b comp_b;
  component_b1 comp_b1;
  uvm_tlm_fifo#(transa) fifo;
  int num;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_a=component_a::type_id::create("comp_a",this);
    comp_b1=component_b1::type_id::create("comp_b1",this);
    fifo=new("fifo",this,2);
    if(!uvm_config_db#(int)::get(this," ","repeat",num)) begin
      `uvm_fatal("Loop","Config db failed to pass value to repeat loop")
    end
    comp_a.n=num;
    
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // comp_a.tlm_put_port.connect(comp_b.tlm_imp);
    comp_a.tlm_put_port.connect(fifo.put_export);
    comp_b1.get_port.connect(fifo.get_export);
  endfunction
  
endclass
