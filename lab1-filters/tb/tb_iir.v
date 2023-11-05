//`timescale 1ns

module tb_iir ();

    wire CLK_i;
    wire RST_N_i;
    wire [9:0] DIN_i;
    wire [9:0] B0_i;
    wire [9:0] B1_i;
    wire [9:0] A1_i;
    wire [9:0] DOUT_i;
    wire VIN_i;
    wire VOUT_i;
    wire END_SIM_i;
 
    clk_gen CG(
        .END_SIM(END_SIM_i),
        .CLK(CLK_i),
        .RST_N(RST_N_i));
 
    data_maker SM(
        .CLK(CLK_i),
        .RST_N(RST_N_i),
        .VOUT(VIN_i),
        .DOUT(DIN_i),
        .B0(B0_i),
        .B1(B1_i),
        .A1(A1_i),
        .END_SIM(END_SIM_i));
 
    iir UUT(
        .CLK(CLK_i),
        .RST_N(RST_N_i),
        .X(DIN_i),
        .VIN(VIN_i),
        .B0(B0_i),
        .B1(B1_i),
        .A1(A1_i),
        .Y(DOUT_i),
        .VOUT(VOUT_i));

    data_sink DS(
        .CLK(CLK_i),
        .RST_N(RST_N_i),
        .VIN(VOUT_i),
        .DIN(DOUT_i));   

    // Logging
    always @(posedge CLK_i, negedge RST_N_i) begin
        if(!RST_N_i) begin
           $display("Time=%0t Reset async",$time); 
       end else begin
           $display("Time=%0t VIN:%d, DIN: %d, VOUT: %d, DOUT: %d",$time,VIN_i,DIN_i,VOUT_i,DOUT_i); 
        end
    end

    // End simulation
    always @(END_SIM_i) begin
        if(END_SIM_i) begin
           $display("Ending simulation shortly",$time); 
           $finish;
        end
    end
endmodule

           
