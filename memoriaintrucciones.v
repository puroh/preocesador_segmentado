`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2017 12:05:16
// Design Name: 
// Module Name: memoria_intrucciones
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
//////////////////////////////////////////////////////////////////////////////


module memoriaintrucciones(direinstru,instru,clk,reset);

input [31:0] direinstru;
input clk;
input reset;
//salida
output wire [31:0] instru;


reg [31:0] registro_rom [31:0];


assign instru = registro_rom[direinstru];
 
always @ (*)
begin

if (reset == 1)
begin   
        registro_rom[0] = 32'b1010_1100_0010_0011__0000_0000_0000_0000;//carga un 9 en sram1 posicion 4
        registro_rom[1] = 32'b1000_1100_0011_1111__0000_0000_0000_0000; // Lee el dato anterior guardado(sram1 pos 4)
        registro_rom[2] = 32'b1111_1000_0000_0000__0000_0000_0000_0010;//salto -2
        //registro_rom[1] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not
        registro_rom[3] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not
        registro_rom[4] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not
        registro_rom[5] = 32'b1000_1100_0011_1111__0000_0000_0000_0000; // Lee el dato anterior guardado(sram1 pos 4)
        registro_rom[6] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not
        registro_rom[7] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not
        registro_rom[8] = 32'b1111_1100_0000_0000__0000_0000_0000_0000; //not      
        registro_rom[9] = 32'b1111_1000_0000_0000__0000_0000_0000_0010;//salto +3
        
        /*registro_rom[8] = 32'b1000_1100_0000_0001__0001_1000_0110_0000; //hace una suma         
        
        registro_rom[9] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[] = 32'b1010_1111_1111_1111__0000_0000_0000_0000;//carga un 9 en sram1 posicion 32
        registro_rom[7] = 32'b1000_1111_1111_1110__0000_0000_0000_0000; // Lee el dato anterior guardado(sram1 pos 4)
        
        registro_rom[8] = 32'b1000_1100_0000_0001__0001_1000_0110_0000; //hace una suma  
        registro_rom[9] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        registro_rom[10] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[11] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[12] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[13] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[14] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[15] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[16] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[17] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        registro_rom[18] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[19] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[20] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[21] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[22] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[23] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[24] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[25] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        registro_rom[26] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[27] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[28] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[29] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[30] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        registro_rom[31] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;*/
end
else
        begin
        //registro_rom[0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
//        registro_rom[1] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[2] = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
//        registro_rom[3] = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
//        registro_rom[4] = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
//        registro_rom[5] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[6] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[7] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[8] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[9] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
//        registro_rom[10] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[11] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[12] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[13] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[14] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[15] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[16] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[17] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
//        registro_rom[18] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[19] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[20] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[21] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[22] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[23] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[24] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[25] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
//        registro_rom[26] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[27] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[28] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[29] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[30] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//        registro_rom[31] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
end     
end 
 
endmodule
