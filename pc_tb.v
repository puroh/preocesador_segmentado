`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2017 12:17:10
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
 reg clk;
 reg SaltoCond;
 reg [31:0] extSigno;
 reg oZero;
 reg reset;
 //salida
 
 wire  [31:0] direinstru;
 
 pc uut(
    .clk(clk),
    .SaltoCond(SaltoCond),
    .extSigno(extSigno),
    .oZero(oZero),
	.direinstru(direinstru),  
	.reset(reset) 
    
 
 );
    always 
    begin        
        clk=1'b1;
        #50
        clk=1'b0;
        #50;
    end
    
    initial begin
        //initial inputs
       reset = 1'b1;
       extSigno = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
       oZero=1'b0;
       SaltoCond = 1'b0;
       #100
       reset = 1'b0;
       
       #100//200
       oZero=1'b0;
       SaltoCond = 1'b0;
       extSigno=32'b0000_0000_0000_0000_0000_0000_0000_0001;
       //wait 100ns
       
       #100 //300
       oZero = 1'b1;
       SaltoCond=1'b0;
       extSigno=32'b0000_0000_0000_0000_0000_0000_0000_0001;
       
       #100 //400
       oZero=1'b0;
       SaltoCond=1'b1;
       extSigno=32'b0000_0000_0000_0000_0000_0000_0000_0001;
       
       #100//500
       oZero=1'b1;
       SaltoCond=1'b1;
       extSigno=32'b0000_0000_0000_0000_0000_0000_0000_0001;
       
       #100//600
       oZero=1'b1;
       SaltoCond=1'b1;
       extSigno=32'b0000_0000_0000_0000_0000_0000_0000_0001; 
       #100;
            
        
    end
endmodule
