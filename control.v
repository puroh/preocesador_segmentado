`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2017 12:13:15
// Design Name: 
// Module Name: control
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


module control(instru,clk,Control);//Saltoincond,RegDest,SaltoCond,LeerMem,MemaReg,ALUOp,EscrMem,FuenteALU,EscrReg);

input [5:0]instru;
input clk;
//output wire RegDest;
//output wire SaltoCond;
//output wire LeerMem;
//output wire MemaReg;
//output wire [1:0]ALUOp;
//output wire EscrMem;
//output wire FuenteALU;
//output wire EscrReg;
//output wire Saltoincond;

output wire [9:0] Control;

reg [9:0]aux;


// control1 control(.aux(aux),
//                .clk(clk), 
//                .Control(Control)       
//                );


always @ (*)
begin 
    case(instru)
        6'b000_000: aux=10'b0100_100_010;
        6'b100_011: aux=10'b00_1111_0000;//lectura
        6'b101_011: aux=10'b0x1x001000;//carga
        6'b000_100: aux=10'b0x0x000101;
        6'b111_111: aux=10'b00_1010_0000;//not
        6'b111_110: aux=10'b00_0000_0101;//
        default:  aux=10'b00_1010_0000;        
    endcase

end

assign Control = aux;

//assign Saltoincond  = Control[9];
//assign RegDest      = Control[8];
//assign FuenteALU    = Control[7];//
//assign MemaReg      = Control[6];
//assign EscrReg      = Control[5];
//assign LeerMem      = Control[4];//
//assign EscrMem      = Control[3];
//assign SaltoCond    = Control[2];
//assign ALUOp        = Control[1:0];



endmodule
