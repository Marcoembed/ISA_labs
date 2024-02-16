/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Forwarding Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/


module fu import riscv_pkg::*;
( 
    input   FU_data FU_in,
    output  FU_mux  FU_out
);

always_comb begin
// Only if forwarding instruction will write a register
// Only if Rd for that instruction is not R0
FU_out.FRWD_A = NOFORWARD;
FU_out.FRWD_B = NOFORWARD; 


    if (FU_in.Mem_RegWrite == WR|| FU_in.WB_RegWrite == WR) begin
        if (FU_in.Mem_rd != 0 || FU_in.WB_rd != 0) begin
            // FORWARD A 
            if (FU_in.EX_rs1 == FU_in.Mem_rd) begin
                FU_out.FRWD_A = FORWARD_alu;
                
            end else if (FU_in.EX_rs1 == FU_in.WB_rd) begin
                FU_out.FRWD_A = FORWARD_wb;
            end else begin
            FU_out.FRWD_A = NOFORWARD; 
            end
                

            // FORWARD B
            if (FU_in.EX_rs2 == FU_in.Mem_rd) begin
                FU_out.FRWD_B = FORWARD_alu;
                
            end else if (FU_in.EX_rs2 == FU_in.WB_rd) begin
                FU_out.FRWD_B = FORWARD_wb;
            end else begin
                FU_out.FRWD_B = NOFORWARD; 
            end

    
        end else begin
                FU_out.FRWD_A = NOFORWARD;
                FU_out.FRWD_B = NOFORWARD; 
        end 
    end else begin
                FU_out.FRWD_A = NOFORWARD;
                FU_out.FRWD_B = NOFORWARD; 
    end
 
end
endmodule
