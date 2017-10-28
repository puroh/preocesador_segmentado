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
 reg [31:0] direinstru;
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
 
 //Fetch
 wire [31:0] instruD;
 wire [31:0] sum2sumOF;
 wire [31:0] sum2sumIF;
 
 //Decode 
 
 wire [31:0] data1D;
 wire [31:0] data2D;
 wire [4:0] instru2016D;
 wire [4:0] instru1511D;
 wire [31:0] oinstruD;
 wire [31:0] sum2sumOF_D;
 
 //Execute
 
wire [31:0] outE;
wire oZeroD;
wire [31:0] data2D_E;
wire [31:0] RegEscr1E;
wire [31:0] salSum2out;
wire [31:0] salSum2E;

 //Memory

wire [31:0] outE_M;
wire [31:0] DataoutM;
wire [4:0] RegEscr1E_M;

 
 
 memoriaintrucciones memoriainstru(.direinstru(direinstrux),
                                   .instru(instru),
			                       .clk(clk),
			                       .reset(reset)			
                                   );
 
 control control(.instru(instruD[31:26]),
                 .clk(clk),
                 .Control(Control) //Salida        
                 );

 bankregister registros(.RegLe1(instruD[25:21]),
                        .RegLe2(instruD[20:16]),
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
   
 alu32 alu(.data1(data1D),
           .data2(data21), //mux
           .ctrl(ctrl),
           .clk(clk),
           .oCarry(oCarry),
           .oZero(oZero),
           .out(out)   
           );
 
 memoria_datos datos(.clk(clk),
                     .EscrMem(EscrMem),
                     .Direc(outE), 
                     .Datain(data2D_E),
                     .LeerMem(LeerMem),
                     .Dataout(Dataout)
                     );
   pc pro_counter(
            .SaltoCond(SaltoCond),
			.Saltoincond(Saltoincond),
            .extSigno(oinstruD),
            .oZero(oZero),
            .direinstru(direinstrux),
            .clk(clk),   
            .reset(reset),
			.instru(instru),
			.sum2sumin(sum2sumOF_D),
			.sum2sumout(sum2sumIF),
			.salSum2out(salSum2out),
			.salSum2in(salSum2E)           
            );
   
   controlALU contrALU(
        .ALUop(ALUOp),
        .instru(instruD[5:0]),
        .clk(clk),
        .contALU(ctrl)   
        );

//*********Segmentación.**********

    //Control;

control1 control1(.Control(Control),
                .clk(clk),
                .RegDest(RegDest),
                .ALUOp(ALUOp),
                .FuenteALU(FuenteALU),
                .Controls1(Controls1),
                .Saltoincond(Saltoincond)
                //.LeerMem(LeerMem)    
                );
control2 control2(.Control(Controls1),
                  .clk(clk),
                  .SaltoCond(SaltoCond),
                  .EscrMem(EscrMem),
                  .Controls2(Controls2),
                  .LeerMem(LeerMem)        
                  );
control3 control3(.Control(Controls2),
                  .clk(clk),
                  .MemaReg(MemaReg),
                  .EscrReg(EscrReg)        
                  );
 
    //Retrasos de señales;
    
Fetch Fetch(.clk(clk),
            .instru(instru),
            .instruD(instruD),
            .sum2sumIF(sum2sumIF),
            .sum2sumOF(sum2sumOF)
            );
            
Decode Decode(.clk(clk),
              .data1R(data1),
              .data2R(data2),
              .data1D(data1D),
              .data2D(data2D),
              .instru2016(instru[20:16]),
              .instru1511(instru[15:11]),
              .instru2016D(instru2016D),
              .instru1511D(instru1511D),
              .oinstru(oinstru),
              .oinstruD(oinstruD),
              .sum2sumOF(sum2sumOF),
              .sum2sumOF_D(sum2sumOF_D)                           
             );
             
 Execute Execute(.clk(clk),
                 .out(out),
                 .outE(outE),
                 .oZero(oZero),
                 .oZeroD(oZeroD),
                 .data2D(data2D),
                 .data2D_E(data2D_E),
                 .RegEscr1(RegEscr1),
                 .RegEscr1E(RegEscr1E),
                 .salSum2out(salSum2out),
                 .salSum2E(salSum2E)
                 );
Memory Memory(.clk(clk),
              .outE(outE),
              .outE_M(outE_M),
              .Dataout(Dataout),
              .DataoutM(DataoutM),
              .RegEscr1E(RegEscr1E),
              .RegEscr1E_M(RegEscr1E_M)
              );
    

assign RegEscr1 = RegDest ? instru1511D: instru2016D;
assign data21 = FuenteALU ? oinstruD : data2D;                         
assign dataEscr = MemaReg ? DataoutM : outE_M;

endmodule
