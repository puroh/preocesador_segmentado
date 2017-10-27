`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2017 13:19:42
// Design Name: 
// Module Name: memoria_datos
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


module memoria_datos(clk,EscrMem,Direc,Datain,LeerMem,Dataout);
    input clk;
    input EscrMem;//bit
    input [31:0] Direc;
    input [31:0] Datain;
    input LeerMem;//bit
    output reg [31:0] Dataout;
    


wire CSram1;
wire CSram2;

wire [2:0] CS;

wire [31:0] Dataout1;
wire [31:0] Dataout2;
wire [31:0] Dataout3;
wire CSrom;
 
sram sram1(.clk(clk),
           .CSram(CSram1),
           .Direc(Direc[7:0]),
           .Datain(Datain),
           .LeerMem(LeerMem),
           .Dataout(Dataout1),
           .EscrMem(EscrMem)
           );
sram sram2(.clk(clk),
           .CSram(CSram2),
           .Direc(Direc[7:0]),
           .Datain(Datain),
           .LeerMem(LeerMem),
           .Dataout(Dataout2),
           .EscrMem(EscrMem)
           );

sram ROM(
           .clk(clk),
           .CSram(CSrom),
           .Direc(Direc[7:0]),
           .Datain(Datain),
           .LeerMem(LeerMem),
           .Dataout(Dataout3),
           .EscrMem(EscrMem)
           );




assign CSrom  = (Direc[31:8]==24'b0000_0000_0000_0000_0000_0100) ? 1 : 0 ; 
assign CSram1 = ((Direc[31:8]==24'b0000_0000_0000_0000_0000_0000)|(Direc[31:8]==24'b0000_0000_0000_0000_0000_0001)) ? 1 : 0 ;
assign CSram2 = ((Direc[31:8]==24'b0000_0000_0000_0000_0000_0010)|(Direc[31:8]==24'b0000_0000_0000_0000_0000_0011)) ? 1 : 0 ;
assign CS = {CSrom,CSram1,CSram2};
always @ (*)

begin
    

    case(CS)
        3'b100:Dataout = Dataout3;
        3'b010:Dataout = Dataout1;
        3'b001:Dataout = Dataout2;
    endcase
        
end



endmodule

