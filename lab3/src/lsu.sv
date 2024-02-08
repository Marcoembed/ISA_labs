module lsu import riscv_pkg::*;
( 
    input logic CLK,
    input logic RSTn,

    // control signals
    input logic HZ_data_req,
    output logic busy_out,
    input MEM_ctrl MEMctrl_in,

    // processor signals
    input logic [31:0] addr_in,
    input logic [31:0] data_in,
    output logic [31:0] data_out,

    // memory signals
    obi_intf.to_mem lsu_intf

);


typedef enum logic[1:0] {wait_req, wait_valid, wait_ready} state;
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
            if (MEM_ctrl_in.mem_en == '1 && HZ_data_req) begin
                if (lsu_intf.mem_rdy == '1) begin
                    next_state = wait_valid;
                end else begin
                    next_state = wait_ready;
                end
            end
        end

        wait_ready: begin
            if (lsu_intf.mem_rdy == '1) begin
                next_state = wait_valid;
            end
        end

        wait_valid: begin
            if (lsu_intf.valid == '1) begin
                next_state = wait_req;
            end
        end

        default: begin
            next_state = current_state;
        end
    endcase

end


always_comb begin : lsu_fsm_output

    busy_out = '0;
    lsu_intf.proc_req = NOREQUEST;

    case (current_state)
        wait_req: begin
            if (MEM_ctrl_in.mem_en == '1 && HZ_data_req) begin
                busy_out = '1;
                lsu_intf.proc_req = REQUEST;
            end 
        end

        wait_ready: begin
            busy_out = '1;
            lsu_intf.proc_req = REQUEST;
        end

        wait_valid: begin
            busy_out = '1;
            if(lsu_intf.valid == '1) begin
                busy_out = '0;
            end
        end
    endcase
  
end

// direct connections
assign lsu_intf.addr = addr_in;
assign lsu_intf.we = MEM_ctrl_in.wr;
assign lsu_intf.wdata = data_in;

// RDATA kept stable
always_latch begin : rdata_latch
    if (lsu_intf.valid) begin
        data_out <= lsu_intf.rdata;  
    end
end

endmodule