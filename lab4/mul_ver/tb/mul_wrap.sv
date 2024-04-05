/* Module wrap Multiplier */

module mul_wrap #(parameter DWIDTH = 32) (
    alu_if.mul_port mp
);
    multiplier #(DWIDTH) mul_u (
        .alu_a_i    (mp.alu_a),
        .alu_b_i    (mp.alu_b),
        .alu_res_o  (mp.alu_res)
    );
endmodule

