/*------------------------------ HALF ADDER*/

module HA(a,b,sum,cout);

	/*------------------------------ PORT*/
	input logic a,b;
	output logic sum,cout;

	/*------------------------------ ALWAYS*/
	always_comb begin
   		sum  = a ^ b;
		cout = a & b; 
	end
  
endmodule : HA
