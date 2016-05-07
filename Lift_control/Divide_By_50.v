module Divide_By_50 (Q, clk, reset);
      input clk,reset;
      output Q;
      reg Q;
      reg [4:0] count;
     
always @(posedge clk or posedge reset)
begin
        if (reset)
            begin
                Q <= 1'b0;
                count <= 5'b00000;
            end
        else if (count < 24)
            begin
                count <= count + 1'b1;
            end
        else
            begin
                count <= 5'b00000;
                Q <= ~Q;
            end
end
endmodule