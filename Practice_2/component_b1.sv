class component_b1 extends uvm_component;
  `uvm_component_utils(component_b1)
  uvm_nonblocking_get_port#(transa) get_port;
  transa pkt;
  int count;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    get_port=new("get_port",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    count=0;
    
    phase.raise_objection(this);
    repeat(6) begin
      
  do begin
    if(get_port.try_get(pkt)) begin 
      `uvm_info("COMP_B","Component A blessed me with a packet",UVM_LOW)                  pkt.print();
      $display("------------loop count---------%d",count);
      count++;
    end
    else begin 
      #5 `uvm_info("COMP_B","Waiting for component A to send packet",UVM_LOW) 
    end 
  end while(!get_port.can_get());
end
   phase.drop_objection(this);
  endtask
endclass
      
