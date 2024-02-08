interface obi_intf import riscv_pkg::*;;
	rdwr we;
	obi_req proc_req;
    logic mem_rdy;
    logic valid;
    logic [width-1:0] wdata;
    logic [width-1:0] rdata;
    logic [reg_width-1:0] addr;

    modport PtoIntf ( // processor to interface
        input mem_rdy, valid, dataBus_in, addressBus_in, // in processor
        output addressBus_out  // from processor
    );

endinterface //obi (input CLK)