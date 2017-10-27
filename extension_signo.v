`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2017 13:09:12
// Design Name: 
// Module Name: extencion_signo
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


module extension_signo(clk,instr,oinstr);

    input [15:0] instr;
    input clk;
    output reg [31:0] oinstr;
always @(*)
begin
 oinstr = instr[15] ? ({16'b1111111111111111,instr[15:0]}) :  ({16'b0000000000000000,instr[15:0]});  
    end
    
endmodule
