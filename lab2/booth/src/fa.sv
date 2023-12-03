/*------------------------------ FULL ADDER*/

module FA(a,b,cin,sum,cout);

	/*------------------------------ PORT*/
	input logic a,b,cin;
	output logic sum,cout;

	/*------------------------------ ALWAYS*/
	always_comb begin
   		sum  = a ^ b ^ cin;
		cout = (a & b) ^ (cin & (a ^ b)); 
	end
  
endmodule : FA

