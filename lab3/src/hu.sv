/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Hazard Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module hu import riscv_pkg::*;
( 
    // Control input signals
    input logic branch_cond_in,
    input logic instr_mem_busy_in, 
    input logic data_mem_busy_in, 
    input MEM_ctrl MEMctrl_in,

    // Data input signals
    input logic [4:0] EXdata_RD_in,
    input logic [4:0] DECdata_RS1_in, 
    input logic [4:0] DECdata_RS2_in, 
    
    // Control output signals
    output logic STALL,
    output logic FLUSH_dec,
    output logic FLUSH_exe

);

always_comb begin : weili

    // default hu output
    STALL = 0;
    FLUSH_dec = 0;
    FLUSH_exe = 0;

    // branch condition
    if (branch_cond_in) begin
        FLUSH_dec = 1;
    end

    // load-use data hazard
    if (EXdata_RD_in == DECdata_RS1_in || EXdata_RD_in == DECdata_RS2_in) begin
        FLUSH_exe = 1;
    end

    // instruction memory not ready
    if (instr_mem_busy_in) begin
        STALL = 1;
    end

    // data memory not ready
    if (data_mem_busy_in) begin
        STALL = 1;
    end
  
end
  
endmodule


//ld r1, r2, imm -- execute
//nop
//add r3, r1, r5 -- decode
//jmp r7, imm -- fetch
//
//fet dec exe mem
//add ld  --  --
//jmp add ld  --   load-use
//jmp add rst ld
//add jmp add ld 
//sub nop jmp add
//    