// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Modified by M.Sc. Haoyuan Ying Dual 8-bit Memory Port -> Single 16-bit
// Email: 	boris.traskov@ies.tu-darmstadt.de

`timescale 1 ns / 1 ps

module tb_alu();

// PARAMETERS
parameter	 REG_WIDTH	= 16;		// 16 / 32 bit architecture
parameter 	NULL	= 5'b00000;
parameter 	ADDSP	= 5'b00001;
parameter	SUBSP	= 5'b00010;
parameter	MOVS	= 5'b00011;
parameter	MOV	= 5'b00100;
parameter	ADDS	= 5'b00101;
parameter	LDRPC	= 5'b00110;
parameter	LDR	= 5'b00111;
parameter	BN	= 5'b01001;
parameter	CMP	= 5'b10000;
parameter	BLEN	= 5'b11000;

logic	clk;
logic	rst;
logic	[REG_WIDTH-1:0]	i_R_alu_in1;
logic 	[REG_WIDTH-1:0]	i_R_alu_in2;
logic	[4:0]		i_5_alu_opcode;
logic	[REG_WIDTH-1:0]	or_R_alu_out;
logic			or_1_alu_zero;
// ALU INSTANTIATION
alu // # (.REG_WIDTH(REG_WIDTH))	
u_alu (
	.clk(clk),
	.i_R_alu_in1(i_R_alu_in1),
	.i_R_alu_in2(i_R_alu_in2),
	.i_5_alu_opcode(i_5_alu_opcode),
	.or_R_alu_out(or_R_alu_out),
	.or_1_alu_zero(or_1_alu_zero)	
);
//CLOCK GENERATOR
initial begin
	clk = 1'b0;
	forever #1  clk = !clk;
end

//RESET GENERATOR  
initial begin
	rst			= 1'b0;
	#3; 
	@(posedge clk)rst		= 1'b1;     // 3   ns
	#2.1 rst	= 1'b0;  //2.1 ns
//	$finish;

end

initial begin
#5.8;	i_R_alu_in1=1;i_R_alu_in2=2;i_5_alu_opcode=CMP;
#5.8;	i_R_alu_in1=2;i_R_alu_in2=1;i_5_alu_opcode=CMP;
end


endmodule

