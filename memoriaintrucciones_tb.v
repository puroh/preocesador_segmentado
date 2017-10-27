`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2017 15:38:23
// Design Name: 
// Module Name: memoria_instrucciones_tb
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


module memoriaintrucciones_tb;

   reg [5:0] direinstru;
   wire [31:0] instru;
   reg clk;
	reg reset;
    
memoriaintrucciones uut(
    .direinstru(direinstru),
    .instru(instru),
    .clk(clk)
 );

always begin 

clk = 1'b1;
#50;
clk = 1'b0;
#50;

end
    
initial begin
reset = 1'b1;
#100
reset = 1'b0;
#100
direinstru = 5'b00000;
#100;
direinstru = 5'b00001;
#100;
direinstru = 5'b00010;
#100;
direinstru = 5'b00011;


end

endmodule
