`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 02:45:25
// Design Name: 
// Module Name: sram
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


module sram(clk,CSram,Direc,Datain,LeerMem,Dataout,EscrMem);
    input clk;
    input CSram;//bit
    input [7:0] Direc;
    input [31:0] Datain;
    input LeerMem;
    output wire [31:0] Dataout;
    input EscrMem;//bit
    
reg [31:0] RAM [0:255];

assign Dataout = LeerMem ? RAM[Direc]:32'b0;

always @ (posedge clk) 
begin

if(CSram==1'b1)
begin
    if (EscrMem==1'b1)
        begin
            RAM[Direc] = Datain;
        end  

end
end
endmodule
