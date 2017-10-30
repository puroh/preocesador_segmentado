`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 14:37:29
// Design Name: 
// Module Name: control1
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


module control2(reset,Control,clk,SaltoCond,EscrMem,Controls2,LeerMem);

    input wire [9:0] Control;
    input clk;
    output reg [9:0] Controls2;
    input reset;
 
    //output wire RegDest;
    output reg SaltoCond;
    output reg LeerMem;
    //output wire MemaReg;
    //output wire [1:0]ALUOp;
    output reg EscrMem;
    //output wire FuenteALU;
    //output wire EscrReg;
    //output wire Saltoincond;
   
   wire SaltoConda;
	

assign SaltoConda = 1'b0;


always   @(posedge clk)
begin

    if (Control[2] == 1'b1)//Hay que mirar aqui
        begin
        SaltoCond = 1'b1;
       // $display ("Valor variable control[2] %h" , Control[2]);
        end
     else
        SaltoCond=SaltoConda;
end
//SaltoCond = SaltoConda;
always   @(posedge clk)
begin
Controls2 = Control;
//assign Saltoincond  = Control[9];
//assign RegDest      = Control[8];
//assign FuenteALU    = Control[7];//
//assign MemaReg      = Control[6];
//assign EscrReg      = Control[5];
//
EscrMem      = Control[3];
//SaltoCond    = SaltoConda;//Control[2];
//assign ALUOp        = Control[1:0];
LeerMem      = Control[4];
end     
endmodule
