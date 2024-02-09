/*--------------------------------------------------------------------------------*/
// Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
//			 Marco Crisolgo 	[s305673@studenti.polito.it],
//			 Matteo Lago 		[s319914@studenti.polito.it],
//			 Renato Belmonte 	[s316792@studenti.polito.it],
//
// Module Name: Decode Unit
// Project Name: risc-v 
// Description: 
//
// Additional Comments: 
/*--------------------------------------------------------------------------------*/

// TARGET = PC + IMM ESTESO

module dec import riscv_pkg::*;
(
    input   logic RSTn, CLK, EN, 
    input   DEC_ctrl        DECctrl_in,
    input   logic [31:0]    IDdata_INSTRUCTION_in,
    input   logic [31:0]    IDdata_PC_in,
    input   logic [4:0]     WBdata_RD_in,
    input   logic [31:0]    WBdata_WriteData_in,


    output  logic [31:0]    EXdata_PC_out,
    output  logic [31:0]    EXdata_IMM_out,
    output  logic [31:0]    EXdata_RS1_out,
    output  logic [31:0]    EXdata_RS2_out,
    output  logic [4:0]     EXdata_RD_out,

    output  IF_ctrl         IFctrl_out

);

    logic [4:0] DECdata_RS1;
    logic [4:0] DECdata_RS2;
    logic [4:0] DECdata_RD;
    t_funct3    DECdata_funct3;
    t_funct7    DECdata_funct7;

    assign DECdata_RS1      = IDdata_INSTRUCTION_in[19:15];
    assign DECdata_RS2      = IDdata_INSTRUCTION_in[24:20];
    assign DECdata_RD       = IDdata_INSTRUCTION_in[11:7];
    assign DECdata_funct3   = t_funct3'(IDdata_INSTRUCTION_in[14:12]);
    assign DECdata_funct7   = t_funct7'(IDdata_INSTRUCTION_in[31:25]);


    assign EXdata_PC_out = IDdata_PC_in;
    assign EXdata_RD_out = DECdata_RD;



    imm_gen imm_gen_unit (
        .instruction_i(IDdata_INSTRUCTION_in),
        .immediate_o(EXdata_IMM_out)
    );

    bu bu_unit (
        .DECctrl_in(DECctrl_in),
        .RS1_in(EXdata_RS1_out),
        .RS2_in(EXdata_RS2_out),
        .funct3(DECdata_funct3),
        .BRANCH_cond_out(IFctrl_out)
    );

    register_file register_file_unit (
        .rs1(DECdata_RS1),
        .rs2(DECdata_RS2),
        .rd(WBdata_RD_in),
        .write_data(WBdata_WriteData_in),
        .RSTn(RSTn),
        .clk(CLK),
        .WE(EN),
        .read_data1(EXdata_RS1_out),
        .read_data2(EXdata_RS2_out)

    );

endmodule