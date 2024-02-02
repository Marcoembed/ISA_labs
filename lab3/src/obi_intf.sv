interface obi_intf import riscv_pkg::*;;
    MEM_ctrl MEM;
    logic mem_rdy;
    logic valid;
    logic [31:0] dataBus_in;
    logic [31:0] dataBus_out;
    logic [31:0] addressBus;

    modport PtoM ( // processor to memory
        input mem_rdy, valid, dataBus_out,
        output MEM, dataBus_in, addressBus
    );

endinterface //obi (input CLK)