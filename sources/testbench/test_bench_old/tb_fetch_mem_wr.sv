// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Modified by M.Sc. Haoyuan Ying Dual 8-bit Memory Port -> Single 16-bit
// Email: 	boris.traskov@ies.tu-darmstadt.de

`timescale 10 ns / 1 ps
`include "./memory.sv"

module tb_fetch_mem_wr();

// PARAMETERS
parameter	 MEM_DEPTH	= 2**12;	//8192 Bytes 4096*2B
parameter	 ADDR_WIDTH   	= $clog2(MEM_DEPTH);
parameter	 REG_WIDTH	= 16;		// 16 / 32 bit architecture
parameter string FOLDER_PATH	= "/home/vhdlp19/ASHAN/hdl_repo/";
parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/count32.bin"};
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/add.bin"}; // add SP
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/sub.bin"}; // 
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/movs.bin"}; // ff -> r3
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/mov.bin"}; // r7 --> sp
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/adds_1c18.bin"};	// --> r0<- r3+[#0]
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/ldr_4a08.bin"}; 	// --> r2 <- [pc+32]
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/ldr_681a.bin"}; 	// --> r2 <- [r3+0]
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/str_6013.bin"}; 	// --> store r3 valu at   [r2+0]
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/b.n_e004.bin"}; 	// --> brach to 0C
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/cmp_2b1f.bin"};	// compair if r3 > 31 skip next 
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/blen.bin"};	// jump 8 from existing address 
//parameter string FILE_NAME	= {FOLDER_PATH,"/sources/software/test/push.bin"};	//  push lr and r[0:7] only one of them 


// INTERNAL SIGNALS
integer file, status; // needed for file-io
logic	clk;
logic	rst;
logic	en;
logic	rd_en;
logic  	wr_en;
logic 	[15:0]	data_cpu2mem;
logic 	[15:0]	data_mem2cpu;
logic 	[ADDR_WIDTH-1:0] addr;

logic	[15:0]		o_16_data_cpu2mem;
logic	[REG_WIDTH-1:0]	or_R_pcplus;

logic	[REG_WIDTH-1:0]	or_R_alu_out;
logic			or_1_mem2reg_sel;
logic	[3:0]		or_4_reg_wr_addr;
logic			or_1_reg_wr_en;

logic			i_1_alu_zero;
logic	[REG_WIDTH-1:0]	i_R_alu_out;
logic	[REG_WIDTH-1:0]	i_R_wr_data;
logic	[3:0]		i_4_reg_wr_addr;
logic	[REG_WIDTH-1:0]	i_R_pc_branch;

logic	i_1_mem_addr_sel;
logic	i_1_reg_wr_en;
logic	i_1_mem2reg_sel;
logic	i_1_mem_wr_en; 
logic	i_1_branch; 

// FETCH_MEM_WR INSTANTIATION
fetch_mem_wr// #(	.ADDR_WIDTH(ADDR_WIDTH),
//	.REG_WIDTH(REG_WIDTH)) 
fetch_mem_wr_i (
	.clk(clk),
	.rst(rst),

	// decoder related 
	.o_16_data_mem2cpu	(o_16_data_cpu2mem), 	// connected to register out of the memory
	.or_R_pcplus		(or_R_pcplus),	

	// write_reg related
	.or_R_alu_out		(or_R_alu_out    ),
	.or_1_mem2reg_sel	(or_1_mem2reg_sel),
	.or_4_reg_wr_addr	(or_4_reg_wr_addr),
	.or_1_reg_wr_en		(or_1_reg_wr_en	 ),
 
	// inputs from execute.v 
	.i_1_alu_zero		(i_1_alu_zero	),
	.i_R_alu_out		(i_R_alu_out	),
	.i_R_wr_data		(i_R_wr_data	),
	.i_4_reg_wr_addr	(i_4_reg_wr_addr),
	.i_R_pc_branch		(i_R_pc_branch	),

	// Inputs comming from Execute related ports - controller's ports
	.i_1_mem_addr_sel	(i_1_mem_addr_sel 	),
	.i_1_reg_wr_en		(i_1_reg_wr_en		),
	.i_1_mem2reg_sel	(i_1_mem2reg_sel	),
	.i_1_mem_wr_en		(i_1_mem_wr_en		),
	.i_1_branch		(i_1_branch		),

	// RAM related ports
	.i_16_data_mem2cpu	(data_mem2cpu),
	.o_1_mem_en		(en),
	.o_1_mem_rd_en		(rd_en),
	.o_1_mem_wr_en		(wr_en),
	.o_16_data_cpu2mem	(data_cpu2mem),
	.o_A_addr_cpu2mem	(addr)
);
    	


// MODULE INSTANTIATION
memory #(
	.MEM_DEPTH (MEM_DEPTH)) 
memory_i (
	.clk 	(clk),
	.addr	(addr),
	.en  	(en),
	.rd_en  (rd_en),
	.wr_en  (wr_en),
	.din (data_cpu2mem),
	.dout(data_mem2cpu)
);
  
//CLOCK GENERATOR
initial begin
	clk = 1'b0;
	forever #1  clk = !clk;
end

//RESET GENERATOR  
initial begin
	rst			= 1'b0;
	file		= $fopen(FILE_NAME, "r");
	#3; 
	@(posedge clk)rst		= 1'b1;     // 3   ns
	status		= $fread(memory_i.ram, file);
	#2.1 rst	= 1'b0;  //2.1 ns
//	$finish;

end

initial begin
#6;

@ (posedge clk)	
i_1_alu_zero	=1;
i_R_alu_out	=1;
i_R_wr_data	=1;
i_4_reg_wr_addr	=1;
i_R_pc_branch	=1;

i_1_mem_addr_sel=1;
i_1_reg_wr_en	=1;
i_1_mem2reg_sel	=1;
i_1_mem_wr_en	=1; 
i_1_branch	=1; 

end

endmodule

