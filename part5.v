module part5(SW, KEY, LEDR, HEX0, HEX1, HEX2, HEX3);
	input[9:0] SW;
	input[0:0] KEY;
	output[15:0] LEDR;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	reg[7:0] A, B;
	
	always@(posedge KEY[0])
	begin
		
		if(SW[8])
			A <= SW[7:0];
		
		if(SW[9])
			B <= SW[7:0];
	end
	
	
	assign LEDR[15:0] = A*B;
	hexto7segment H0(LEDR[3:0],HEX0);
	hexto7segment H1(LEDR[7:4],HEX1);
	hexto7segment H2(LEDR[11:8],HEX2);
	hexto7segment H3(LEDR[15:12],HEX3);
endmodule



module hexto7segment(x,y);
	input[3:0] x;
	output[6:0] y;
	reg[6:0] h;

	always @*
		case (x)
		4'b0000 : h = 7'b1000000;  // 0
		4'b0001 : h = 7'b1111001;  // 1
		4'b0010 : h = 7'b0100100;  // 2
		4'b0011 : h = 7'b0110000;  // 3
		4'b0100 : h = 7'b0011001;  // 4
		4'b0101 : h = 7'b0010010;  // 5
		4'b0110 : h = 7'b0000010;  // 6
		4'b0111 : h = 7'b1111000;  // 7
		4'b1000 : h = 7'b0000000;  // 8
		4'b1001 : h = 7'b0010000;  // 9
		4'b1010 : h = 7'b0001000;  // A
		4'b1011 : h = 7'b0000011;  // B
		4'b1100 : h = 7'b1000110;  // C
		4'b1101 : h = 7'b0100001;  // D
		4'b1110 : h = 7'b0000110;  // E
		4'b1111 : h = 7'b0001110;  // F
	endcase

	assign y = h;
endmodule 