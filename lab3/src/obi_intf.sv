interface obi_intf;
    import riscv_pkg::*;

	obi_req proc_req;
    logic mem_rdy;
	rdwr we;
    logic [reg_width-1:0] addr;
    logic [width-1:0] wdata;
    logic [width-1:0] rdata;
    logic valid;


    modport to_mem ( // processor to interface
        output proc_req, we, addr, wdata, // to memory
        input mem_rdy, valid, rdata  // from memory
    );

endinterface