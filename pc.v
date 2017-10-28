`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 06.10.2017 08:53:47
// Design Name:
// Module Name: pc
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


module pc(
    input  SaltoCond,
	input Saltoincond,
	input [31:0] extSigno, 
	input oZero,
    input clk,
    input reset,
	input [31:0]instru,
	input [31:0] sum2sumin,
	output [31:0] sum2sumout,
    output reg [31:0] direinstru,
	output  [31:0] salSum2out,
	input [31:0] salSum2in
    );
    
    
	wire [31:0] sum2sum;
    wire [31:0] salSum2;
	wire FuentePC; // salida de la and, entrada del mux
	wire [31:0] sal2PC;
	wire [31:0] mux2mux;
	
	//reg Freg;

    
    
    //assign direinstru = reset==1 ? 32'b0000_0000_0000_0000_0000_0000_0000_0000 :sal2PC ;
  
    assign salSum2out =  extSigno + sum2sumin;//{extSigno[29:0],2'b00};
    assign sum2sumout = direinstru +1;
//	assign sum = sum2sumin
    assign sal2PC = mux2mux;//(Saltoincond)? {sum2sumin[31:28],instru[27:0]} : mux2mux;
    assign FuentePC = 1'b0;//SaltoCond & oZero;
	assign mux2mux = FuentePC ? salSum2in : sum2sumout;
	//assign mux2mux1 = FuentePC ? salSum2 : mux2mux;
	//assign Freg =FuentePC;

    //****************************
    //REVISAR SIGUIENTE LINEA
    //assign direinstru= (direinstru==32)? 0 : direinstru;
   /* always @ (*)
        begin 
            if(Freg==1)
                direinstru = salSum2;
        end
   */
   
   assign oZero = reset ? 1'b0:oZero;
   assign SaltoCond = reset ? 1'b0 : SaltoCond;
   
    always @(negedge reset )
    begin
        direinstru = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
       // oZero = 1'b0;
                    
    end
    
    
    always @(posedge clk)
        begin
           // sum2sum= direinstru +1;
           if (reset==1)
              direinstru = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
                
           else

                    direinstru = sal2PC;
       
                
            //FuentePC = SaltoCond & oZero;

    

        /*
            if (FuentePC==1)
                begin
                   mux2mux = salSum2;
                end
                 
            else
				begin
                    mux2mux = sum2sum;          
				end

		
            
                      
            if (direinstru == 255)
                begin
                   sum2sum = 0;
                end
            else
                   sum2sum = direinstru;*/
        end
            
    endmodule
