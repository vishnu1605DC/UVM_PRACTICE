
class initiator extends uvm_component;
  `uvm_component_utils(initiator)
  
  uvm_tlm_nb_initiator_socket#(initiator,transa) init_socket;
  uvm_tlm_time delay;
  uvm_tlm_phase_e phase;
  uvm_tlm_sync_e sync;
  transa pkt;
  int count;
  
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    init_socket=new("init_socket", this);
    delay=new();
  endfunction
  
  function uvm_tlm_sync_e nb_transport_bw(
    transa pkt,
    ref uvm_tlm_phase_e phase,
    input uvm_tlm_time delay);
    `uvm_info("INIT BW",$sformatf("------------- Received values -----------\n phase = %s, address = %h , data = %d, delay = %0t",phase.name(),pkt.addr,pkt.data,delay),UVM_MEDIUM)
              case(phase)
                UVM_TLM_BEGIN_RSP: begin
                  // do something
                  `uvm_info("INIT BW", "BEGIN_RESP received", UVM_MEDIUM)
                  
                  //move to next phase
                  phase=UVM_TLM_END_RSP;
                  return UVM_TLM_COMPLETED;
                end
                
                UVM_TLM_END_RSP: begin
                  //again do something or just print
                  `uvm_info("INIT BW", "End response received", UVM_MEDIUM)
                  return UVM_TLM_COMPLETED;
                end
                
                default: begin
                  `uvm_info("INIT BW","UNIDENTIFIED phase", UVM_MEDIUM)
                  return UVM_TLM_COMPLETED;
                end
              endcase
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    repeat(count) begin
      pkt=transa::type_id::create("pkt",this);
      assert(pkt.randomize());
      phase=UVM_TLM_BEGIN_REQ;
      delay=5ns;
      `uvm_info("INIT RUN PHASE","Sending req to target",UVM_MEDIUM)
       pkt.print();
      
      `uvm_info("INIT RUN PHASE",$sformatf("got this in return \n %s",sync.name()),UVM_MEDIUM)
    end
      
    endtask
endclass
      
      
      
      
      
      
      
      
  
    
