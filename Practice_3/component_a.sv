
class component_a extends uvm_component;
`uvm_component_utils(component_a)

uvm_blocking_put_port#(transa) tlm_put_port;
int n;
  transa pkt;

  function new(string name, uvm_component parent);
  super.new(name, parent);
endfunction
  
virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  tlm_put_port=new("tlm_put_port",this);
  //set_report_severity_override(UVM_ERROR, UVM_FATAL);
endfunction

virtual task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat(n) begin
 
    pkt = transa::type_id::create("pkt",this);
    assert(pkt.randomize());
    
    `uvm_info("Pkt transfer", "Packet sent from comp A to comp B",UVM_LOW)
    pkt.print();
    tlm_put_port.put(pkt);
    
    `uvm_info("TEST","This is a low verbosity message",UVM_LOW)
    `uvm_info("TEST","This is a high verbosity message",UVM_HIGH)
    `uvm_info("TEST","This is a medium verbosity message",UVM_MEDIUM)
    
    
   // `uvm_error("PKT", "Packet dropped!") //- repeat n runs for n times
    `uvm_error("PKT", "TEST UVM ERROR MESSAGE!") //repeat n runs n times
    //     `uvm_fatal("PKT", "Unrecoverable error!") repeat n runs only once after which it is terminated by uvm_fatal

  end
  phase.drop_objection(this);
endtask
endclass
    
    
    
