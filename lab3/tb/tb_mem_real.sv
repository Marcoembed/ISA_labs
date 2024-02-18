`timescale 1 ps / 1 ps

module tb_mem_reals import riscv_pkg::*; ();

    parameter IMEM_LENGTH = 12;
    parameter DMEM_LENGTH = 79;

	obi_intf tb_fetch_intf_core();
	obi_intf tb_lsu_intf_core();
	logic tb_CLK;
	logic tb_EN;
	logic tb_RSTn;


	//DATA MEMORY
	logic tb_data_proc_req;
	logic tb_data_mem_rdy;
	logic tb_data_we;
	logic [31:0] tb_data_addr;
	logic [31:0] tb_data_wdata;
	logic [31:0] tb_data_rdata;
	logic tb_data_valid;

	//INSTRUCTION MEMORY
	logic tb_instr_proc_req;
	logic tb_instr_mem_rdy;
	logic tb_instr_we;
	logic [31:0] tb_instr_addr;
	logic [31:0] tb_instr_wdata;
	logic [31:0] tb_instr_rdata;
	logic tb_instr_valid;

	//CORE signals 


	// parameters
	localparam Ts = 10000;
	localparam tco = 1;
	localparam tpd = 1;
	//localparam cRG_FAST = 0;
	localparam cIS_CODE = 0;
	localparam cIS_DATA = 1;   


    // MEMORY TB signals

    logic data_csb;
    logic data_web;
    logic [9:0] data_addr;
    logic [31:0] data_dout;
    logic [31:0] data_din;
    
    logic instr_csb;
    logic instr_web;
    logic [9:0] instr_addr;
    logic [31:0] instr_dout;
    logic [31:0] instr_din;


    // MUX TB signals

    logic data_clk0;
    logic data_csb0;
    logic data_web0;
    logic [9:0] data_addr0;
    logic [31:0] data_din0;
	

    logic instr_clk0;
    logic instr_csb0;
    logic instr_web0;
    logic [9:0]  instr_addr0;
    logic [31:0] instr_din0;
	
	// Interface unpacking

	always_comb begin
		//INSTR
    	tb_instr_proc_req = logic'(tb_fetch_intf_core.proc_req);
    	tb_instr_we = logic'(tb_fetch_intf_core.we);
    	tb_instr_addr = tb_fetch_intf_core.addr;
    	tb_instr_wdata = tb_fetch_intf_core.wdata;

    	tb_fetch_intf_core.mem_rdy = tb_instr_mem_rdy;
    	tb_fetch_intf_core.rdata = tb_instr_rdata;
    	tb_fetch_intf_core.valid = tb_instr_valid;


		//DATA
    	tb_data_proc_req = logic'(tb_lsu_intf_core.proc_req);
    	tb_data_we = logic'(tb_lsu_intf_core.we);
    	tb_data_addr = tb_lsu_intf_core.addr;
    	tb_data_wdata = tb_lsu_intf_core.wdata;

    	tb_lsu_intf_core.mem_rdy = tb_data_mem_rdy;
    	tb_lsu_intf_core.rdata = tb_data_rdata;
    	tb_lsu_intf_core.valid = tb_data_valid;

	end

    reg [10-1:0] tmp_imem [32-1:0];
    reg [10-1:0] tmp_dmem [32-1:0];
    int imem_itr;
    int dmem_itr;

    initial begin
        $readmemh("../sim/imem.txt", tmp_imem);
        $readmemh("../sim/dmem.txt", tmp_dmem);
    end

   riscv_core core 
   (
		.fetch_intf_core(tb_fetch_intf_core),
		.lsu_intf_core(tb_lsu_intf_core),
		.CLK(tb_CLK),
		.EN(tb_EN),
		.RSTn(tb_RSTn)
   );

	clk_gen #(
		.T(Ts)
   ) CG (
  	 .CLK(tb_CLK),
	 .RSTn()
   );


	ssram_wrap ssram_wrap_data
    (   
        .CLK_in(tb_CLK),
        .RSTn_in(tb_RSTn),

        // SSRAM signals
        .csb(data_csb),
        .web(data_web),
        .addr(data_addr),
        .dout(data_dout),
        .din(data_din),

        // processor signals
        .obi_intf_in(tb_lsu_intf_core)

    );

    	ssram_wrap ssram_wrap_instr
    (   
        .CLK_in(tb_CLK),
        .RSTn_in(tb_RSTn),

        // SSRAM signals
        .csb(instr_csb),
        .web(instr_web),
        .addr(instr_addr),
        .dout(instr_dout),
        .din(instr_din),
        
        // processor signals
        .obi_intf_in(tb_fetch_intf_core)

    );

    mem_test data_mem
    (
        .clk0(tb_CLK),
        .csb0(data_csb0),
        .web0(data_web0),
        .addr0(data_addr0),
        .din0(data_din0),
        .dout0(data_dout)

    );

        mem_test instr_mem
    (
        .clk0(tb_CLK),
        .csb0(instr_csb0),
        .web0(instr_web0),
        .addr0(instr_addr0),
        .din0(instr_din0),
        .dout0(instr_dout)

    );




always_ff @(posedge CLK) begin
    if(!RSTn) begin
    instr_csb0 <= 0;
    instr_web0 <= 0;
    data_csb0 <= 0;
    data_web0 <= 0;

        if(imem_itr < IMEM_LENGTH) begin
            instr_csb0 <= 1;
            instr_web0 <= 1;
        end

        if(dmem_itr < DMEM_LENGTH) begin
            data_csb0 <= 1;
            data_web0 <= 1;
        end

        instr_addr0 <= tmp_imem[imem_itr];
        data_addr0 <= tmp_dmem[dmem_itr];

        imem_itr <= imem_itr + 1;
        dmem_itr <= dmem_itr + 1;

    end else begin
        instr_csb0 <= 0;
        instr_web0 <= 0;
        data_csb0 <= 0;
        data_web0 <= 0;
    end
end
	
endmodule

//TODO mettere il reset
