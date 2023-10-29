#!/usr/local/bin/tclsh

################################################################################
##
##       This confidential and proprietary software may be used only
##     as authorized by a licensing agreement from Synopsys Inc.
##     In the event of publication, the following notice is applicable:
##
##                    (C) COPYRIGHT 2005 - 2021 SYNOPSYS INC.
##                           ALL RIGHTS RESERVED
##
##       The entire notice above must be reproduced on all authorized
##     copies.
##
## AUTHOR:    Frederic Neuveux,  January 3, 2005
##
## VERSION:   TCL/HDL file for LBIST controller in Verilog
##
## DFT IP ID: c48fb5da
## DFT_release: S-2021.06-DWBB_202106.4
##
################################################################################

#   set          autodbist 0;
#   set          reseed 0;
#   set          diag_output 1;
#   set          pipeline_se 0;
#   set          invert_prpg_clk 0;
#   set          clock_misr_during_capture 1;
#   set          pattern_ctr_width 1;
#   set          cycle_ctr_width 1;
#   set          loadable_shift_ctr 0;
#   set          sh_width   5;
#   set          sh_count_to 22;
#   set	     width      11;
#   set	     count_to   2047;


set   d_width         7
set   d_count_to      127
puts "
//------------------------------------------------------------------"
puts "//   LogicBIST Generated hdl"
puts "// 
//   (C) COPYRIGHT 2001 - 2002, SYNOPSYS, INC.   -
//              ALL RIGHTS RESERVED              -
//
//------------------------------------------------------------------"


puts "module LBIST_CONTROLLER(bist_clk, bist_reset, bist_mode, auto_mode,
                        bist_run, bist_diag, fast_clock_enable,
			diag_data_valid, lfsr_se, reuse_seed, top_se,
			core_se, core_se_i, bist_bypass, bist_se, bist_si,
			pattern_ctr_data, cycle_ctr_data, bist_done, 
			bist_so, reuse_seed_gated, prpg_clk, misr_clk,
		        misr_scb);

input	  bist_clk, bist_reset, bist_mode, auto_mode;
input     bist_run;
input     bist_diag;
output    fast_clock_enable;
output    diag_data_valid;
input	  lfsr_se;
input     reuse_seed;
input	  top_se;
output	  core_se, core_se_i;
input	  bist_bypass;
input     bist_se;
input	  bist_si; 
output    bist_done;
output	  bist_so;
output    reuse_seed_gated;
output    prpg_clk;
output    misr_clk;
output    \[3:0\] misr_scb;"
if { $pattern_ctr_width == 1 } {
puts "input     pattern_ctr_data;"
} else {
puts "input     \[[expr $pattern_ctr_width-1]:0\] pattern_ctr_data;"
}
if { $cycle_ctr_width == 1 } {
puts "input     cycle_ctr_data;"
} else {
puts "input     \[[expr $cycle_ctr_width-1]:0\] cycle_ctr_data;"
}
puts "reg	core_se, core_se_i, core_sen_3;
reg       core_sen_2;
reg      \[3:0\] misr_scb;
reg       cnt_done_la;
reg       fast_clock_enable_l;
reg       first_pat;
wire      core_sen_1;
wire      cnt_done, cnt_done_n;
wire      count;
wire      misr_cmp, misr_scan_d;
wire      clk_enable, clk_enable_auto, clk_enable_auto_diag;
wire      misr_reset;
wire      bist_clk_inv, bist_clk_g1, bist_clk_g2;
wire      bist_clk_g1_inv;
wire      clk_enable_2, clk_enable_3;
wire      bist_reset_n, pat_ctr_enable, bist_done_n;
wire      cycle_ctr_enable;
wire      bist_done_n_la;
wire      pat_ff, cycle_ctr_done_n, cycle_ctr_done_n_la;
wire      misr_scan;
wire      \[3:0\] misr_scb_d;
wire      bist_diag_i;
wire      core_se_cnt_reset_n;
wire      \[[expr $pattern_ctr_width-1]:0\] zero_vec;        
wire      \[[expr $width-1]:0\] zero_vec_shft;
wire      \[[expr $width-1]:0\] shift_count;
wire      \[1:0\]one_vec;
wire      sh_cnt_done_n, sh_cnt_done;
wire      sh_ctr_reset_n, reuse_seed_n, sh_ff;
wire      sh_cnt_enable;"

puts "
  // Flag for first pattern.
  always @( posedge bist_clk_g1 or  posedge bist_reset ) 
    if (bist_reset)
      first_pat = 1'b1;
    else
      first_pat = first_pat & ~cnt_done;
"

puts "
  assign reuse_seed_gated = (~reuse_seed) & core_sen_3;
  assign  bist_diag_i = bist_diag & bist_mode;"

puts "  
  DFT_diag_[expr $d_width]_[expr $d_count_to] 
    U_diag_i(.reset(bist_reset), 
             .bist_clk(bist_clk_g1), 
             .diag(bist_diag_i), .capture(cnt_done), 
             .clk_enable(clk_enable), .misr_scb_d(misr_scb_d),
             .diag_data_valid(diag_data_valid));"

puts "  
  assign   core_se_cnt_reset_n = ~(bist_reset | (lfsr_se & bist_mode));
  assign   cnt_done = ~cnt_done_n;"

puts "  
  DFT_cntr_scnto_[expr $width]_[expr $count_to]
    U_counter_i(.clk(bist_clk),
                .rst_n(core_se_cnt_reset_n), 
                .enable(clk_enable_2),
                .load_n(cnt_done_n),
                .ld_data(zero_vec_shft),
                .tercnt_n(cnt_done_n),
                .count(shift_count));

  always @(shift_count)
  begin
    if (shift_count == [expr $count_to-1] )
      fast_clock_enable_l = 1'b1;
    else fast_clock_enable_l = 1'b0;
  end

  always @(first_pat or lfsr_se or misr_scb_d or bist_diag)
  begin
    if(first_pat | lfsr_se)
      misr_scb = 4'b0000;
    else if(~bist_diag)
      misr_scb = 4'b1111;
    else misr_scb = misr_scb_d; 
  end

  always @(bist_mode or bist_bypass or core_sen_2 or top_se or lfsr_se or bist_diag)
  begin
    if ((~bist_mode) | (bist_bypass) | (lfsr_se & ~bist_diag)) 
    begin
      core_se <= top_se;
      core_se_i <= top_se;
      core_sen_3 <= ~lfsr_se;
    end
    else
    begin 
      core_se <= core_sen_2;
      core_se_i  <= ~core_sen_2;
      core_sen_3 <= ~core_sen_2;
    end
  end

  // latch for delaying scan_enable by half cycle.
  always @(bist_clk_g1_inv or core_sen_1)
  begin
    if (bist_clk_g1_inv)
      core_sen_2 <= core_sen_1;
  end
 
  assign     core_sen_1 = ~cnt_done;"

if { $clock_misr_during_capture } {
    puts "  assign     misr_clk = bist_clk_g1;"
} else {
    puts "  always @(bist_clk_g1_inv or cnt_done)
    if(bist_clk_g1_inv)
      cnt_done_la = cnt_done;
  assign     misr_clk = bist_clk_g1 & (~bist_mode | ~cnt_done_la | lfsr_se);"
}

puts "  assign  fast_clock_enable = fast_clock_enable_l;"


puts "  
  assign bist_clk_g1 = bist_clk;
  assign bist_clk_g1_inv = ~bist_clk_g1;
  assign bist_clk_g2 = bist_clk & (clk_enable | ~bist_diag_i);
  assign clk_enable_2 = ~bist_diag_i | clk_enable;"

if { $invert_prpg_clk } {
    puts "  assign prpg_clk = ~bist_clk_g2;"
} else {
    puts "  assign prpg_clk = bist_clk_g2;"
}

puts "  assign bist_clk_inv = ~bist_clk;
  assign   zero_vec = {[expr $width]{1'b0}};
  assign   zero_vec_shft = {[expr $width]{1'b0}};
  assign   one_vec =  {[expr $width]{1'b1}};
  assign   bist_reset_n = ~bist_reset;

endmodule"

puts "
//------------------------------------------------------------------------------
// Diagnostic control logic  block definition
//------------------------------------------------------------------------------
module DFT_diag_[expr $d_width]_[expr $d_count_to](reset, bist_clk, diag, capture, 
                      clk_enable, misr_scb_d, diag_data_valid);"
set   reset_state     "4'b0000"
set   first_capture   "4'b0001"
set   first_shift     "4'b0011"
set   second_capture  "4'b0010"
set   second_shift    "4'b0110"
set   third_capture   "4'b0111"
set   third_shift     "4'b0101"
set   fourth_capture  "4'b0100"
set   fourth_shift    "4'b1100"
set   shift_channel   "4'b1110"
set   sys_capture     "4'b1111"

puts "input reset, bist_clk, capture, diag;
output clk_enable;
output \[3:0\] misr_scb_d;
output diag_data_valid;
reg   clk_enable;
reg  \[3:0\]  misr_scb_d;
reg  diag_data_valid;
reg   cnt_reset, cnt_reset_i, count;
wire  cnt_done, capture, cnt_load;
reg  clk_enable_i;
reg  \[3:0\] curr_state;
reg  \[3:0\] next_state;



  DFT_ctr_[expr $d_width]_[expr $d_count_to] U_counter_i(
		.clk(bist_clk),
		.rst(cnt_reset_i),
		.done(cnt_done) );

  always @(diag or reset or cnt_reset)
  begin
    if (reset)
      cnt_reset_i = 1'b1;
    else if (~diag)
      cnt_reset_i = 1'b0;
    else
      cnt_reset_i = cnt_reset;
  end  
  

  always @(posedge bist_clk or posedge reset)
  begin
    if (reset)
      begin
      curr_state <= $reset_state;
      end
    else
      curr_state <= next_state;
  end 

 always @(curr_state or cnt_done or capture)
  begin
    // Initialize outputs to default state.
    next_state = $reset_state;
    clk_enable_i = 1'b0;
    misr_scb_d = 4'b0001;
    cnt_reset  = 1'b0;
    count      = 1'b0;
    diag_data_valid = 1'b0;

    case (curr_state)
    $reset_state: // reset_state
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0001;
      cnt_reset = 1'b0;
      count = 1'b0;
      diag_data_valid = 1'b0;
      next_state = $first_capture;
    end

    $first_capture: // first_capture
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b1;
      count = 1'b0;
      diag_data_valid = 1'b1;
      next_state = $first_shift;
    end
    
    $first_shift:  // first_shift
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b0;
      count = 1'b1;
      diag_data_valid = 1'b1;
      if (cnt_done)
        begin
        next_state = $second_capture;
        misr_scb_d = 4'b0010;
        diag_data_valid = 1'b0;
        end
      else 
        next_state = $first_shift; 
    end

    $second_capture:  // second_capture
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b1;
      count = 1'b0;
      diag_data_valid = 1'b1;
      next_state = $second_shift;
    end
    
    $second_shift:  // second_shift
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b0;
      count = 1'b1;
      diag_data_valid = 1'b1;
      if (cnt_done)
        begin
        next_state = $third_capture;
        misr_scb_d = 4'b0100;
        diag_data_valid = 1'b0;
        end
      else 
        next_state = $second_shift; 
    end

    $third_capture:  // third_capture
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b1;
      count = 1'b0;
      diag_data_valid = 1'b1;
      next_state = $third_shift;
    end
    
    $third_shift:  // third_shift
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b0;
      count = 1'b1;
      diag_data_valid = 1'b1;
      if (cnt_done)
        begin
        next_state = $fourth_capture;
        misr_scb_d = 4'b1000;
        diag_data_valid = 1'b0;
        end
      else 
        next_state = $third_shift; 
    end

    $fourth_capture:  // fourth capture
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b1;
      count = 1'b0;
      diag_data_valid = 1'b1;
      next_state = $fourth_shift;
    end
    
    $fourth_shift:  // fourth shift
    begin
      misr_scb_d = 4'b0000;
      cnt_reset = 1'b0;
      count = 1'b1;
      diag_data_valid = 1'b1;
      if (cnt_done)
        begin
        clk_enable_i = 1'b1;
        next_state = $shift_channel;
        diag_data_valid = 1'b0;
        end
      else 
        begin
        clk_enable_i = 1'b0;
        next_state = $fourth_shift;
        end
    end

    $shift_channel:  // shift_channel
    begin
      cnt_reset  = 1'b0;
      count      = 1'b0;
      diag_data_valid = 1'b0;
      if (capture == 1'b1)
        begin
        clk_enable_i = 1'b1;
        misr_scb_d = 4'b0000;
        next_state = $sys_capture;
        end
      else 
        begin
        clk_enable_i = 1'b0;
        misr_scb_d = 4'b0001;
        next_state = $first_capture;
        end
    end

    $sys_capture:  // sys_capture
    begin
      clk_enable_i = 1'b0;
      misr_scb_d = 4'b0001;
      cnt_reset  = 1'b0;
      count      = 1'b0;
      diag_data_valid = 1'b0;
      next_state = $first_capture;
    end
    endcase
  end

  //synopsys async_set_reset \"reset\"
  always @(bist_clk or reset or clk_enable_i)
  begin
    if (reset)
      clk_enable = 1'b0;
    else if (~bist_clk)
      clk_enable = clk_enable_i;
  end

endmodule"

puts "
module DFT_cntr_scnto_[expr $width]_[expr $count_to](clk,rst_n,enable,load_n,ld_data,tercnt_n,count);"
set cntr_width $width;
set count_to $count_to;

puts "input clk;
input rst_n;
input enable;
input load_n;
input \[[expr $cntr_width-1]:0\] ld_data;
output tercnt_n ;
output \[[expr $cntr_width-1]:0\] count;
wire \[[expr $cntr_width-1]:0\] count_in, tercnt_cmp_bus,next_count,count_inc;
reg \[[expr $cntr_width-1]:0\] count_int;
reg tercnt_n_reg;
wire logic_high, tercnt_d, tc_d_n_gated;"

for {set i 0} {$i<$width} {incr i} {
    set p [expr pow(2,$i)]
    set p [expr int($p) ]
    set p [expr $count_to/$p]
    set p [expr  int($p)]
    set p [expr $p % 2]
    if { $p==0} {
	puts "  assign tercnt_cmp_bus\[[expr $i]\] = ~next_count\[[expr $i]\];"
    } else {
	puts "  assign tercnt_cmp_bus\[[expr $i]\] = next_count\[[expr $i]\];"
    }
    
}
puts "  //U1_3 component
  always @ (posedge clk or negedge rst_n) begin 
    
    if (rst_n == 1'b0) begin

      count_int <= {[expr $cntr_width]{1'b0}};
    
    end else begin

      count_int <= next_count;
    
    end // if-else

  end //

  // U2_1 component
  assign next_count = (load_n==1'b0)? ld_data : count_inc;
  always @ (posedge clk or negedge rst_n) begin 
    
    if (rst_n == 1'b0) begin

      tercnt_n_reg <= 1'b0;
    
    end else begin

     tercnt_n_reg <= tercnt_d;
    
    end // if-else

  end 
  assign tercnt_d = &tercnt_cmp_bus; // U3 component
  assign count_inc = count_int + enable;  //U4 component
  assign count =count_int;
  assign tercnt_n = ~ tercnt_n_reg;

endmodule"

puts "
module DFT_ctr_[expr $d_width]_[expr $d_count_to](clk,
  	             rst,
	             done,
                     pre_done);"
set cntr_width $d_width;
set count_to $d_count_to;
puts "input clk;
input rst;
output done, pre_done;

wire \[[expr $cntr_width-1]:0\] next_count;
reg  \[[expr $cntr_width-1]:0\] count;
wire done_int;

  assign next_count = (done_int==1'b1)? {[expr $cntr_width]{1'b0}} : count+1;

  always @ (posedge clk or posedge rst) begin : P_clk_registers
    
    if (rst == 1'b1) begin

      count <= {[expr $cntr_width]{1'b0}};
    
    end else begin

      count <= next_count;
    
    end // if-else

  end // always P_clk_registers

  assign done_int = (count==[expr $count_to])? 1'b1 : 1'b0;
  assign pre_done = (next_count==[expr $count_to])? 1'b1 : 1'b0;

  assign done = done_int;

endmodule"
