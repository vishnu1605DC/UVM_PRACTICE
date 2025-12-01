
class target extends uvm_component;
  `uvm_component_utils(target)
  
  uvm_tlm_nb_target_socket#(target,transa) targ_socket;
  logic [31:0] mem [0:255];
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    targ_socket=new("targ_socket",this);
  endfunction
  
  function uvm_tlm_sync_e nb_transport_fw(
    transa pkt,
    ref uvm_tlm_phase_e phase,
    input uvm_tlm_time delay);
    `uvm_info("TARG FW",
              $sformatf("phase=%s addr=%h data=%d delay=%0t",
                        phase.name(),pkt.addr,pkt.data, delay),
              UVM_MEDIUM)
    
    case(phase)
      UVM_TLM_BEGIN_REQ: begin
        
        `uvm_info("TARG FW","Beginning Request",UVM_MEDIUM)
        if(pkt.write) begin
          mem[pkt.addr]=pkt.data;
          `uvm_info("TARG FW",$sformatf("Successfully written %d at %h",pkt.data,pkt.addr),UVM_MEDIUM)
        end
        else if(!pkt.write) begin
          pkt.data=mem[pkt.addr];
          `uvm_info("TARG FW",$sformatf("Successfully Read %d from %h",pkt.data,pkt.addr),UVM_MEDIUM)
        end
          
        // move to next phase
        phase = UVM_TLM_END_REQ;
        return UVM_TLM_UPDATED;
        end
        
        UVM_TLM_END_REQ: begin
          `uvm_info("TARG FW","END REQ Reached",UVM_MEDIUM)
          
          phase=UVM_TLM_BEGIN_RSP;
          return targ_socket.nb_transport_bw(pkt,phase,delay+10ns);
        end
      
      default: begin
        `uvm_warning("TARG FW", "Unexpected phase")
        return UVM_TLM_ACCEPTED;
      end
    endcase
  endfunction
endclass
    
    
  
  
  
  
