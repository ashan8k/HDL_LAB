// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Modified by M.Sc. Haoyuan Ying Dual 8-bit Memory Port -> Single 16-bit
// Email: 	boris.traskov@ies.tu-darmstadt.de

`timescale 1 ns / 1 ps

module tb_control();

// PARAMETERS
parameter	 MEM_DEPTH	= 2**12;	//8192 Bytes 4096*2B
parameter	 ADDR_WIDTH   	= $clog2(MEM_DEPTH);
parameter	 REG_WIDTH	= 16;		// 16 / 32 bit architecture

// INTERNAL SIGNALS
logic	clk;
logic	rst;
logic	[4:0]control_opcode;
logic	[7:0]control_imm;

// MODULE INSTANTIATION
control u_control (
	.clk(clk),
	.rst(rst),
	.control_opcode(control_opcode),
	.control_imm(control_imm));
// output singnals are not connnected 

// logic
initial begin
	#5.2;
	@(posedge clk) control_opcode =5'b00001; control_imm = 8'h00;
	@(posedge clk) control_opcode =5'b00000; control_imm = 8'h00;
end

//CLOCK GENERATOR
initial begin
	clk = 1'b0;
	forever #1  clk = !clk;
end

//RESET GENERATOR  
initial begin
	rst			= 1'b0;
	#3 rst		= 1'b1;     // 3   ns
	#2.1 rst	= 1'b0;  //2.1 ns
//	$finish;
end

endmodule
