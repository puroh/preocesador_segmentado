`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 10:51:16
// Design Name: 
// Module Name: controlALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controlALU_tb();
    reg [1:0]ALUop;
    reg [5:0]instru;
    reg clk;
    wire [2:0] contALU;
    
 controlALU uut(
 		.ALUop(ALUop),
		.instru(instru),
		.clk(clk),
		.contALU(contALU)
 );
	always begin

		clk=1'b1;
		#50;
		clk=1'b0;
		#50;

		end

initial begin
	ALUop=2'b00;
	instru=6'bx1x_x1x;
	#100;
	ALUop=2'b00;
	instru=6'b001_101;
	#100;  //200
	ALUop=2'b01;
	instru=6'b111_001;
	#100; //300
    ALUop=2'b10;
    instru=6'b100000;
    #100; //400
    ALUop=2'b10;
    instru=6'b100010;
    #100; //500
    ALUop=2'b10;
    instru=6'b100100;
	#100;
    ALUop=2'b10;
    instru=6'b100101;
	#100;
    ALUop=2'b10;
    instru=6'b101010;
	#100;
    ALUop=2'b11;
    instru=6'b111111;

end
endmodule
