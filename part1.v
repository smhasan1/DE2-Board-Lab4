module part1(KEY, SW, HEX0, HEX1);
	input[0:0] KEY;
	input[1:0] SW;
	output[6:0] HEX0, HEX1;
	wire[7:0] q;
	wire w1, w2, w3, w4, w5, w6, w7;
	
	assign clock = KEY[0];
	assign enable = SW[1];
	assign clear = SW[0];
	assign w1 = enable & q[0];
	assign w2 = w1 & q[1];
	assign w3 = w2 & q[2];
	assign w4 = w3 & q[3];
	assign w5 = w4 & q[4];
	assign w6 = w5 & q[5];
	assign w7 = w6 & q[6];
	
	T_ff one(enable, clock, clear, q[0]);
	T_ff two(w1, clock, clear, q[1]);
	T_ff three(w2, clock, clear, q[2]);
	T_ff four(w3, clock, clear, q[3]);
	T_ff five(w4, clock, clear, q[4]);
	T_ff six(w5, clock, clear, q[5]);
	T_ff seven(w6, clock, clear, q[6]);
	T_ff eight(w7, clock, clear, q[7]);
	
	//assign HEX0 = 7'b1111001;
	hexto7segment H0(q[3:0],HEX0);
	hexto7segment H1(q[7:4],HEX1);

endmodule


module T_ff(w, clk, rst, q);
	input w, clk, rst;
	output q;
	reg f;
	
	always@(posedge clk or negedge rst)
	begin
		if(~rst)
		begin
			f <= 0;
		end
		else if(w)
		begin
			f <= ~f;
		end
	end
	
	assign q = f;

endmodule


module hexto7segment(x,y);
	input[3:0] x;
	output[6:0] y;
	reg[6:0] h;

	always @(*)
	begin
		case (x)
		4'b0000 : h = 7'b1000000;
		4'b0001 : h = 7'b1111001;
		4'b0010 : h = 7'b0100100; 
		4'b0011 : h = 7'b0110000;
		4'b0100 : h = 7'b0011001;
		4'b0101 : h = 7'b0010010;  
		4'b0110 : h = 7'b0000010;
		4'b0111 : h = 7'b1111000;
		4'b1000 : h = 7'b0000000;
		4'b1001 : h = 7'b0010000;
		4'b1010 : h = 7'b0001000; 
		4'b1011 : h = 7'b0000011;
		4'b1100 : h = 7'b1000110;
		4'b1101 : h = 7'b0100001;
		4'b1110 : h = 7'b0000110;
		4'b1111 : h = 7'b0001110;
		endcase
	end
	
	assign y = h;

endmodule 