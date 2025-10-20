class component_a1 extends uvm_component;
  `uvm_component_utils(component_a1)
  uvm_nonblocking_get_imp#(transa,component_a1) get_imp;
  bit ready;
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
    
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      get_imp=new("get_imp",this);
    endfunction
    
    virtual function bit can_get();
      std::randomize(ready) with {ready dist {0:/80,1:/20};};
      return ready;
    endfunction
      
    
    virtual function bit try_get(output transa pkt);
      pkt=transa::type_id::create("pkt",this);
      if(this.ready) begin
        assert(pkt.randomize());
        `uvm_info("COMP_A","PKT PROVIDED TO COMPB",UVM_LOW)
        return 1;
      end
      else begin
        `uvm_info("COMP_A","COMP_A busy try again later",UVM_LOW)
        return 0;
      end
    endfunction
endclass
        
      
      
