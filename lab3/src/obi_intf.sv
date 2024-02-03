interface obi_intf;
    logic mem_rdy;
    logic valid;
    logic [31:0] addressBus_in;
    logic [31:0] addressBus_out;
    logic [31:0] dataBus_in;

    modport PtoIntf ( // processor to interface
        input mem_rdy, valid, dataBus_in, addressBus_in, // in processor
        output addressBus_out  // from processor
    );

    modport MtoIntf ( // memory to interface
        input addressBus_out, // in memory 
        output mem_rdy, valid, dataBus_in // from memory
    );

endinterface //obi (input CLK)