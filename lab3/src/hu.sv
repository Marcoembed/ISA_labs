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
    output HAZARD_ctrl PC_reg_out,
    output HAZARD_ctrl IF_DEC_out,
    output HAZARD_ctrl DEC_EX_out,
    output HAZARD_ctrl EX_MEM_out,
    output HAZARD_ctrl MEM_WB_out

);

always_comb begin : weili

    // default hu output
    PC_reg_out = NOP;
    IF_DEC_out = NOP;
    DEC_EX_out = NOP;
    EX_MEM_out = NOP;
    MEM_WB_out = NOP;

    // branch condition
    if (branch_cond_in) begin
        IF_DEC_out = FLUSH;  // <-- branch delay slot (NOP insertion)
    end

    // load-use data hazard
    if (MEMctrl_in.proc_req == REQUEST && MEM.we == READ) begin // load operation
        if (EXdata_RD_in == DECdata_RS1_in || EXdata_RD_in == DECdata_RS2_in) begin
            PC_reg_out = STALL;
            IF_DEC_out = STALL;
            DEC_EX_out = FLUSH;
        end
    end

    // instruction memory not ready
    // or
    // data memory not ready
    if (instr_mem_busy_in || data_mem_busy_in) begin
        PC_reg_out = STALL;
        IF_DEC_out = STALL;
        DEC_EX_out = STALL;
        EX_MEM_out = STALL;
        MEM_WB_out = STALL;
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
//jmp add nop ld
//add jmp add ld 
//sub nop jmp add
//    