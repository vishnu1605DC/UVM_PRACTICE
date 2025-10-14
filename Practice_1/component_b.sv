
class component_b extends uvm_component;
  `uvm_component_utils(component_b)
  
  uvm_blocking_put_imp#(transa, component_b) tlm_imp;
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  transa pkt1;
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tlm_imp=new("tlm_imp",this);
    pkt1=transa::type_id::create("pkt1");
  endfunction
  
  virtual task put(transa pkt);
    pkt1.copy(pkt);
    pkt.print(uvm_default_line_printer);
    pkt1.print();
    if(!pkt1.compare(pkt)) begin
      `uvm_error("COMPARE","Packet Differs")
    end
  endtask
endclass
       
  
