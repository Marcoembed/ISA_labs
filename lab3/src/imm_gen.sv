/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Immediate Generator
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/


module imm_gen import riscv_pkg::*; 
#(
    input   logic[31:0]  instruction_i, 
    output  logic[31:0]  immediate_o
);

t_opcode  op_code;
assign op_code = instruction_i[6:0];

case (op_code)
    OP_RTYPE: begin
        immediate_o = 32'b0;
    end
    OP_ADDI: begin
        immediate_o = 32'(signed'(instruction_i[31:20]));
    end

    OP_AUIPC: begin
        immediate_o = {instruction_i[31:21], 12'b0};
    end

    OP_BRANCH: begin
        immediate_o = {instruction_i[31], instruction_i[7], instruction_i[30:25], instruction_i[11:8], 1'b0};
    end

    OP_JMP: begin
        immediate_o = {12'(signed'(instruction_i[31])), instruction_i[19:12], instruction_i[20], instruction_i[30:21], 1'b0}; 
    end

    OP_LUI: begin
        immediate_o = {instruction_i[31:12], 12'b0};
    end

    OP_LW: begin
        immediate_o = {20'(signed'(instruction_i[31])), instruction_i[31:20]};
    end

    OP_SW: begin
        immediate_o = {20'(signed'(instruction_i[31])), instruction_i[31:25], instruction_i[11:7]};
    end

    OP_RET: begin
        immediate_o = 32'b0;
    end

    default: begin
            immediate_o = 32'b0;
        end
 
    
endcase
    
endmodule