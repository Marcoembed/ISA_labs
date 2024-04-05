/* Module wrap Multiplier */

module mul_wrap #(parameter DWIDTH = 32) (
    alu_if.mul_port mp
);
    multiplier mul_u (
        .a    (mp.alu_a),
        .b    (mp.alu_b),
        .out  (mp.alu_res)
    );
endmodule

