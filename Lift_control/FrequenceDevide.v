module FrequenceDevide(CLK, reset, clk);
input CLK, reset;
output clk;

wire clk_1MHz, clk_100KHz, clk_10KHz, clk_1KHz, clk_100Hz, clk_10Hz;
     Divide_By_50 d6 (clk_1MHz, CLK, reset);
     Divide_By_10 d5 (clk_100KHz, clk_1MHz, reset);
     Divide_By_10 d4 (clk_10KHz, clk_100KHz, reset);
     Divide_By_10 d3 (clk_1KHz, clk_10KHz, reset);
     Divide_By_10 d2 (clk_100Hz, clk_1KHz, reset);
     Divide_By_10 d1 (clk_10Hz, clk_100Hz, reset);
     Divide_By_10 d0 (clk, clk_10Hz, reset);
endmodule
