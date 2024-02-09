module fetcher import riscv_pkg::*;
(  
    input logic CLK,
    input logic RSTn,

    // control signals
    input logic HZ_instr_req,
    output logic busy_out,

    // processor signals
    input logic [31:0] PC_in,
    output logic [31:0] INSTR_out,

    // memory signals
    obi_intf.to_mem fetch_intf

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

always_comb begin : fetcher_fsm_control
    next_state = current_state;
    
    case (current_state)
        wait_req: begin
            if (HZ_instr_req) begin
                if (fetch_intf.mem_rdy == '1) begin
                    next_state = wait_valid;
                end else begin
                    next_state = wait_ready;
                end
            end
        end

        wait_ready: begin
            if (fetch_intf.mem_rdy == '1) begin
                next_state = wait_valid;
            end
        end

        wait_valid: begin
            if (fetch_intf.valid == '1) begin
                next_state = wait_req;
            end
        end

        default: begin
            next_state = current_state;
        end
    endcase

end      

always_comb begin : fetcher_fsm_data

    busy_out = '0;
    fetch_intf.proc_req = NOREQUEST;

    case (current_state)
        wait_req: begin
            if (HZ_instr_req) begin
                busy_out = '1;
                fetch_intf.proc_req = REQUEST;
            end 
        end

        wait_ready: begin
            busy_out = '1;
            fetch_intf.proc_req = REQUEST;
        end

        wait_valid: begin
            busy_out = '1;
            if(fetch_intf.valid == '1) begin
                busy_out = '0;
            end
        end
    endcase
  
end

// direct connections
assign fetch_intf.addr = PC_in;
assign fetch_intf.we = READ;
assign fetch_intf.wdata = '0;

// RDATA kept stable
always_latch begin : rdata_latch
    if (fetch_intf.valid) begin
        INSTR_out <= fetch_intf.rdata;  
    end
end

endmodule