typedef enum logic {wait_rdy, req_off, req_on, idle} state;

module fetcher
( 
    // control signals
    input logic CLK,
    input logic RSTn,

    // from processor
    input logic [31:0] PC_in,

    // from memory
    input logic [31:0] DATA_in,
    input logic mem_rdy,
    input logic valid,

    // to memory
    output logic proc_req,
    output logic [31:0] PC_out,

    // to processor
    output logic [31:0] DATA_out,

    // to hazard unit
    output logic busy_out
);

state current_state, next_state;

always_ff @(posedge CLK) begin
    if (!RSTn) begin
        current_state <= idle;
    end
    else begin
        current_state <= next_state;
    end
end

always_comb begin : fetcher_fsm_control
    case (current_state)
        idle: begin
            if (valid) begin
                next_state = req_on;
            end
            else begin
                next_state = idle;
            end
        end
        req_off: begin
            if (valid) begin
                next_state = req_on;
            end
            else begin
                next_state = idle;
            end
        end
        req_on: begin
            if (mem_rdy) begin
                next_state = req_off;
            end
            else begin
                next_state = wait_rdy;
            end
        end
        wait_rdy: begin
            if (mem_rdy) begin
                next_state = req_off;
            end
            else begin
                next_state = wait_rdy;
            end
        end
    endcase

end      

always_comb begin : fetcher_fsm_data

    busy_out = '1;
    proc_req = '0;
    DATA_out = 'x;
    PC_out   = PC_in;

    case (current_state)
        idle: begin
            if (valid) begin
                busy_out = '0;
                DATA_out = DATA_in;
            end
            else begin
                busy_out = '1;
            end
        end
        req_off: begin
            if (valid) begin
                busy_out = '0;
                DATA_out = DATA_in;
            end
            else begin
                busy_out = '1;
            end
        end
        req_on: begin
            proc_req = '1;
        end
        wait_rdy: begin
            proc_req = '1;
        end
    endcase
  
end
  
endmodule