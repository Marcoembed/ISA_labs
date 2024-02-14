/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Fetch Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

module bu import riscv_pkg::*; 
(
    input DEC_ctrl      DECctrl_in,
    input logic [31:0]  PC_in,
    input logic [31:0]  IMM_in,
    input logic [31:0]  RS1_in,
    input logic [31:0]  RS2_in,
    input t_funct3      funct3,
    
    output IF_ctrl BRANCH_cond_out,
    output logic [31:0] TARGET_out
);

always_comb begin

    BRANCH_cond_out = NOJUMP;
    TARGET_out = PC_in + IMM_in;

    case (DECctrl_in.branch)
        BRANCH: begin
            case (funct3)
                BLE: begin
                    if (signed'(RS1) <= signed'(RS2))
                        BRANCH_cond_out = JUMP;
                end

                BLTU: begin
                    if (unsigned'(RS1) < unsigned'(RS2))
                        BRANCH_cond_out = JUMP;

                end
                    
                default: begin
                    BRANCH_cond_out = NOJUMP;
                end    
                
            endcase
        end

        JMP: begin
            BRANCH_cond_out = JUMP;
        end

        NOBRANCH: begin
            BRANCH_cond_out = NOJUMP;
        end

        default: begin
            BRANCH_cond_out = NOJUMP;
        end
    endcase
end
    
endmodule