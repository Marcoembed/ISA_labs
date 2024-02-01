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
    input   logic RSTn, CLK, EN, //TODO controllare da dove viene EN
    input   DEC_ctrl        DECctrl_in,
    input   logic [31:0]    IDdata_INSTRUCTION_in,
    input   logic [31:0]    IDdata_PC_in,
    input   logic [4:0]     WBdata_RD_in,
    input   logic [31:0]    WBdata_WriteData_in,


    output  logic [31:0]    EXdata_PC_out,
    output  logic [31:0]    EXdata_IMM_out,
    output  logic [31:0]    EXdata_RS1_out,
    output  logic [31:0]    EXdata_RS2_out,
    output  logic [4:0]     EXdata_RD_out

);

    logic [4:0] RS1;
    logic [4:0] RS2;
    logic [4:0] RD;
    logic [3:0] funct3;
    funct7[6:0] funct7;

    assign RS1      = IDdata_INSTRUCTION_in[19:15];
    assign RS2      = IDdata_INSTRUCTION_in[24:20];
    assign funct3   = IDdata_INSTRUCTION_in[14:12];
    assign RD       = IDdata_INSTRUCTION_in[11:7];
    assign funct7   = IDdata_INSTRUCTION_in[31:25];


    assign EXdata_PC_out = IDdata_PC_in;
    assign EXdata_RD_out = RD;



    imm_gen imm_gen_unit (
        .instruction_i(IDdata_INSTRUCTION_in),
        .immediate_o(MEMdata_IMM_out)
    );

    bu bu_unit (
        .DECctrl_in(DECctrl_in),
        .RS1(RS1),
        .RS2(RS2)
         
    );

    register_file register_file_unit (
        .rs1(RS1),
        .rs2(RS2),
        .rd(WBdata_RD_in),
        .write_data(WBdata_WriteData_in),
        .RegWrite(), // TODO Dovrebbe esserci un segnale che dice se scrivere?? Dipende da come @Matteo vuole fare il RF
        .RSTn(RSTn),
        .clk(CLK),
        .en(EN),
        .read_data1(EXdata_RS1_out),
        .read_data2(EXdata_RS2_out)

    );

endmodule