module Divide_By_10 (Q, clk, reset);
      input clk,reset;
      output Q;
      reg Q;
      reg [2:0] count;
      
always @(posedge clk or posedge reset)
	begin
        if (reset)	//if(reset&speedup=0)
            begin
                Q <= 1'b0;
                count <= 3'b000;
             end
        else if (count < 4)
            begin
                count <= count + 1'b1;
            end
             else
                 begin
                     count <= 3'b000;
                     Q <= ~Q;
                 end
	end
endmodule