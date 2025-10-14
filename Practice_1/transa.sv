class transa extends uvm_object;
   randc int addr;
  randc int data;
  `uvm_object_utils_begin(transa)
    `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(data, UVM_ALL_ON)
    `uvm_object_utils_end
    
    
    /* UVM_ALL_ON is a flag mask that enables: UVM_COMPARE → used in compare()  
              UVM_PRINT → used in print() 
              UVM_COPY → used in copy()
		      UVM_PACK/UVM_UNPACK → used in pack()/unpack()
              UVM_RECORD → used in transaction recording */
  
 
  constraint c_addr{ 
    addr inside{ [100:200] };
  }
  
  constraint c_data{
    data inside { [1000:1100],[1800:1900]};
  }
  
  function new(string name="transa");
    super.new(name);
  endfunction
endclass


class transa_b extends transa;
    randc logic [2:0] data;
    randc logic [3:0] addr;
    `uvm_object_utils_begin(transa_b)
      `uvm_field_int(data,UVM_ALL_ON)
      `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_object_utils_end
    constraint c_addr{
	    addr inside { [0:14]};
    }
    constraint c_addr2{
	    addr%2==0;
    }



    function new(string name = "transa_b");
	    super.new(name);
    endfunction
endclass
       


