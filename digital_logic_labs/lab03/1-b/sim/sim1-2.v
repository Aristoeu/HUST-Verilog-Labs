`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// HUST Digital Logic Experiment 3-1-2 Simulation
//
// Pan Yue
//  
//////////////////////////////////////////////////////////////////////////////////


module test_1_2;
  reg x, cp;
  wire y, q0, q1;

  simple_sync_seq test(.clk(cp), .t(1), .x(x), .y(y), .q0(q0), .q1(q1));

initial begin
  cp = 0;
  x = 0;
  #10;
end

always begin
  #10 cp <= ~cp;
end

always begin
  #30 x <= ~x;
end

endmodule
