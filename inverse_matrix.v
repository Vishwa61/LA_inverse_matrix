`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:		Vishwa Joshi (201501041) 
// 
// Create Date:    19:05:58 10/07/2016 
// Design Name: 	 
// Module Name:    inverse_matrix 
// Project Name: 	 Inverse of the matrix
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module inverse_matrix(clk, reset, data_out, address, I11,I12,I13,I14,I15,I21,I22,I23,I24,I25,I31,I32,I33,I34,I35,I41,I42,I43,I44,I45,I51,I52,I53,I54,I55,I11d,I12d,I13d,I14d,I15d,I21d,I22d,I23d,I24d,I25d,I31d,I32d,I33d,I34d,I35d,I41d,I42d,I43d,I44d,I45d,I51d,I52d,I53d,I54d,I55d);

output [31:0] I11d,I12d,I13d,I14d,I15d;
output [31:0] I21d,I22d,I23d,I24d,I25d;
output [31:0] I31d,I32d,I33d,I34d,I35d;
output [31:0] I41d,I42d,I43d,I44d,I45d;
output [31:0] I51d,I52d,I53d,I54d,I55d;

output reg [31:0] I11,I12,I13,I14,I15;
output reg [31:0] I21,I22,I23,I24,I25;
output reg [31:0] I31,I32,I33,I34,I35;
output reg [31:0] I41,I42,I43,I44,I45;
output reg [31:0] I51,I52,I53,I54,I55;

reg [31:0] matrix[0:25];
reg [31:0] inverse[0:24];

output [31:0] data_out;

input reset;
input [4:0] address;

reg [31:0] in11,in12,in13,in14,in15;
reg [31:0] in21,in22,in23,in24,in25;
reg [31:0] in31,in32,in33,in34,in35;
reg [31:0] in41,in42,in43,in44,in45;
reg [31:0] in51,in52,in53,in54,in55;
input clk;


reg [31:0] I11t = 32'd1;
reg [31:0] I12t = 32'd0;
reg [31:0] I13t = 32'd0;
reg [31:0] I14t = 32'd0;
reg [31:0] I15t = 32'd0;

reg [31:0] I21t = 32'd0;
reg [31:0] I22t = 32'd1;
reg [31:0] I23t = 32'd0;
reg [31:0] I24t = 32'd0;
reg [31:0] I25t = 32'd0;

reg [31:0] I31t = 32'd0;
reg [31:0] I32t = 32'd0;
reg [31:0] I33t = 32'd1;
reg [31:0] I34t = 32'd0;
reg [31:0] I35t = 32'd0;

reg [31:0] I41t = 32'd0;
reg [31:0] I42t = 32'd0;
reg [31:0] I43t = 32'd0;
reg [31:0] I44t = 32'd1;
reg [31:0] I45t = 32'd0;

reg [31:0] I51t = 32'd0;
reg [31:0] I52t = 32'd0;
reg [31:0] I53t = 32'd0;
reg [31:0] I54t = 32'd0;
reg [31:0] I55t = 32'd1;

reg [31:0] temp11,temp12,temp13,temp14,temp15,temp21,temp22,temp23,temp24,temp25,temp31,temp32,temp33,temp34,temp35,temp41,temp42,temp43,temp44,temp45,temp51,temp52,temp53t,temp54t,temp55t;

reg [31:0] x;
reg [31:0] y;

matrix_ROM set_value (
  .clka(clk), // input clka
  .addra(address), // input [4 : 0] addra
  .douta(data_out) // output [31 : 0] douta
);


always@(posedge clk)
begin

if(reset==1'b0)
begin
	matrix[address] <= data_out;
end

else
begin

in11 = matrix[1];
in12 = matrix[2];
in13 = matrix[3];
in14 = matrix[4];
in15 = matrix[5];

in21 = matrix[6];
in22 = matrix[7];
in23 = matrix[8];
in24 = matrix[9];
in25 = matrix[10];

in31 = matrix[11];
in32= matrix[12];
in33= matrix[13];
in34 = matrix[14];
in35 = matrix[15];

in41 = matrix[16];
in42 =  matrix[17];
in43 = matrix[18];
in44 = matrix[19];
in45 = matrix[20];

in51 = matrix[21];
in52 = matrix[22];
in53 = matrix[23];
in54 = matrix[24];
in55 = matrix[25];

temp11 = (in11 > 0 ? in11 : (~in11+32'd1));
temp12 = (in12 > 0 ? in12 : (~in12+32'd1));
temp13 = (in13 > 0 ? in13 : (~in13+32'd1));
temp14 = (in14 > 0 ? in14 : (~in14+32'd1));
temp15 = (in15 > 0 ? in15 : (~in15+32'd1));

temp21 = (in21 > 0 ? in21 : (~in21 + 32'd1));
temp22 = (in22 > 0 ? in22 : (~in22 + 32'd1));
temp23 = (in23 > 0 ? in23 : (~in23 + 32'd1));
temp24 = (in24 > 0 ? in24 : (~in24 + 32'd1));
temp25 = (in25 > 0 ? in25 : (~in25 + 32'd1));

temp31 = (in31 > 0 ? in31 : (~in31 + 32'd1));
temp32 = (in32 > 0 ? in32 : (~in32 + 32'd1));
temp33 = (in33 > 0 ? in33 : (~in33 + 32'd1));
temp34 = (in34 > 0 ? in34 : (~in34 + 32'd1));
temp35 = (in35 > 0 ? in35 : (~in35 + 32'd1));

temp41 = (in41 > 0 ? in41 : (~in41+32'd1));
temp42 = (in42 > 0 ? in42 : (~in42+32'd1));
temp43 = (in43 > 0 ? in43 : (~in43+32'd1));
temp44 = (in44 > 0 ? in44 : (~in44+32'd1));
temp45 = (in45 > 0 ? in45 : (~in45+32'd1));

temp51 = (in51 > 0 ? in51 : (~in51+32'd1));
temp52 = (in52 > 0 ? in52 : (~in52+32'd1));
temp53t = (in53 > 0 ? in53 : (~in53+32'd1));
temp54t = (in54 > 0 ? in54 : (~in54+32'd1));
temp55t = (in55 > 0 ? in55 : (~in55+32'd1));



x = temp11;
y = temp21;

temp21 = x*temp21 - y*temp11;
temp22 = x*temp22 - y*temp12;
temp23 = x*temp23 - y*temp13;
temp24 = x*temp24 - y*temp14;
temp25 = x*temp25 - y*temp15;
I21t = x*I21t - y*I11t;
I22t = x*I22t - y*I12t;
I23t = x*I23t - y*I13t;
I24t = x*I24t - y*I14t;
I25t = x*I25t - y*I15t;

x = temp11;
y = temp31;

temp31 = x*temp31 - y*temp11;
temp32 = x*temp32 - y*temp12;
temp33 = x*temp33 - y*temp13;
temp34 = x*temp34 - y*temp14;
temp35 = x*temp35 - y*temp15;
I31t = x*I31t - y*I11t;
I32t = x*I32t - y*I12t;
I33t = x*I33t - y*I13t;
I34t = x*I34t - y*I14t;
I35t = x*I35t - y*I15t;

x = temp11;
y = temp41;

temp41 = x*temp41 - y*temp11;
temp42 = x*temp42 - y*temp12;
temp43 = x*temp43 - y*temp13;
temp44 = x*temp44 - y*temp14;
temp45 = x*temp45 - y*temp15;
I41t = x*I41t - y*I11t;
I42t = x*I42t - y*I12t;
I43t = x*I43t - y*I13t;
I44t = x*I44t - y*I14t;
I45t = x*I45t - y*I15t;

x = temp11;
y = temp51;

temp51 = x*temp51 - y*temp11;
temp52 = x*temp52 - y*temp12;
temp53t = x*temp53t - y*temp13;
temp54t = x*temp54t - y*temp14;
temp55t = x*temp55t - y*temp15;
I51t = x*I51t - y*I11t;
I52t = x*I52t - y*I12t;
I53t = x*I53t - y*I13t;
I54t = x*I54t - y*I14t;
I55t = x*I55t - y*I15t;


x = temp22;
y = temp12;

temp11 = x*temp11 - y*temp21;
temp12 = x*temp12 - y*temp22;
temp13 = x*temp13 - y*temp23;
temp14 = x*temp14 - y*temp24;
temp15 = x*temp15 - y*temp25;
I11t = x*I11t - y*I21t;
I12t = x*I12t - y*I22t;
I13t = x*I13t - y*I23t;
I14t = x*I14t - y*I24t;
I15t = x*I15t - y*I25t;

x = temp22;
y = temp32;

temp31 = x*temp31 - y*temp21;
temp32 = x*temp32 - y*temp22;
temp33 = x*temp33 - y*temp23;
temp34 = x*temp34 - y*temp24;
temp35 = x*temp35 - y*temp25;
I31t = x*I31t - y*I21t;
I32t = x*I32t - y*I22t;
I33t = x*I33t - y*I23t;
I34t = x*I34t - y*I24t;
I35t = x*I35t - y*I25t;

x = temp22;
y = temp42;

temp41 = x*temp41 - y*temp21;
temp42 = x*temp42 - y*temp22;
temp43 = x*temp43 - y*temp23;
temp44 = x*temp44 - y*temp24;
temp45 = x*temp45 - y*temp25;
I41t = x*I41t - y*I21t;
I42t = x*I42t - y*I22t;
I43t = x*I43t - y*I23t;
I44t = x*I44t - y*I24t;
I45t = x*I45t - y*I25t;

x = temp22;
y = temp52;

temp51 = x*temp51 - y*temp21;
temp52 = x*temp52 - y*temp22;
temp53t = x*temp53t - y*temp23;
temp54t = x*temp54t - y*temp24;
temp55t = x*temp55t - y*temp25;
I51t = x*I51t - y*I21t;
I52t = x*I52t - y*I22t;
I53t = x*I53t - y*I23t;
I54t = x*I54t - y*I24t;
I55t = x*I55t - y*I25t;


x = temp33;
y = temp13;

temp11 = x*temp11 - y*temp31;
temp12 = x*temp12 - y*temp32;
temp13 = x*temp13 - y*temp33;
temp14 = x*temp14 - y*temp34;
temp15 = x*temp15 - y*temp35;
I11t = x*I11t - y*I31t;
I12t = x*I12t - y*I32t;
I13t = x*I13t - y*I33t;
I14t = x*I14t - y*I34t;
I15t = x*I15t - y*I35t;

x = temp33;
y = temp23;

temp21 = x*temp21 - y*temp31;
temp22 = x*temp22 - y*temp32;
temp23 = x*temp23 - y*temp33;
temp24 = x*temp24 - y*temp34;
temp25 = x*temp25 - y*temp35;
I21t = x*I21t - y*I31t;
I22t = x*I22t - y*I32t;
I23t = x*I23t - y*I33t;
I24t = x*I24t - y*I34t;
I25t = x*I25t - y*I35t;

x = temp33;
y = temp43;

temp41 = x*temp41 - y*temp31;
temp42 = x*temp42 - y*temp32;
temp43 = x*temp43 - y*temp33;
temp44 = x*temp44 - y*temp34;
temp45 = x*temp45 - y*temp35;
I41t = x*I41t - y*I31t;
I42t = x*I42t - y*I32t;
I43t = x*I43t - y*I33t;
I44t = x*I44t - y*I34t;
I45t = x*I45t - y*I35t;

x = temp33;
y = temp53t;

temp51 = x*temp51 - y*temp31;
temp52 = x*temp52 - y*temp32;
temp53t = x*temp53t - y*temp33;
temp54t = x*temp54t - y*temp34;
temp55t = x*temp55t - y*temp35;
I51t = x*I51t - y*I31t;
I52t = x*I52t - y*I32t;
I53t = x*I53t - y*I33t;
I54t = x*I54t - y*I34t;
I55t = x*I55t - y*I35t;


x = temp44;
y = temp14;

temp11 = x*temp11 - y*temp41;
temp12 = x*temp12 - y*temp42;
temp13 = x*temp13 - y*temp43;
temp14 = x*temp14 - y*temp44;
temp15 = x*temp15 - y*temp45;
I11t = x*I11t - y*I41t;
I12t = x*I12t - y*I42t;
I13t = x*I13t - y*I43t;
I14t = x*I14t - y*I44t;
I15t = x*I15t - y*I45t;

x = temp44;
y = temp24;

temp21 = x*temp21 - y*temp41;
temp22 = x*temp22 - y*temp42;
temp23 = x*temp23 - y*temp43;
temp24 = x*temp24 - y*temp44;
temp25 = x*temp25 - y*temp45;
I21t = x*I21t - y*I41t;
I22t = x*I22t - y*I42t;
I23t = x*I23t - y*I43t;
I24t = x*I24t - y*I44t;
I25t = x*I25t - y*I45t;

x = temp44;
y = temp34;

temp31 = x*temp31 - y*temp41;
temp32 = x*temp32 - y*temp42;
temp33 = x*temp33 - y*temp43;
temp34 = x*temp34 - y*temp44;
temp35 = x*temp35 - y*temp45;
I31t = x*I31t - y*I41t;
I32t = x*I32t - y*I42t;
I33t = x*I33t - y*I43t;
I34t = x*I34t - y*I44t;
I35t = x*I35t - y*I45t;

x = temp44;
y = temp54t;

temp51 = x*temp51 - y*temp41;
temp52 = x*temp52 - y*temp42;
temp53t = x*temp53t - y*temp43;
temp54t = x*temp54t - y*temp44;
temp55t = x*temp55t - y*temp45;
I51t = x*I51t - y*I41t;
I52t = x*I52t - y*I42t;
I53t = x*I53t - y*I43t;
I54t = x*I54t - y*I44t;
I55t = x*I55t - y*I45t;


x = temp55t;
y = temp15;

temp11 = x*temp11 - y*temp51;
temp12 = x*temp12 - y*temp52;
temp13 = x*temp13 - y*temp53t;
temp14 = x*temp14 - y*temp54t;
temp15 = x*temp15 - y*temp55t;
I11t = x*I11t - y*I51t;
I12t = x*I12t - y*I52t;
I13t = x*I13t - y*I53t;
I14t = x*I14t - y*I54t;
I15t = x*I15t - y*I55t;

x = temp55t;
y = temp25;

temp21 = x*temp21 - y*temp51;
temp22 = x*temp22 - y*temp52;
temp23 = x*temp23 - y*temp53t;
temp24 = x*temp24 - y*temp54t;
temp25 = x*temp25 - y*temp55t;
I21t = x*I21t - y*I51t;
I22t = x*I22t - y*I52t;
I23t = x*I23t - y*I53t;
I24t = x*I24t - y*I54t;
I25t = x*I25t - y*I55t;

x = temp55t;
y = temp35;

temp31 = x*temp31 - y*temp51;
temp32 = x*temp32 - y*temp52;
temp33 = x*temp33 - y*temp53t;
temp34 = x*temp34 - y*temp54t;
temp35 = x*temp35 - y*temp55t;
I31t = x*I31t - y*I51t;
I32t = x*I32t - y*I52t;
I33t = x*I33t - y*I53t;
I34t = x*I34t - y*I54t;
I35t = x*I35t - y*I55t;

x = temp55t;
y = temp45;

temp41 = x*temp41 - y*temp51;
temp42 = x*temp42 - y*temp52;
temp43 = x*temp43 - y*temp53t;
temp44 = x*temp44 - y*temp54t;
temp45 = x*temp45 - y*temp55t;
I41t = x*I41t - y*I51t;
I42t = x*I42t - y*I52t;
I43t = x*I43t - y*I53t;
I44t = x*I44t - y*I54t;
I45t = x*I45t - y*I55t;




if(temp11==32'd0 || temp22 == 32'd0 || temp33 == 32'd0 || temp44==32'd0 || temp55t==32'd0)
begin
	I11=32'dx;
	I22=32'dx;
	I33=32'dx;
	I44=32'dx;
	I55=32'dx;
end

else
begin
	I11 = I11t;
	I12 = I12t;
	I13 = I13t;
	I14 = I14t;
	I15 = I15t;

	I21 = I21t;
	I22 = I22t;
	I23 = I23t;
	I24 = I24t;
	I25 = I25t;

	I31 = I31t;
	I32 = I32t;
	I33 = I33t;
	I34 = I34t;
	I35 = I35t;

	I41 = I41t;
	I42 = I42t;
	I43 = I43t;
	I44 = I44t;
	I45 = I45t;

	I51 = I51t;
	I52 = I52t;
	I53 = I53t;
	I54 = I54t;
	I55 = I55t;
end


inverse[0] = I11;
inverse[1] = I12;
inverse[2] = I13;
inverse[3] = I14;
inverse[4] = I15;

inverse[5] = I21;
inverse[6] = I22;
inverse[7] = I23;
inverse[8] = I24;
inverse[9] = I25;

inverse[10] = I31;
inverse[11] = I32;
inverse[12] = I33;
inverse[13] = I34;
inverse[14] = I35;

inverse[15] = I41;
inverse[16] = I42;
inverse[17] = I43;
inverse[18] = I44;
inverse[19] = I45;

inverse[20] = I51;
inverse[21] = I52;
inverse[22] = I53;
inverse[23] = I54;
inverse[24] = I55;

end

end


wire [31:0] I11dt,I12dt,I13dt,I14dt,I15dt;
wire [31:0] I21dt,I22dt,I23dt,I24dt,I25dt;
wire [31:0] I31dt,I32dt,I33dt,I34dt,I35dt;
wire [31:0] I41dt,I42dt,I43dt,I44dt,I45dt;
wire [31:0] I51dt,I52dt,I53dt,I54dt,I55dt;

assign I11d = I11;
assign I12d = I12;
assign I13d = I13;
assign I14d = I14;
assign I15d = I15;

assign I21d = I21;
assign I22d = I22;
assign I23d = I23;
assign I24d = I24;
assign I25d = I25;

assign I31d = I31;
assign I32d = I32;
assign I33d = I33;
assign I34d = I34;
assign I35d = I35;

assign I41d = I41;
assign I42d = I42;
assign I43d = I43;
assign I44d = I44;
assign I45d = I45;

assign I51d = I51;
assign I52d = I52;
assign I53d = I53;
assign I54d = I54;
assign I55d = I55;

wire [31:0] a,b,c,d,e;

assign a = temp11;
assign b = temp22;
assign c = temp33;
assign d = temp44;
assign e = temp55t;


assign I11d = I11dt;
assign I12d = I12dt;
assign I13d = I13dt;
assign I14d = I14dt;
assign I15d = I15dt;

assign I21d = I21dt;
assign I22d = I22dt;
assign I23d = I23dt;
assign I24d = I24dt;
assign I25d = I25dt;

assign I31d = I31dt;
assign I32d = I32dt;
assign I33d = I33dt;
assign I34d = I34dt;
assign I35d = I35dt;

assign I41d = I41dt;
assign I42d = I42dt;
assign I43d = I43dt;
assign I44d = I44dt;
assign I45d = I45dt;

assign I51d = I51dt;
assign I52d = I52dt;
assign I53d = I53dt;
assign I54d = I54dt;
assign I55d = I55dt;


endmodule

