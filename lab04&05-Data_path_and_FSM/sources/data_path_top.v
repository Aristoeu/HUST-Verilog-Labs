`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// HUST Verilog Experiment 4 and 5
//
// Pan Yue
//
//////////////////////////////////////////////////////////////////////////////////

module data_path_top(clk, rst, ld_sum, sum_sel, ld_next, next_sel, a_sel);
	input clk, rst;
	input ld_sum, sum_sel;
	input ld_next, next_sel;
	input a_sel;
	output next_zero;

	wire [31:0] A1_result, A2_result;
	wire [31:0] L1_result, L2_result;
	wire [31:0] S1_result, S2_result, S3_result;
	wire [31:0] RAM_data;

	full_adder A1(.a(L1_result), .b(RAM_data), .s(A1_result));
	full_adder A2(.a(1), .b(L2_result), .s(A2_result));

	latch L1(.clk(clk), .rst(rst), .ld(ld_sum), .d(S1_result), .q(L1_result));
	latch L2(.clk(clk), .rstrst .ld(ld_next), .d(S2_result), .q(L2_result));

	comparator C1(.A(S2_result), .B(0), .is_equal(next_zero));

	selector_2_to_1 S1(.a(A1_result), .b(0), .sel(sum_sel), .out(S1_result));
	selector_2_to_1 S2(.a(RAM_data), .b(0), .sel(next_sel), .out(S2_result));
	selector_2_to_1 S3(.a(A2_result), .b(L2_result), .sel(a_sel), .out(S3_result));

	dual_port_ram RAM1(.read_addr(S3_result), .we(0), .clk(clk), .q(RAM_data))
endmodule