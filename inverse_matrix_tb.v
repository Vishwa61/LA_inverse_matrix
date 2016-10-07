`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:42:17 10/07/2016
// Design Name:   inverse_matrix
// Module Name:   
// Project Name:  inverse_matrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inverse_matrix
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module inverse_matrix_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] address;

	// Outputs
	wire [31:0] data_out;
	wire [31:0] I11;
	wire [31:0] I12;
	wire [31:0] I13;
	wire [31:0] I14;
	wire [31:0] I15;
	wire [31:0] I21;
	wire [31:0] I22;
	wire [31:0] I23;
	wire [31:0] I24;
	wire [31:0] I25;
	wire [31:0] I31;
	wire [31:0] I32;
	wire [31:0] I33;
	wire [31:0] I34;
	wire [31:0] I35;
	wire [31:0] I41;
	wire [31:0] I42;
	wire [31:0] I43;
	wire [31:0] I44;
	wire [31:0] I45;
	wire [31:0] I51;
	wire [31:0] I52;
	wire [31:0] I53;
	wire [31:0] I54;
	wire [31:0] I55;
	wire [31:0] I11d;
	wire [31:0] I12d;
	wire [31:0] I13d;
	wire [31:0] I14d;
	wire [31:0] I15d;
	wire [31:0] I21d;
	wire [31:0] I22d;
	wire [31:0] I23d;
	wire [31:0] I24d;
	wire [31:0] I25d;
	wire [31:0] I31d;
	wire [31:0] I32d;
	wire [31:0] I33d;
	wire [31:0] I34d;
	wire [31:0] I35d;
	wire [31:0] I41d;
	wire [31:0] I42d;
	wire [31:0] I43d;
	wire [31:0] I44d;
	wire [31:0] I45d;
	wire [31:0] I51d;
	wire [31:0] I52d;
	wire [31:0] I53d;
	wire [31:0] I54d;
	wire [31:0] I55d;

	// Instantiate the Unit Under Test (UUT)
	inverse_matrix uut (
		.clk(clk), 
		.reset(reset), 
		.data_out(data_out), 
		.address(address), 
		.I11(I11), 
		.I12(I12), 
		.I13(I13), 
		.I14(I14), 
		.I15(I15), 
		.I21(I21), 
		.I22(I22), 
		.I23(I23), 
		.I24(I24), 
		.I25(I25), 
		.I31(I31), 
		.I32(I32), 
		.I33(I33), 
		.I34(I34), 
		.I35(I35), 
		.I41(I41), 
		.I42(I42), 
		.I43(I43), 
		.I44(I44), 
		.I45(I45), 
		.I51(I51), 
		.I52(I52), 
		.I53(I53), 
		.I54(I54), 
		.I55(I55), 
		.I11d(I11d), 
		.I12d(I12d), 
		.I13d(I13d), 
		.I14d(I14d), 
		.I15d(I15d), 
		.I21d(I21d), 
		.I22d(I22d), 
		.I23d(I23d), 
		.I24d(I24d), 
		.I25d(I25d), 
		.I31d(I31d), 
		.I32d(I32d), 
		.I33d(I33d), 
		.I34d(I34d), 
		.I35d(I35d), 
		.I41d(I41d), 
		.I42d(I42d), 
		.I43d(I43d), 
		.I44d(I44d), 
		.I45d(I45d), 
		.I51d(I51d), 
		.I52d(I52d), 
		.I53d(I53d), 
		.I54d(I54d), 
		.I55d(I55d)
	);

always #100 clk = ~clk;

	begin
		clk = 0;
		reset=0;
		
		#50;
		address = 5'd0;
		
		#200;
		address = 5'd1;
		
		#200;
		address = 5'd2;
		
		#200;
		address = 5'd3;
		
		#200;
		address = 5'd4;
		
		#200;
		address = 5'd5;
		
		#200;
		address = 5'd6;
		
		#200;
		address = 5'd7;
		
		#200;
		address = 5'd8;
		#200;
		address = 5'd9;
		#200;
		address = 5'd10;
		#200;
		address = 5'd11;
		#200;
		address = 5'd12;
		
		#200;
		address = 5'd13;
		
		#200;
		address = 5'd14;
		#200;
		address = 5'd15;
		#200;
		address = 5'd16;
		#200;
		address = 5'd17;
		#200;
		address = 5'd18;
		#200;
		address = 5'd19;
		#200;
		address = 5'd20;
		#200;
		address = 5'd21;
		#200;
		address = 5'd22;
		#200;
		address = 5'd23;
		#200;
		address = 5'd24;
		#200;
		address = 5'd25;
		#200;
		reset=1'b1;
		#200;
		
		reset=1'b0;
		
	end
endmodule

