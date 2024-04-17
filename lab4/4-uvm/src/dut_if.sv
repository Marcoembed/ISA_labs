interface dut_if(input clk, rst);
    logic [15:0] A, B, C;
    operation_e op;
    logic [21:0] data;
    logic valid, ready;
    
    modport port_in (input clk, rst, A, B, C, op, valid, output ready);
    modport port_out (input clk, rst, output valid, data, ready);
endinterface

