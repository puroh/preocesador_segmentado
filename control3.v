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


module control3(Control,clk,MemaReg,EscrReg);

    input wire [9:0] Control;
    input clk;
    
    //output wire RegDest;
    //output wire SaltoCond;
    //output wire LeerMem;
    output reg MemaReg;
    //output wire [1:0]ALUOp;
    //output reg EscrMem;
    //output wire FuenteALU;
    output reg EscrReg;
    //output wire Saltoincond;
    

  

always   @(posedge clk)
begin
    
//assign Saltoincond  = Control[9];
//assign RegDest      = Control[8];
//assign FuenteALU    = Control[7];//
MemaReg      = Control[6];
//assign EscrReg      = Control[5];
//assign LeerMem      = Control[4];//
EscrReg      = Control[3];
//assign SaltoCond    = Control[2];
//assign ALUOp        = Control[1:0];    

end     
endmodule
