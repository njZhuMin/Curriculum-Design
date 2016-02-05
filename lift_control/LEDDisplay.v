module LEDDisplay(pos, seg);
input [3:0]pos;
output[6:0] seg;
reg[6:0] seg;

parameter IDLE=4'b0000,FLOOR1=4'b0001, FLOOR2=4'b0010, FLOOR3=4'b0100, FLOOR4=4'b1000;
	
	always 
		begin 
			case(pos)
				FLOOR1:
					seg<=7'b1111001;
				FLOOR2:
					seg<=7'b0100100;
				FLOOR3:
					seg<=7'b0110000;
				FLOOR4:
					seg<=7'b0011001;
				default:
					seg<=7'b1111001;
			endcase		
	end
endmodule