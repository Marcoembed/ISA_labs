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
    fpnew_rop fpu_under_test(.A(in_inter.A),.B(in_inter.B),.OUT(out_inter.data));
	fsm_fpm FSM(.in_inter(in_inter), .out_inter(out_inter), .state(state));
`endif

endmodule: DUT
