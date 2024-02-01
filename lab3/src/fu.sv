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

//TODO METTERE I VALORI DI DEFAULT
module fu import my_pkg::*;
( 
    input   FU_i    FU_in,
    input   FU_mux  FU_out
);

always_comb begin
// Only if forwarding instruction will write to a register
// Only if Rd for that instruction is not R0

if (FU_in.Mem_RegWrite || FU_in.WB_RegWrite) begin
    if (FU_in.Mem_rd != 0 || FU_in.WB_rd != 0) begin
        if (FU_in.ALU_srcA == RS1) begin
        // FORWARD A 
            if (FU_in.EX_rs1 == FU_in.Mem_rd) begin
                FU_out.FRWD_A = FORWARD_alu;
              
            end else if (FU_in.EX_rs1 == FU_in.WB_rd) begin
                FU_out.FRWD_A = FORWARD_wb;
            end else begin
               FU_out.FRWD_A = NOFORWARD; 
            end
            
        end 


        if (FU_in.ALU_srcB == RS2) begin
        // FORWARD B
            if (FU_in.EX_rs1 == FU_in.Mem_rd) begin
                FU_out.FRWD_B = FORWARD_alu;
              
            end else if (FU_in.EX_rs1 == FU_in.WB_rd) begin
                FU_out.FRWD_B = FORWARD_wb;
            end else begin
                FU_out.FRWD_B = NOFORWARD; 
            end
        end
  
    end
end
 
end
endmodule

import my_pkg::*;

module FU_Unit (input 	FU_ctrl_i 	FU_i,
				output 	FU_mux      FU_o
);

always @ (FU_i) begin
	// Only if forwarding instruction will write to a register
	if (FU_i.Mem_RegWrite == 1'b1 || FU_i.WB_RegWrite  == 1'b1) begin
		// Only if Rd for that instruction is not R0
		if (FU_i.MEM_in_Rd_EQ0 != 1'b0 || FU_i.WB_in_Rd_EQ0 != 1'b0) begin
			if(FU_i.ALU_src[0]==1'b0)
				case (FU_i.EX_rs1)
					5'b0000 : begin
						FU_o.ForwardA = NOFWA;
					end
					FU_i.Mem_rd : begin
						FU_o.ForwardA = FWA_ALURSLT;
					end
					FU_i.WB_rd : begin
						FU_o.ForwardA = FWA_MEMD;
					end
					default: begin
						FU_o.ForwardA = NOFWA;
					end
				endcase
			else begin
				FU_o.ForwardA = NOFWA;
			end
		end else begin // Default Case = Both Rd are zero
			FU_o.ForwardA = NOFWA;
		end		
	end else begin // Default Case
		FU_o.ForwardA = NOFWA;
	end	
end

always @ (FU_i) begin
	// Only if forwarding instruction will write to a register
	if (FU_i.Mem_RegWrite == 1 || FU_i.WB_RegWrite  == 1) begin
		// Only if Rd for that instruction is not R0
		if (FU_i.MEM_in_Rd_EQ0 != 1'b0 || FU_i.WB_in_Rd_EQ0 != 1'b0) begin
			if(FU_i.ALU_src[1]==1'b0)
				case (FU_i.EX_rs2)
					5'b00000 : begin
						FU_o.ForwardB = NOFWB;
					end
					FU_i.Mem_rd : begin
						FU_o.ForwardB = FWB_ALURSLT;
					end
					FU_i.WB_rd : begin
						FU_o.ForwardB = FWB_MEMD;
					end
					default: begin
						FU_o.ForwardB = NOFWB;
					end
				endcase
			else begin
				FU_o.ForwardB = NOFWB;
			end
		end else begin // Default Case = Both Rd are zero
			FU_o.ForwardB = NOFWB;
		end		
	end else begin // Default Case
		FU_o.ForwardB = NOFWB;
	end	
end
endmodule
