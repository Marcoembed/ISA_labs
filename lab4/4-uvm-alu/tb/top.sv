import fpnew_pkg::*;
import dut_pkg::*;
import uvm_pkg::*;
import cf_math_pkg::*;

`define N_CYCLES 1000

`include "uvm_macros.svh"
`include "../src/dut_if.sv"
`include "../src/DUT.sv"
// ADDER
`ifdef ADD
	`include "../tb/add/list.sv"
`endif

// BOOTH MULTIPLIER
`ifdef MBE
	`include "../tb/mbe/list.sv"
`endif

// FPU MULTIPLIER
`ifdef FPM
	`include "../tb/fpm/list.sv"
`endif


//Top
module top;
  logic clk;
  logic rst;
  
  initial begin
    clk = 0;
    rst = 1;
    #22 rst = 0;
    
  end
  
  always #5 clk = !clk;
  
  state_t state;
  
  dut_if in(clk, rst);
  dut_if out(clk, rst);
  
  DUT sum(in, out, state);

  initial begin
    `ifdef INCA
      $recordvars();
    `endif
    `ifdef VCS
      $vcdpluson;
    `endif
    `ifdef QUESTA
      $wlfdumpvars();
      set_config_int("*", "recording_detail", 1);
    `endif
    
    uvm_config_db#(input_vif)::set(uvm_root::get(), "*.env_h.mst.*", "vif", in);
    uvm_config_db#(output_vif)::set(uvm_root::get(), "*.env_h.slv.*",  "vif", out);
    
    run_test("simple_test");
  end
endmodule
