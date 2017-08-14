// Test bench Fetch program developed for the HDL LAB for ARM cpu

`timescale 1ns/ 1ps
module tb_fetch_decode();

// PARAMETERS
parameter MEM_DEPTH   		= 2**12;	//8192 Bytes 4096*2B
parameter ADDR_WIDTH   		= $clog2(MEM_DEPTH);
parameter string filename	= "/home/ashan/git/HDL_Lab/sources/software/count32.bin";

// INTERNAL SIGNALS
integer file, status; // needed for file-io
logic	clk;
logic	rst;
logic	en;
logic	rd_en;
logic	wr_en;
logic	[15:0]	data_cpu2mem;
logic 	[15:0]	data_mem2cpu;
logic 	[ADDR_WIDTH-1:0] addr;
logic 	[4:0]decision;
logic 	[2:0]rd3;
logic 	[7:0]imm8;


//assign en	= 1'b1;
//assign rd_en	= 1'b1;
//assign wr_en	= 1'b0;

// CPU INSTANTIATION
//cpu  
//cpu_i (
//    .clk 	(clk),
//    .rst 	(rst),
//    .addr	(addr)
	// add more signals here
//);

// MODULE FETCH_DECODE TESTING
fetch_decode u_fetch_decode (
	.clk(clk),
	.rst(rst),
	.instruction_from_mem(data_mem2cpu),
	.reg_decision(decision),
	.reg_rd3(rd3),
	.reg_imm8(imm8)
	);


initial begin
	#7;
	@ (posedge clk) addr = 0;  rd_en = 1; wr_en = 0; en=1;
	@ (posedge clk) addr = 1; //rd_en = 0; wr_en = 1; en=1;
	@ (posedge clk) addr = 2; //rd_en = 0; wr_en = 1; en=1;
	@ (posedge clk) addr = 3; //rd_en = 0; wr_en = 1; en=1;
	@ (posedge clk) addr = 4; //rd_en = 0; wr_en = 1; en=1;
	@ (posedge clk) addr = 15; //rd_en = 0; wr_en = 1; en=1;
	@ (posedge clk) addr = 'h200/2; //rd_en = 0; wr_en = 1; en=1;
	
end

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
    	.dout(data_mem2cpu));

  
//CLOCK GENERATOR
initial begin
	clk = 1'b0;
	forever #1  clk = !clk;
end

//RESET GENERATOR  
initial begin
	rst		= 1'b0;
	file		= $fopen(filename, "r");
	#3 rst		= 1'b1;     // 3   ns
	status		= $fread(memory_i.ram, file);
	#2.1 rst	= 1'b0;  //2.1 ns
//	$finish;
end

endmodule
