class sequence_in extends uvm_sequence #(packet_in);
    `uvm_object_utils(sequence_in)

    function new(string name="sequence_in");
        super.new(name);
    endfunction: new

    task body;
        packet_in tx;

        forever begin
            tx = packet_in::type_id::create("tx");
            start_item(tx);

            assert(tx.randomize() with {
                tx.op == fpnew_pkg::ADD || tx.op == fpnew_pkg::MUL; //|| tx.op == FMADD || tx.op == FNMSUB;

                tx.A dist {
                  11'b0000000000000000              :=16,               // zero case
                  [11'b0000000000000001:11'b1111111111111111]    :/30,  // other numbers
                  11'b1111111111111111              :=16                // max case
                };

                tx.B dist {
                  11'b0000000000000000              :=16,               // zero case
                  [11'b0000000000000001:11'b1111111111111111]    :/30,  // other numbers
                  11'b1111111111111111              :=16                // max case
                };

                tx.C dist {
                  11'b0000000000000000              :=16,               // zero case
                  [11'b0000000000000001:11'b1111111111111111]    :/30,  // other numbers
                  11'b1111111111111111              :=16                // max case
                };
            });

            finish_item(tx);
        end
    endtask: body
endclass: sequence_in

