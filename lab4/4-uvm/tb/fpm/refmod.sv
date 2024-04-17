// For enum types
import fpnew_pkg::*;

// Importing C functions in systemverilog using DPI-C
import "DPI-C" context function int mul_FP16(int a, int b);
import "DPI-C" context function int add_FP16(int b, int c);

class refmod extends uvm_component;
	`uvm_component_utils(refmod)
	
	packet_in tr_in;
	packet_out tr_out;
	uvm_get_port #(packet_in) in;
	uvm_put_port #(packet_out) out;
	
	function new(string name = "refmod", uvm_component parent);
		super.new(name, parent);
		in = new("in", this);
		out = new("out", this);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		tr_out = packet_out::type_id::create("tr_out", this);
	endfunction: build_phase
	
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		
		forever begin
			in.get(tr_in);
			case (tr_in.op)
				ADD:	begin
						tr_out.data = add_FP16(tr_in.B, tr_in.C);
						$display("refmod: ADD | A = %016b (0x%04h) | B = %016b (0x%04h) | C = %016b (0x%04h) | output OUT = %016b (0x%04h)", 
							tr_in.A, tr_in.A, tr_in.B, tr_in.B, tr_in.C, tr_in.C, tr_out.data, tr_out.data);
						end

				MUL:	begin
						tr_out.data = mul_FP16(tr_in.A, tr_in.B);
						$display("refmod: MUL | A = %016b (0x%04h) | B = %016b (0x%04h) | C = %016b (0x%04h) | output OUT = %016b (0x%04h)", 
							tr_in.A, tr_in.A, tr_in.B, tr_in.B, tr_in.C, tr_in.C, tr_out.data, tr_out.data);
						end

				/* With other operations, return 0 */
				default: begin
					tr_out.data = 'h0;
					$display("refmod: unknown op = %d", tr_in.C);
				end

			endcase
			out.put(tr_out);
		end
	endtask: run_phase
endclass: refmod
