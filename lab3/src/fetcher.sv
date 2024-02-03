typedef enum logic { busy, idle } state;

module fetcher
( 
    input logic CLK,
    input logic RSTn,
    obi_intf.PtoIntf fetcher_intf,
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

always_comb begin : fetcher_fsm_control
    case (current_state)
        busy: begin
            if (fetcher_intf.valid) begin
                next_state = idle;
            end
            else  begin
                next_state = busy;
            end
        end
        idle: begin
            // always new request (new instruction) if instruction memory is ready
            if (fetcher_intf.mem_rdy) begin
                next_state = busy;
            end
            else begin
                next_state = idle;
            end
        end
    endcase

end      

always_comb begin : fetcher_fsm_data

    // default value
    fetcher_intf.addressBus_out = 'z;
    busy_out = '1;

    case (current_state)
        busy: begin
            fetcher_intf.addressBus_out = fetcher_intf.addressBus_in; // addressBus <= PC
        end
        idle: begin
            busy_out = '0;
        end
    endcase
  
end
  
endmodule