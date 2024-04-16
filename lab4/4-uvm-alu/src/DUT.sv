module DUT(dut_if.port_in in_inter, dut_if.port_out out_inter, output state_t state);

`ifdef ADD
    adder adder_under_test(.A(in_inter.A),.B(in_inter.B),.OUT(out_inter.data));
	fsm_add FSM(.in_inter(in_inter), .out_inter(out_inter), .state(state));
`endif

`ifdef MBE
    multiplier multiplier_under_test(.a(in_inter.A[10:0]),.b(in_inter.B[10:0]),.out(out_inter.data));
	fsm_mbe FSM(.in_inter(in_inter), .out_inter(out_inter), .state(state));
`endif

`ifdef FPM
    //fpnew_top fpu_under_test(.A(in_inter.A),.B(in_inter.B),.OUT(out_inter.data[15:0]));
	fpnew_top fpnew_top_u (
		.clk_i(in_inter.clk),
		.rst_ni(!in_inter.clk),
		// Input signals
		.operands_i({in_inter.A[31:0], in_inter.B[31:0], in_inter.C[31:0]}),
		.rnd_mode_i(RNE),
		.op_i(in_inter.op), 
        .op_mod_i      (1'b0),  
        .src_fmt_i     (FP32), 
        .dst_fmt_i     (FP32), 
        .int_fmt_i     (INT32),
        .vectorial_op_i(1'b0),
        .flush_i       (1'b0), 
        .tag_i         (1'b0), 
		// Input Handshake
		.in_valid_i(1'b1),
		.in_ready_o(),
		// Output signals
		.result_o(out_inter.data[15:0]), 
		.status_o(),
		.tag_o(),
		// Output handshake
		.out_valid_o(),
		.out_ready_i(1'b1),
		// Indication of valid data in flight
		.busy_o()
	);
    fsm_fpm FSM(.in_inter(in_inter), .out_inter(out_inter), .state(state));
`endif

endmodule: DUT
