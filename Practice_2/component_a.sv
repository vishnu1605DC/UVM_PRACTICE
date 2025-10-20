class component_a extends uvm_component;
 `uvm_component_utils(component_a)
  uvm_nonblocking_put_port#(transa) port;
  int num;
  int timeout, count;
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    port=new("port",this);
    if(!uvm_config_db#(int)::get(this," ","timeout",timeout)) begin
      `uvm_fatal("CFG DB","No timeout set using config db")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    
    repeat(num) begin
    transa pkt = transa::type_id::create("pkt",this);
      assert(pkt.randomize());
      
      
      /*while(port.can_put()) begin
      do begin
        port.try_put(pkt) 
        `uvm_info("PKT_TRANSFER","Packet sent to component B from A",UVM_MEDIUM)
      pkt.print();
      end
      while(!port.try_put(pkt));

    end*/
      
 
        if(!port.can_put())begin
          count=0;
          while(!port.try_put(pkt)) begin
              `uvm_info("RX_TX", "WAITING TO SEND PKT", UVM_MEDIUM)
  #1;
 
            count=count+1;
            if(count>=timeout) begin
              `uvm_fatal("RX_TX", "MAX Timeout reached")
            end        
          end
        end
          else if(port.can_put()) begin
            port.try_put(pkt);
            `uvm_info("PKT_TRANSFER", "Packet sent to component B from A", UVM_MEDIUM)
  //pkt.print();
 
          end
    end
    phase.drop_objection(this);
  endtask
endclass
      
        
    
    
    
    
    
    
    
