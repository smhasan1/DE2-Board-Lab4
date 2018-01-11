module part2(KEY, SW, HEX0, HEX1);
	input[0:0] KEY;
	input[1:0] SW;
	output[6:0] HEX0, HEX1;
	reg[7:0] Q;
	
	always@(posedge KEY[0] or negedge SW[0])
	begin
		if(~SW[0])
		begin
			Q <= 0;
		end
		else if(SW[1])
		begin
			Q <= Q + 1;
		end
	end
	
	hexto7segment H0(Q[3:0],HEX0);
	hexto7segment H1(Q[7:4],HEX1);
	
endmodule 


module hexto7segment(x,y);
	input[3:0] x;
	output[6:0] y;
	reg[6:0] h;

	always @*
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

	assign y = h;
	
endmodule 