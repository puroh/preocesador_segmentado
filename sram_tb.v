`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2017 14:09:30
// Design Name: 
// Module Name: sram_tb
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


module sram_tb();
reg clk;
reg CSram;
reg [7:0] Direc;
reg [31:0] Datain;
reg LeerMem;
reg EscrMem;

wire [31:0] Dataout;


sram uut(
	.clk(clk),
	.CSram(CSram),
	.Direc(Direc),
	.Datain(Datain),
	.LeerMem(LeerMem),
	.EscrMem(EscrMem),
	.Dataout(Dataout)
	
);

always begin
	clk=1'b1;
	#50;
	clk=1'b0;
	#50;
end

initial begin
	CSram=1'b1;
	EscrMem	=	1'b1;
    LeerMem	=	1'b0;
	Direc 	=	8'b_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;
	#100;
	
	CSram=1'b1;
	EscrMem	=	1'b0;
    LeerMem	=	1'b1;
	Direc 	=	8'b_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;
	#100;

	CSram=1'b1;
	EscrMem	=	1'b1;
    LeerMem	=	1'b0;
	Direc 	=	8'b_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0011;
	#100;

	CSram=1'b1;
	EscrMem	=	1'b0;
    LeerMem	=	1'b1;
	Direc 	=	8'b_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;
	#100;

	CSram=1'b1;
	EscrMem	=	1'b1;
    LeerMem	=	1'b0;
	Direc 	=	8'b_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;
	#100;
	

end

endmodule
