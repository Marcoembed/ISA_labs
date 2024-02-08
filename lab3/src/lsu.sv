typedef enum logic[1:0] {wait_req, wait_valid, wait_ready} state;

module lsu import riscv_pkg::*;
( 
    // control signals
    input logic CLK,
    input logic RSTn,
    input MEM_ctrl MEMctrl_in,
    input logic HZ_data_req,

    // from datapath
    input logic [31:0] addr_in,
    input logic [31:0] data_in,

    // to datapath
    output logic [31:0] data_out,

    // to obi interface
    output logic [31:0] OBI_addr,
    output logic [31:0] OBI_data_out, // data to be sent on obi interface
    output logic OBI_proc_req,
    output logic OBI_we, //we-nRE

    // from obi interface 
    input logic [31:0] OBI_data_in, // data sampled from the obi interface
    input logic OBI_mem_rdy,
    input logic OBI_valid,

    // to hazard unit
    output logic busy_out
);


state current_state, next_state;

always_ff @(posedge CLK) begin
    if (!RSTn) begin
        current_state <= wait_req;
    end
    else begin
        current_state <= next_state;
    end
end

always_comb begin : lsu_fsm_control
    case (current_state)
        wait_req: begin
            if (MEM_ctrl_in.proc_req == REQUEST && HZ_data_req) begin
                if (OBI_mem_rdy == '1) begin
                    next_state = wait_valid;
                end else begin
                    next_state = wait_ready;
                end
            end
        end
        wait_ready: begin
            if (OBI_mem_rdy == '1) begin
                next_state = wait_valid;
            end
        end
        wait_valid: begin
            if (OBI_valid == '1) begin
                next_state = wait_req;
            end
        end
        default: begin
            next_state = current_state;
        end
    endcase

end      

// this outputs are latched by stalling the pipeline registers
// with busy_out
assign OBI_addr = addr_in;
assign OBI_data_in = data_in;
assign OBI_we = MEM_ctrl_in.we;

always_comb begin : lsu_fsm_output

    OBI_proc_req = '0;
    busy_out = '0;

    case (current_state)
        wait_req: begin
            busy_out = '0;
            OBI_proc_req = '0;
            if (MEM_ctrl_in.proc_req==REQUEST && HZ_data_req) begin
                busy_out = '1;
                OBI_proc_req = '1;
            end 
        end
        wait_ready: begin
            proc_req = '1;
            busy_out = '1;
        end
        wait_valid: begin
            busy_out = '1;
            OBI_proc_req = '0;
            if(OBI_valid == '1) begin
                busy_out = '0;
            end
        end
    endcase
  
end
  
endmodule
