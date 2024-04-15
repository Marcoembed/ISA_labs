module DUT(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);

`ifdef ADD
    adder adder_under_test(.A(in_inter.A),.B(in_inter.B),.OUT(out_inter.data));
	fsm_add FSM(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);
`endif

`ifdef MBE
    multiplier multiplier_under_test(.A(in_inter.A[11:0]),.B(in_inter.B[11:0]),.OUT(out_inter.data));
	fsm_mbe FSM(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);
`endif

`ifdef FPM
    fpnew_rop fpu_under_test(.A(in_inter.A),.B(in_inter.B),.OUT(out_inter.data));
	fsm_fpm FSM(dut_if.port_in in_inter, dut_if.port_out out_inter, output enum logic [1:0] {INITIAL,WAIT,SEND} state);
`endif



endmodule: DUT
