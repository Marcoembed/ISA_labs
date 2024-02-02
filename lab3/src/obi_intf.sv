interface obi (input CLK);
    logic EN;
    logic proc_req;
    logic mem_rdy;
    logic valid;
    logic we;
    logic [31:0] dataBus_in;
    logic [31:0] dataBus_out;
    logic [31:0] addressBus;

    modport PtoM (
        input EN, mem_rdy, valid, dataBus_out,
        output proc_req, we, dataBus_in, addressBus
    );

    modport MtoP (
        input proc_req, we, dataBus_in, addressBus,
        output mem_rdy, valid, dataBus_out
    );

endinterface //obi (input CLK)