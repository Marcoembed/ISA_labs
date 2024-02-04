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
    input logic EN,
    input logic BRANCH_cond_in,
    input logic INSTR_mem_busy_in, 
    input logic DATA_mem_busy_in, 
    input MEM_ctrl MEMctrl_in,

    // Data input signals
    input logic [4:0] EX_MEM_RD_in,
    input logic [4:0] DEC_EX_RS1_in, 
    input logic [4:0] DEC_EX_RS2_in, 
    
    // Control output signals
    output HAZARD_ctrl PC_REG_out,
    output HAZARD_ctrl IF_DEC_out,
    output HAZARD_ctrl DEC_EX_out,
    output HAZARD_ctrl EX_MEM_out,
    output HAZARD_ctrl MEM_WB_out

);

always_comb begin : WEILI 

    // default hu output
    PC_REG_out = ENABLE;
    IF_DEC_out = ENABLE;
    DEC_EX_out = ENABLE;
    EX_MEM_out = ENABLE;
    MEM_WB_out = ENABLE;

    // branch condition
    if (EN) begin
        if (BRANCH_cond_in) begin
            IF_DEC_out = FLUSH;  // <-- branch delay slot (NOP insertion)
        end

        // load-use data hazard
        if (MEMctrl_in.proc_req == REQUEST && MEMctrl_in.we == READ) begin // load operation
            if (EX_MEM_RD_in == DEC_EX_RS1_in || EX_MEM_RD_in == DEC_EX_RS2_in) begin
                PC_REG_out = STALL;
                IF_DEC_out = STALL;
                DEC_EX_out = FLUSH;
            end
        end

        // instruction memory not ready
        // or
        // data memory not ready
        if (INSTR_mem_busy_in || DATA_mem_busy_in) begin
            PC_REG_out = STALL;
            IF_DEC_out = STALL;
            DEC_EX_out = STALL;
            EX_MEM_out = STALL;
            MEM_WB_out = STALL;
        end
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