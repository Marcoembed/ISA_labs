interface obi_intf;
    import riscv_pkg::*;

	obi_req proc_req;
    logic mem_rdy;
	rdwr we;
    logic [31:0] addr;
    logic [31:0] wdata;
    logic [31:0] rdata;
    logic valid;



    modport to_mem ( // processor to memory
        output proc_req, we, addr, wdata, // to memory
        input mem_rdy, valid, rdata  // from memory
    );

    modport to_proc ( // memory to processor
        input proc_req, we, addr, wdata, // to memory
        output mem_rdy, valid, rdata  // from memory
    );

endinterface