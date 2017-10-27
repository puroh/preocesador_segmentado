`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2017 19:59:43
// Design Name: 
// Module Name: memoria_datos_tb
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


module memoria_datos_tb();
	reg clk;
    reg EscrMem;
    reg [31:0] Direc;
    reg [31:0] Datain;
    reg LeerMem;
    wire [31:0] Dataout;

	memoria_datos uut(
		.clk(clk),
		.EscrMem(EscrMem),
		.Direc(Direc),
		.Datain(Datain),
		.LeerMem(LeerMem),
		.Dataout(Dataout)
		);

always
	begin
		clk = 1'b1;
        #50;
        clk = 1'b0;
        #50;
	end

initial begin
	EscrMem	=	1'b1;
    LeerMem	=	1'b0;
	Direc 	=	32'b0000_0000_0000_0000__0000_0100_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;

	#100;

	EscrMem	=	1'b1;
    LeerMem	=	1'b0;
	Direc 	=	32'b0000_0000_0000_0000__0000_0000_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0010;


	#100; //200
	
	EscrMem	=	1'b1;
    LeerMem =    1'b0;
    Direc   =    32'b0000_0000_0000_0000__0000_0010_0110_0000;
    Datain  =    32'b0000_0000_0000_0000__0000_0000_0000_0011;


	#100; //300

	EscrMem	=	1'b0;
    LeerMem	=	1'b1;
	Direc 	=	32'b0000_0000_0000_0000__0000_0100_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0001;
	


	#100; //400
	
	EscrMem	=	1'b0;
    LeerMem    =    1'b1;
    Direc     =    32'b0000_0000_0000_0000__0000_0000_0110_0000;
    Datain    =    32'b0000_0000_0000_0000__0000_0000_0000_0010;


	#100;

	EscrMem	=	1'b0;
    LeerMem	=	1'b1;
	Direc 	=	32'b0000_0000_0000_0000__0000_0010_0110_0000;
	Datain	=	32'b0000_0000_0000_0000__0000_0000_0000_0010;



end


    
endmodule
