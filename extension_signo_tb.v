`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2017 16:07:16
// Design Name: 
// Module Name: extencion_signo_tb
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


module extension_signo_tb;
    
    reg [15:0] instr;
    wire [31:0] oinstr;
    
    extencion_signo uut (
        .instr(instr),
        .oinstr(oinstr)
    );
    
    initial begin 
    
    instr = 16'b1111111111111111;
    #100;
    
    instr = 16'b0111111111111111;
    #100;
    
    instr = 16'b1111111111111111;
    #100;
    
    instr = 16'b0111111111111111;
    #100;
    
    end
    
endmodule
