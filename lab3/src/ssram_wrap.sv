module ssram_wrap import riscv_pkg::*;
( 
    input logic CLK_in,
    input logic RSTn_in,

    // SSRAM signals
    output logic csb,
    output logic web,
    output logic [9:0] addr,
    input logic [31:0] dout,
    output logic [31:0] din,

    // processor signals
    obi_intf.to_proc obi_intf_in
);

always_comb begin

    csb = !obi_intf_in.proc_req;
    web = !obi_intf_in.we;
    addr = obi_intf_in.addr[9:0];
    din = obi_intf_in.wdata;

    obi_intf_in.mem_rdy = '1;
    obi_intf_in.rdata = dout;
end


always_ff @(posedge CLK_in) begin
    if (!RSTn_in) begin
        obi_intf_in.valid  <= '0;
    end
    else begin
        obi_intf_in.valid <= obi_intf_in.proc_req;
    end
end

endmodule