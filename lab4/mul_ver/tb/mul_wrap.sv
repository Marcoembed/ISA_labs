/* Module wrap Multiplier */

module mul_wrap #(parameter DWIDTH = 32) (
    alu_if.alu_port p
);
    multiplier #(DWIDTH) mul_u (
        .alu_a_i    (p.alu_a),
        .alu_b_i    (p.alu_b),
        .alu_res_o  (p.alu_res)
    );
endmodule

