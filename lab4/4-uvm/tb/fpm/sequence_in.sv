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
				  16'b0000000000000000              :=16, // +zero case
				  16'b1000000000000000              :=16, // -zero case
				  [16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
				  [16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
				  [16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
				  [16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
				  16'b1111110000000000        :=16, // -inf
				  16'b0111110000000000        :=16  // +inf
				};

				tx.B dist {
				  16'b0000000000000000              :=16, // +zero case
				  16'b1000000000000000              :=16, // -zero case
				  [16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
				  [16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
				  [16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
				  [16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
				  16'b1111110000000000        :=16, // -inf
				  16'b0111110000000000        :=16  // +inf
				};

				tx.C dist {
				  16'b0000000000000000              :=16, // +zero case
				  16'b1000000000000000              :=16, // -zero case
				  [16'b0000000000000001:16'b0111101111111111]    :/30, // positive normal number
				  [16'b1000000000000001:16'b1111101111111111]    :/30, // negative normal number
				  [16'b1111110000000001:16'b1111111111111111]    :/16, //-nan
				  [16'b0111110000000001:16'b0111111111111111]    :/16, //+nan
				  16'b1111110000000000        :=16, // -inf
				  16'b0111110000000000        :=16  // +inf
				};
			});
            finish_item(tx);
        end
    endtask: body
endclass: sequence_in

