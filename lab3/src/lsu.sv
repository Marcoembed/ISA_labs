typedef enum logic { busy, idle } state;

module lsu import riscv_pkg::*;
( 
    input logic CLK,
    input logic RSTn,
    input MEM_ctrl MEMctrl_in,
    obi_intf.PtoIntf lsu_intf,
    output logic [31:0] dataBus_out,
    output logic busy_out
);

state current_state, next_state;

always_ff @(posedge CLK or negedge RSTn) begin
    if (!RSTn) begin
        current_state <= idle;
    end
    else begin
        current_state <= next_state;
    end
end

always_comb begin : lsu_fsm_control
    case (current_state)
        busy: begin
            if (lsu_intf.valid) begin
                next_state = idle;
            end
            else  begin
                next_state = busy;
            end
        end
        idle: begin
            if (MEMctrl_in.proc_req == REQUEST && lsu_intf.mem_rdy) begin
                next_state = busy;
            end
            else begin
                next_state = idle;
            end
        end
    endcase

end      

always_comb begin : lsu_fsm_data

    // default value
    busy_out = '1;
    dataBus_out = 'z;
    lsu_intf.addressBus_out = 'z;

    case (current_state)
        busy: begin
            if(MEMctrl_in.we == READ) begin // LOAD
                dataBus_out = lsu_intf.dataBus_in;
            end
            else if (MEMctrl_in.we == WRITE) begin // STORE
                lsu_intf.addressBus_out = lsu_intf.addressBus_in;
            end
        end 
        idle: begin
            busy_out = '0;
        end
    endcase
  
end
  
endmodule