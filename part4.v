module part4(CLOCK_50, HEX0, HEX1, HEX2, HEX3);
	input CLOCK_50;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	reg[25:0] counter;
	reg[1:0] cycle;
	wire[1:0] w0, w1, w2, w3;
	parameter P = 2'b00, A = 2'b01, S = 2'b10;
	
	
	always@(posedge CLOCK_50)
	begin
		
		counter = counter + 1;
		if(counter == 50000000)
		begin
			
			// cycle = 0 : P A S S
			// cycle = 1 : S P A S
			// cycle = 2 : S S P A
			// cycle = 3 : A S S P
			cycle = cycle + 1;
			counter = 0;
		end
	end

	
	mux_2bit_4to1 u0(P, S, S, A, cycle, w0);	
	mux_2bit_4to1 u1(A, P, S, S, cycle, w1);
	mux_2bit_4to1 u2(S, A, P, S, cycle, w2);
	mux_2bit_4to1 u3(S, S, A, P, cycle, w3);
	char_7seg c0(w0, HEX3);
	char_7seg c1(w1, HEX2);
	char_7seg c2(w2, HEX1);
	char_7seg c3(w3, HEX0);
endmodule



module mux_2bit_4to1(A,B,C,D,S,M);
	input[1:0] A, B, C, D, S;
	output[1:0] M;
	wire[1:0] X, Y;
	
	mux_2bit_2to1 m0(A,B,S[0],X);
	mux_2bit_2to1 m1(C,D,S[0],Y);
	mux_2bit_2to1 m2(X,Y,S[1],M);
endmodule


// 2-bit 2-to-1 Mux
module mux_2bit_2to1(X,Y,s,M);
   input[1:0] X,Y;
   input s;
   output [1:0] M;

   assign M = ({2{~s}} & X) | ({2{s}} & Y);
endmodule


// Seven-Segment Decoder
module char_7seg(C, Display);
	input[1:0] C;
	output[6:0] Display;
	
	assign Display[1] = C[1]&~C[0];
	assign Display[2] = ~C[1]&~C[0];
	assign Display[3] = ~C[1]&~C[0] | ~C[1]&C[0];
	assign Display[4] = C[1]&~C[0];
endmodule 