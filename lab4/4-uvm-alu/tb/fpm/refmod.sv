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
						tr_out.data = 	$shortrealtobits($bitstoshortreal(tr_in.B) + $bitstoshortreal(tr_in.C)); 
						$display("refmod: ADD | input A = %e | input B = %e | output OUT = %e", 
							$bitstoshortreal(tr_in.B), $bitstoshortreal(tr_in.C), $bitstoshortreal(tr_out.data));
						/* check if the number is NaN*/
						$display("refmod: ADD | input A = %b | input B = %b | output OUT = %b", tr_in.B, tr_in.C, tr_out.data);
						end

				MUL:	begin    
						tr_out.data = 	$shortrealtobits($bitstoshortreal(tr_in.A) * $bitstoshortreal(tr_in.B));
						$display("refmod: MUL | input A = %e | input B = %e | output OUT = %e", 
							$bitstoshortreal(tr_in.A), $bitstoshortreal(tr_in.B), $bitstoshortreal(tr_out.data));
						/* check if the number is NaN*/
						$display("refmod: MUL | input A = %b | input B = %b | output OUT = %b", tr_in.A, tr_in.B, tr_out.data);
        				end
// TODO
//				FMADD:	begin  
//						tr_out.data = 	$shortrealtobits($bitstoshortreal(tr_in.A) * $bitstoshortreal(tr_in.B) 
//									+ $bitstoshortreal(tr_in.C)); 
//						$display("refmod: FMADD | input A = %e | input B = %e | input C = %e | output OUT = %e", 
//							$bitstoshortreal(tr_in.A), $bitstoshortreal(tr_in.B), 
//							$bitstoshortreal(tr_in.C), $bitstoshortreal(tr_out.data));
//						/* check if the number is NaN*/
//						$display("refmod: FMADD | input A = %b | input B = %b | input C = %b | output OUT = %b", 
//							tr_in.A, tr_in.B, tr_in.C, tr_out.data);
//        				end
//
//        		FNMSUB: begin 
//						tr_out.data = 	$shortrealtobits(-($bitstoshortreal(tr_in.A) * $bitstoshortreal(tr_in.B))
//							   		+ $bitstoshortreal(tr_in.C)); 
//						$display("refmod: FNMSUB | input A = %e | input B = %e | input C = %e | output OUT = %e", 
//							$bitstoshortreal(tr_in.A), $bitstoshortreal(tr_in.B), 
//							$bitstoshortreal(tr_in.C), $bitstoshortreal(tr_out.data));
//						/* check if the number is NaN*/
//						$display("refmod: FNMSUB | input A = %b | input B = %b | input C = %b | output OUT = %b", 
//							tr_in.A, tr_in.B, tr_in.C, tr_out.data);
//        				end

        		/* With other operations, return 0 */
        		default: tr_out.data = 'h0;
        	endcase
			out.put(tr_out);
		end
    endtask: run_phase
endclass: refmod
