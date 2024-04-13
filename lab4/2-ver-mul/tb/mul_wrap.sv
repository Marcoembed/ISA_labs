/* Module wrap Multiplier */

module mul_wrap #(parameter DWIDTH = 32) (
    alu_if.alu_port p
);
    multiplier mul_u (
        .a    (p.alu_a),
        .b    (p.alu_b),
        .out  (p.alu_res)
    );
endmodule

