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


module control1(clk,Control,RegDest,ALUOp,FuenteALU,Controls1);

    input [9:0] Control;
    input  clk;
    output reg [9:0] Controls1;
        
    output reg RegDest;
    //output wire SaltoCond;
    //output wire LeerMem;
    //output wire MemaReg;
    output reg [1:0]ALUOp;
    //output wire EscrMem;
    output reg FuenteALU;
    //output wire EscrReg;
    

                                                

always   @(posedge clk)
begin

Controls1 = Control;   
//assign Saltoincond  = Control[9];
RegDest      = Control[8];
FuenteALU    = Control[7];//
//assign MemaReg      = Control[6];
//assign EscrReg      = Control[5];
//assign LeerMem      = Control[4];//
//assign EscrMem      = Control[3];
//assign SaltoCond    = Control[2];
ALUOp        = Control[1:0];
    

    

end     
endmodule
