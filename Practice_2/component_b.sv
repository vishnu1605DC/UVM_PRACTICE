class component_b extends uvm_component;
  `uvm_component_utils(component_b)
  uvm_nonblocking_put_imp#(transa, component_b) tlm_imp;
  bit ready;
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tlm_imp=new("tlm_imp",this);
    ready=1;
  endfunction
  
  virtual function bit try_put(transa pakt);
    if(ready) begin
      `uvm_info("PKT_TRANSFER","Packet received at component_B",UVM_LOW)
      pakt.print();
      
      ready =0;
      fork  // here fork join is used because delay cannot be used inside a                 function. To start a parallel background process with delay and               to continue executing the function statements without using                   delay directly, fork join_none is used
        
        
        #2 ready=1; //toggle ready after 10 time units
      join_none
      return 1; //pkt received successfully
    end
    else begin
      `uvm_info("CMP_RDY","Component_B not ready to receive the pkt",UVM_LOW)
      return 0; //pkt not received
    end
  endfunction
  
 virtual function bit can_put();
    return ready;
  endfunction
endclass
      
