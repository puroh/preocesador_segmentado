`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 19:03:19
// Design Name: 
// Module Name: Fetch
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


module Fetch(clk,instru,instruD,sum2sumIF,sum2sumOF,FFetch);
       
       input clk;
       input [31:0] instru; 
       input [31:0] sum2sumIF;
       output reg [31:0] instruD;
       output reg [31:0] sum2sumOF;
       output wire FFetch;
  

assign FFetch = clk? 1'b1:1'b0; 

always @(posedge clk)
begin
    
    instruD   = instru;
    sum2sumOF = sum2sumIF;   
    
end
       
        
endmodule
