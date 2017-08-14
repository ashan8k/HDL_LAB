// Fetch and memory write module
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module fetch_mem_wr #(
	parameter	ADDR_WIDTH=12,
	parameter	REG_WIDTH=16)(
	
	// System related sygnals 
	input 	wire	clk,
	input 	wire	rst,

	// decoder related 
	output	wire	[15:0] 		o_16_data_mem2cpu, 	// connected to register out of the memory
	output	reg	[REG_WIDTH-1:0] or_R_pcplus,	

	// write_reg related
	output	reg	[REG_WIDTH-1:0]	or_R_alu_out,
	output	reg			or_1_mem2reg_sel,
	output	reg	[3:0] 		or_4_reg_wr_addr,
	output	reg			or_1_reg_wr_en,
 
	// inputs from execute.v 
	input	wire 			i_1_alu_zero,
	input	wire 	[REG_WIDTH-1:0]	i_R_alu_out,
	input	wire	[REG_WIDTH-1:0]	i_R_wr_data,
	input	wire	[3:0]		i_4_reg_wr_addr,
	input	wire  	[REG_WIDTH-1:0]	i_R_pc_branch,

	// Inputs comming from Execute related ports - controller's ports
	input	wire			i_1_mem_addr_sel,
	input	wire			i_1_reg_wr_en,
	input	wire			i_1_mem2reg_sel,
	input	wire			i_1_mem_wr_en,
	input	wire			i_1_branch,

	// RAM related ports
	input	wire	[15:0] 		i_16_data_mem2cpu,
	output	wire			o_1_mem_en,
	output	wire			o_1_mem_rd_en,
	output	wire			o_1_mem_wr_en,
	output	wire	[15:0]		o_16_data_cpu2mem,
	output	wire	[ADDR_WIDTH-1:0]o_A_addr_cpu2mem);
	// END OF PORTS
	
	// delaying reset
	//reg reset_d;
//	always@(posedge clk) reset_d <= rst;

//	wire [15:0]w_i_16_data_mem2cpu = (reset_d)? 0 : i_16_data_mem2cpu;
	
	// hazard controlling 
	// here i'm blindly giving fixed delay initial step not comparing value f
	reg	[2:0] counter;	// 3 bit counter need hold system for 6 cycles - worst case 
	always @ (posedge clk) begin
		if (rst == 1 || counter == 3'b100 || (i_1_alu_zero&& i_1_branch)) begin
			counter	<= 'h0;
		end
		else	begin
			counter <= counter + 1;
		end
	end
	wire 	[15:0] w_16_data_mem2cpu;
	assign	w_16_data_mem2cpu = {i_16_data_mem2cpu[7:0], i_16_data_mem2cpu[15:8]};

	//register definition
	reg	[REG_WIDTH-1:0] pc;
	
	always @ (posedge clk) begin
		if (rst == 1)	pc <= 'h0;
		else begin
			if(i_1_alu_zero && i_1_branch) begin 
				pc <= i_R_pc_branch;	// mux for branch
			end 
			else if(counter == 4) pc <= pc+2;			// HOLD PC in hazard  // HAZARD
			else pc <= pc;
		end
	end
	
	// if i_1_mem_addr_sel == 1 and i_1_mem_wr_en == 0 then next clk cycle o_16_data_mem2cpu shoud be w_16_data_mem2cpu;
	reg loading_from_memory;
	always @ (posedge clk) begin
		if( i_1_mem_addr_sel == 1 && i_1_mem_wr_en == 0)
			loading_from_memory <=1;
		else 
			loading_from_memory <=0;
	end

	// memory connection

	// need to hold the mem2cpu data while pc is not incremnting// exception when 
	assign	o_16_data_mem2cpu	= (counter == 1 || loading_from_memory == 1) ? w_16_data_mem2cpu : 'h0 ; //	assigning value into the output wire // need machanism in 32 bit system -Ashan
	assign	o_A_addr_cpu2mem	= (i_1_mem_addr_sel) ? i_R_alu_out[ADDR_WIDTH-1:0]>>1 : pc[ADDR_WIDTH-1:0]>>1;	// mux 
	// >> 1 is to divide the addr by 2 just before giving to RAM
	assign 	o_16_data_cpu2mem	= {i_R_wr_data[7:0],i_R_wr_data[15:8]}; // need machanism in 32 bit system -Ashan 
	assign 	o_1_mem_en		= 1'b1;		// RAM enable always ON
	assign	o_1_mem_rd_en		= ~(i_1_mem_wr_en);	// RAM READ
	assign	o_1_mem_wr_en		= i_1_mem_wr_en;	// RAM 



	
	always @ (posedge clk)  begin
		or_R_pcplus	<= pc+2; // incase need to increment use exact value in pc <= pc+2
		or_R_alu_out	<= i_R_alu_out;
		or_1_mem2reg_sel<= i_1_mem2reg_sel;
		or_4_reg_wr_addr<= i_4_reg_wr_addr;
		or_1_reg_wr_en	<= i_1_reg_wr_en;
	end	



endmodule 
