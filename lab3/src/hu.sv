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
    input logic CLK, RSTn, EN,
    input IF_ctrl BRANCH_cond_in,
    input logic INSTR_mem_busy_in, 
    input logic DATA_mem_busy_in, 
    input MEM_ctrl MEMctrl_in,

    // Data input signals
    input logic [4:0] EX_MEM_RD_in,
    input logic [4:0] DEC_EX_RS1_in, 
    input logic [4:0] DEC_EX_RS2_in, 
    
    // Control output signals
    output logic HZ_instr_req, // request fired
    output logic HZ_data_req, // request fired
    output HAZARD_ctrl PC_REG_out,
    output HAZARD_ctrl IF_DEC_out,
    output HAZARD_ctrl DEC_EX_out,
    output HAZARD_ctrl EX_MEM_out,
    output HAZARD_ctrl MEM_WB_out

);

typedef enum logic[1:0] {issue_req, data_busy, instr_busy, idle} state;
state current_state, next_state;

always_ff @(posedge CLK) begin
    if (!RSTn) begin
        current_state <= issue_req;
    end
    else begin
        current_state <= next_state;
    end
end

always_comb begin : hu_fsm_control
    case(current_state)
        issue_req: begin
            if(!(INSTR_mem_busy_in || DATA_mem_busy_in)) begin
                next_state = issue_req;
            end
            else if (INSTR_mem_busy_in && DATA_mem_busy_in) begin
                next_state = idle;
            end
            else if (INSTR_mem_busy_in) begin
                next_state = instr_busy;
            end
            else if (DATA_mem_busy_in) begin
                next_state = data_busy;
            end

        end
        data_busy: begin
            if (DATA_mem_busy_in) begin
                next_state = data_busy;
            end
            else begin
                next_state = issue_req;
            end
        end
        instr_busy: begin
            if (INSTR_mem_busy_in) begin
                next_state = instr_busy;
            end
            else begin
                next_state = issue_req;
            end
        end
        idle: begin
            if(!(INSTR_mem_busy_in || DATA_mem_busy_in)) begin
                next_state = issue_req;
            end
            else if (INSTR_mem_busy_in) begin
                next_state = instr_busy;
            end
            else if (DATA_mem_busy_in) begin
                next_state = data_busy;
            end
            else begin
                next_state = idle;
            end
        end
    endcase
end

always_comb begin : hu_data_control

    // default hu output
    PC_REG_out = ENABLE;
    IF_DEC_out = ENABLE;
    DEC_EX_out = ENABLE;
    EX_MEM_out = ENABLE;
    MEM_WB_out = ENABLE;
    HZ_data_req = '1;
    HZ_instr_req = '1;

    case(current_state)
        issue_req: begin
            if(INSTR_mem_busy_in) begin

                PC_REG_out = STALL;
                IF_DEC_out = STALL;
                DEC_EX_out = STALL;
                EX_MEM_out = STALL;
                MEM_WB_out = STALL;

            end else if (BRANCH_cond_in == JUMP) begin
                PC_REG_out = STALL;
                IF_DEC_out = FLUSH;  // <-- branch delay slot (NOP insertion)
            end

            // load-use data hazard
            if (MEMctrl_in.mem_en == 1 && MEMctrl_in.wr == READ) begin // load operation
                if (EX_MEM_RD_in == DEC_EX_RS1_in || EX_MEM_RD_in == DEC_EX_RS2_in) begin
                    PC_REG_out = STALL;
                    IF_DEC_out = STALL;
                    DEC_EX_out = FLUSH;
                end
            end

        end
        instr_busy: begin
            if(INSTR_mem_busy_in) begin
                HZ_data_req = '0;
                HZ_instr_req = '0;
                PC_REG_out = STALL;
                IF_DEC_out = STALL;
                DEC_EX_out = STALL;
                EX_MEM_out = STALL;
                MEM_WB_out = STALL;
            end else if (BRANCH_cond_in == JUMP) begin
                PC_REG_out = STALL;
                IF_DEC_out = FLUSH;
            end


        end
        data_busy: begin
            if (DATA_mem_busy_in) begin
                HZ_data_req = '0;
                HZ_instr_req = '0;
                PC_REG_out = STALL;
                IF_DEC_out = STALL;
                DEC_EX_out = STALL;
                EX_MEM_out = STALL;
                MEM_WB_out = STALL;
            end
        end
        idle: begin
            if(INSTR_mem_busy_in || DATA_mem_busy_in) begin
                HZ_data_req = '0;
                HZ_instr_req = '0;
                PC_REG_out = STALL;
                IF_DEC_out = STALL;
                DEC_EX_out = STALL;
                EX_MEM_out = STALL;
                MEM_WB_out = STALL;
            end
        end
    endcase
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