class component_b1 extends uvm_component;
  `uvm_component_utils(component_b1)
  transa pkt;
  uvm_blocking_get_port#(transa) get_port;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    get_port=new("get_port",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    repeat(5) begin
      
    pkt=transa::type_id::create("pkt",this);
      assert(pkt.randomize());
      get_port.get(pkt);
      `uvm_info("COMP_B1","Component A blessed me with a packet",UVM_LOW)
      pkt.print();
    end
    phase.drop_objection(this);
  endtask
endclass
    
    
    
  
