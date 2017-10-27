`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2017 19:53:13
// Design Name: 
// Module Name: control_tb
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


module control_tb();
    reg [5:0] instru;
    reg clk;
    //salidas
    wire RegDest;
    wire SaltoCond;
    wire LeerMem;
    wire MemaReg;
    wire [1:0] ALUOp;
    wire EscrMem;
    wire FuenteALU;
    wire EscrReg;
    
    control uut(
        .instru(instru),
        .clk(clk),
        .RegDest(RegDest),
        .SaltoCond(SaltoCond),
        .LeerMem(LeerMem),
        .MemaReg(MemaReg),
        .ALUOp(ALUOp),
        .EscrMem(EscrMem),
        .FuenteALU(FuenteALU),
        .EscrReg(EscrReg)
        );
        
        always 
        begin
            clk=1'b1;
            #50
            clk=1'b0;
            #50;
         end
   initial begin
           instru=6'b000000;
           #100
		   instru=6'b000000;
           #100
           instru=6'b100011;
           #100
           instru=6'b101011;
           #100
           instru=6'b000100;
           #100;
   
   end     
    
        
    
endmodule
