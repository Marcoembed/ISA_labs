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
   input logic[31:0]   RS1_in,
   input logic[31:0]   RS2_in,
   input t_funct3      funct3,
    
    output logic bu_o
);

always_comb begin
    case (DECctrl_in.branch)
        BRANCH: begin
            case (funct3)
                BLE: begin
                    if (signed'(RS1) <= signed'(RS2))
                        bu_o = 1;
                end

                BLTU: begin
                    if (unsigned'(RS1) < unsigned'(RS2))
                        bu_o = 1;

                end
                    
                default: begin
                    bu_o = 0;
                end    
                
            endcase
        end

        JMP: begin
            bu_o = 1:
        end

        NOBRANCH: begin
            bu_o = 0;
        end

        default: begin
            bu_o = 0;
        end
    endcase
end
    
endmodule