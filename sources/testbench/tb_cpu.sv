// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Modified by M.Sc. Haoyuan Ying Dual 8-bit Memory Port -> Single 16-bit
// Email: 	boris.traskov@ies.tu-darmstadt.de

`timescale 1 ns / 1 ps
`include "./memory.sv"

module tb_cpu();

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

// CPU INSTANTIATION
cpu //#(	.ADDR_WIDTH(ADDR_WIDTH),
//	.REG_WIDTH(REG_WIDTH)) 
cpu_i (
    	.clk(clk),
	.rst(rst),
	.data_mem2cpu(data_mem2cpu),
	.data_cpu2mem(data_cpu2mem),
	.addr_cpu2mem(addr),
	.mem_en(en),
	.mem_rd_en(rd_en),
	.mem_wr_en(wr_en)
);

// MODULE INSTANTIATION
memory #(
	.MEM_DEPTH (MEM_DEPTH)) 
memory_i (
	.clk 	(clk),
	.addr	(addr),
	.en  	(1'b1),
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
	@(negedge clk)rst		= 1'b1;     // 3   ns
	status		= $fread(memory_i.ram, file);
	repeat (6) @(negedge clk);
 	rst	= 1'b0;  //2.1 ns
//	$finish;
end

endmodule
