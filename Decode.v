`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 19:50:40
// Design Name: 
// Module Name: Decode
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


module Decode(clk,data1R,data2R,data1D,data2D,instru2016,instru2016D,instru1511,instru1511D,oinstru,oinstruD,sum2sumOF,sum2sumOF_D,FDecode);
        
        input clk;
        input [31:0] data1R;
        input [31:0] data2R;
        input [4:0]  instru2016;
        input [4:0]  instru1511;
        input [31:0] oinstru;
        input [31:0] sum2sumOF;
        
        output reg [31:0] data1D;
        output reg [31:0] data2D;
        output reg [4:0]  instru2016D;
        output reg [4:0]  instru1511D;
        output reg [31:0] oinstruD;
        output reg [31:0] sum2sumOF_D;
        output wire FDecode;
        
assign FDecode = clk ? 1'b1 : 1'b0;
        
always @(posedge clk)
  begin
  
  data1D = data1R;
  data2D = data2R;
  instru2016D = instru2016;
  instru1511D = instru1511; 
  oinstruD = oinstru;
  sum2sumOF_D = sum2sumOF;
  
  end
    
endmodule
