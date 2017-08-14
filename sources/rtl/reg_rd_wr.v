// reg_list module top level
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module reg_rd_wr # (
	parameter	REG_WIDTH=16)(
	
	// System related ports
	input 	wire	clk,				// clock
	input 	wire	rst,				// reset active HIGH

	// singnal comming from control unit
	input	wire	[3:0]	i_4_fwd_wr_addr_from_cu,
	input 	wire 	[3:0]	i_4_rd1_addr_from_cu,
	input	wire		i_1_rd1_addr_sel,
	input	wire		i_1_rd2_addr_sel,
	input	wire 	[1:0]	i_2_fwd_wr_sel,
	input	wire		i_1_alu_in2_sel,
	input	wire 	[4:0]	i_5_alu_control,
	input	wire		i_1_branch,
	input 	wire		i_1_mem_wr_en,
	input 	wire		i_1_mem2reg_sel,
	input	wire		i_1_reg_wr_en,
	input	wire		i_1_mem_addr_sel,	

	// signal going from ( related to controlunit )
	output 	reg		or_1_alu_in2_sel, 				
	output	reg	[4:0]	or_5_alu_control,			
	output	reg		or_1_branch,
	output	reg		or_1_mem_wr_en,   	
	output	reg		or_1_mem2reg_sel, 
	output	reg		or_1_reg_wr_en, 
	output	reg		or_1_mem_addr_sel,
	
	// Signal comming from decode side 
	

	input	wire	[3:0]		i_4_rd1_addr1,
	input	wire 	[3:0]		i_4_rd2_addr1,
	input	wire	[3:0]		i_4_rd2_addr2,
	input	wire	[REG_WIDTH-1:0]	i_R_wr_data,
	input	wire	[3:0]		i_4_reg_wr_addr,
	input	wire			i_1_reg_wr_en_2,
	input	wire	[3:0] 		i_4_fwd_wr_addr1,
	input	wire	[3:0] 		i_4_fwd_wr_addr2,
	input	wire	[10:0]		i_11_imm,
	input	wire	[REG_WIDTH-1:0]	i_R_pcplus,

	// Execute related ports 			 
	output	wire 	[REG_WIDTH-1:0] o_R_rd1_data,
	output	wire 	[REG_WIDTH-1:0] o_R_rd2_data,
	output	reg 	[3:0] 		or_4_reg_wr_addr,
	output	reg 	[REG_WIDTH-1:0] or_R_sign_imm,
	output 	reg	[REG_WIDTH-1:0] or_R_pcplus);

	// END of defining decoder ports 
	
	// Internal wires 
	wire 	[3:0]	w_4_rd1_addr;
	wire 	[3:0]	w_4_rd2_addr;
	
	// mux for read address1
	assign	w_4_rd1_addr	= (i_1_rd1_addr_sel) ? i_4_rd1_addr_from_cu : i_4_rd1_addr1;

	// mux for read address2
	assign	w_4_rd2_addr	= (i_1_rd2_addr_sel) ? i_4_rd2_addr1 : i_4_rd2_addr2;
	
	always @ (posedge clk) begin
		if(rst == 1) begin
			or_1_alu_in2_sel	<= 'h0;
			or_5_alu_control	<= 'h0;
			or_1_branch		<= 'h0;	
			or_1_mem_wr_en		<= 'h0;
			or_1_mem2reg_sel	<= 'h0;
			or_1_reg_wr_en		<= 'h0;
			or_1_mem_addr_sel	<= 'h0;
		
			or_4_reg_wr_addr	<= 'h0;	
			or_R_sign_imm		<= 'h0;
			or_R_pcplus		<= 'h0;
		end
		else begin
			or_1_alu_in2_sel	<= i_1_alu_in2_sel;
			or_5_alu_control	<= i_5_alu_control;
			or_1_branch		<= i_1_branch;	
			or_1_mem_wr_en		<= i_1_mem_wr_en;
			or_1_mem2reg_sel	<= i_1_mem2reg_sel;
			or_1_reg_wr_en		<= i_1_reg_wr_en;
			or_1_mem_addr_sel	<= i_1_mem_addr_sel;
				if(i_2_fwd_wr_sel == 2'b01) 		or_4_reg_wr_addr	<= i_4_fwd_wr_addr2;
				else if (i_2_fwd_wr_sel == 2'b10)	or_4_reg_wr_addr	<= i_4_fwd_wr_addr_from_cu;
				else			 		or_4_reg_wr_addr	<= i_4_fwd_wr_addr1;
			or_R_sign_imm		<= {5'b00000,i_11_imm}; // sign-ex now not doing here
			or_R_pcplus		<= i_R_pcplus;
		end
	end
	
	registers # (
		.REG_WIDTH(REG_WIDTH))
	u_registers (
		.clk(clk),
		.rst(rst),
		.i_4_rd1_addr	(w_4_rd1_addr),
		.i_4_rd2_addr	(w_4_rd2_addr),
		.i_4_wr_addr	(i_4_reg_wr_addr),
		.i_R_wr_data	(i_R_wr_data),
		.i_1_reg_wr_en	(i_1_reg_wr_en_2),
		.i_R_pcplus	(i_R_pcplus),
		.or_R_rd1_data	(o_R_rd1_data),
		.or_R_rd2_data	(o_R_rd2_data)
	);
		
endmodule 
