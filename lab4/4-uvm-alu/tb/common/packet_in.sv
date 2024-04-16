class packet_in extends uvm_sequence_item;
    rand logic[15:0] A;
    rand logic[15:0] B;
    rand logic[15:0] C;
	rand operation_e op; 

    `uvm_object_utils_begin(packet_in)
        `uvm_field_int(A, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(B, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="packet_in");
        super.new(name);
    endfunction: new
endclass: packet_in
