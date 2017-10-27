`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2017 16:26:18
// Design Name: 
// Module Name: procesador_monociclo
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


module procesador_segmentado(
clk,reset

);

input wire clk;
 reg [5:0] direinstru;
 wire [31:0] instru;
 
 wire RegDest;
 wire SaltoCond;
 wire Saltoincond;
 wire LeerMem;
 wire MemaReg;
 wire [1:0]ALUOp;
 wire  EscrMem;
 wire FuenteALU;
 wire EscrReg;
 wire [31:0] data1;
 wire [31:0] data2;
 wire [31:0] datain;
 wire [31:0] oinstru;
 wire [2:0] ctrl;
 wire oCarry;
 wire oZero;
 wire [31:0] out;
 wire [31:0] Dataout;
 
 //Para los mux
 wire [4:0] RegEscr1;
 wire [31:0] data21;
 wire [31:0] dataEscr;
 
 //para pc
  wire [31:0] ext2;
  wire [31:0] sum2sum;
  wire [31:0] salSum2;
  wire FuentePC;
  wire [31:0] toPC;
  wire [31:0]direinstrux;
 input wire reset;
 parameter varCuatro=3'b100;
 
 wire [9:0] Control;
 wire [9:0] Controls1;
 wire [9:0] Controls2;
 
 
 memoriaintrucciones memoriainstru(
            .direinstru(direinstrux),
            .instru(instru),
			.clk(clk),
			.reset(reset)			
             );
 
 control control(.instru(instru[31:26]),
                 .clk(clk),
                 .Control(Control)         
                 );
control1 control1(.Control(Control),
                .clk(clk),
                .RegDest(RegDest),
                .ALUOp(ALUOp),
                .FuenteALU(FuenteALU),
                .Controls1(Controls1)      
                );
control2 control2(.Control(Controls1),
                  .clk(clk),
                  .SaltoCond(SaltoCond),
                  .EscrMem(EscrMem),
                  .Controls2(Controls2)         
                  );
control3 control3(.Control(Controls2),
                  .clk(clk),
                  .MemaReg(MemaReg),
                  .EscrReg(EscrReg)        
                  );
 
 bankregister registros(.RegLe1(instru[25:21]),
                        .RegLe2(instru[20:16]),
                        .RegEscr(RegEscr1), //mux
                        .EscrReg(EscrReg),
                        .clk(clk),
                        .datain(dataEscr), // Mux
                        .data1(data1),
                        .data2(data2),
                        .reset(reset)           
                        );
                        
 extension_signo extension(.instr(instru[15:0]),
                           .oinstr(oinstru),
                           .clk(clk)                        
                           ); 
   
 alu32 alu(.data1(data1),
           .data2(data21), //mux
           .ctrl(ctrl),
           .clk(clk),
           .oCarry(oCarry),
           .oZero(oZero),
           .out(out)   
           );
 
 memoria_datos datos(.clk(clk),
                     .EscrMem(EscrMem),
                     .Direc(out), 
                     .Datain(data2),
                     .LeerMem(LeerMem),
                     .Dataout(Dataout)
                     );
   pc pro_counter(
           .SaltoCond(SaltoCond),
			.Saltoincond(Saltoincond),
            .extSigno(oinstru),
            .oZero(oZero),
            .direinstru(direinstrux),
            .clk(clk),   
            .reset(reset),
			.instru(instru)           
   );
   
   controlALU contrALU(
        .ALUop(ALUOp),
        .instru(instru[5:0]),
        .clk(clk),
        .contALU(ctrl)
        
        );


assign RegEscr1 = RegDest ? instru[15:11]: instru[20:16];
assign data21 = FuenteALU ? oinstru : data2;                         
assign dataEscr = MemaReg ? Dataout : out;

endmodule
