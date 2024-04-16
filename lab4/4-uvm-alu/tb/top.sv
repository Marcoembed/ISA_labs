import fpnew_pkg::*;
import dut_pkg::*;
import uvm_pkg::*;
import cf_math_pkg::*;
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

// `include "../tb/common/packet_in.sv"
// `include "../tb/common/packet_out.sv"
// `include "../tb/common/sequence_in.sv"
// `include "../tb/common/sequencer.sv"
// `include "../tb/common/driver.sv"
// `include "../tb/common/driver_out.sv"
// `include "../tb/common/monitor.sv"
// `include "../tb/common/monitor_out.sv"
// `include "../tb/common/agent.sv"
// `include "../tb/common/agent_out.sv"
// `include "../tb/common/refmod.sv"
// `include "../tb/common/comparator.sv"
// `include "../tb/common/env.sv"
// `include "../tb/common/simple_test.sv"


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
