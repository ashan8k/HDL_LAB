// Decode module top level
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module decode_control # (
	parameter	REG_WIDTH=16)(
	
	// System related ports
	input 	wire	clk,				// clock
	input 	wire	rst,				// reset active HIGH

	// fetch related ports
	input	wire	[15:0] 		i_16_data_mem2cpu,
	input 	wire	[REG_WIDTH-1:0] i_R_pcplus,

	// write to registers related ports 
	input	wire	[REG_WIDTH-1:0] i_R_alu_out,
	input 	wire 			i_1_mem2reg_sel,
	input	wire	[3:0] 		i_4_reg_wr_addr,
	input	wire			i_1_reg_wr_en,

	// Output wires from control unit . why wires? control unit output regs so no need regs again	 
	output 	wire 	[3:0] 		o_4_fwd_wr_addr_from_cu,
	output 	wire 	[3:0] 		o_4_rd1_addr_from_cu,
	output	wire			o_1_rd1_addr_sel,
	output	wire			o_1_rd2_addr_sel,
	output  wire 	[1:0]		o_2_fwd_wr_sel,
	output	wire			o_1_alu_in2_sel,
	output	wire 	[4:0]		o_5_alu_control,
	output	wire			o_1_branch,
	output 	wire			o_1_mem_wr_en,
	output 	wire			o_1_mem2reg_sel,
	output	wire			o_1_reg_wr_en,
	output	wire			o_1_mem_addr_sel,	

	// output regs to reg_rd_wr module
	output	reg	[3:0]		or_4_rd1_addr1,
	output	reg	[3:0]		or_4_rd2_addr1,
	output	reg	[3:0]		or_4_rd2_addr2,
	output	reg	[REG_WIDTH-1:0]	or_R_wr_data,
	output	reg	[3:0]		or_4_reg_wr_addr,
	output	reg 			or_1_reg_wr_en,
	output	reg	[3:0] 		or_4_fwd_wr_addr1,
	output	reg	[3:0] 		or_4_fwd_wr_addr2,
	output	reg	[10:0]		or_11_imm,
	output	reg 	[REG_WIDTH-1:0]	or_R_pcplus
	);

	// END of defining decoder ports 

	// internal wires definition	
	wire	[4:0]	w_5_decoded_opcode;
	wire 	[7:0]	w_8_decoded_imm;
	wire 	[15:0]	w_16_data_mem2cpu;
	assign w_16_data_mem2cpu = (i_1_mem2reg_sel) ? 0 : i_16_data_mem2cpu;
	always @ (posedge clk) begin
		if(rst == 1) begin
			or_4_rd1_addr1		<= 'h0;
			or_4_rd2_addr1		<= 'h0;
			or_4_rd2_addr2		<= 'h0;
			or_R_wr_data		<= 'h0; 
			or_4_reg_wr_addr	<= 'h0; 
			or_1_reg_wr_en		<= 'h0; 
			or_4_fwd_wr_addr1	<= 'h0; 
			or_4_fwd_wr_addr2	<= 'h0; 
			or_11_imm		<= 'h0; 
			or_R_pcplus		<= 'h0; 
		end
		else begin
			or_4_rd1_addr1		<= {1'b0,w_16_data_mem2cpu[5:3]};           
			or_4_rd2_addr1		<= {w_16_data_mem2cpu[6:3]};
			or_4_rd2_addr2		<= {1'b0,w_16_data_mem2cpu[2:0]};
			or_R_wr_data		<= (i_1_mem2reg_sel) ? i_16_data_mem2cpu : i_R_alu_out;
			or_4_reg_wr_addr	<= i_4_reg_wr_addr;
			or_1_reg_wr_en		<= i_1_reg_wr_en;
			or_4_fwd_wr_addr1	<= {1'b0,w_16_data_mem2cpu[2:0]};
			or_4_fwd_wr_addr2	<= {1'b0,w_16_data_mem2cpu[10:8]};
			or_11_imm		<= w_16_data_mem2cpu[10:0];
			or_R_pcplus		<= i_R_pcplus;
		end
	end
	
	decode	u_decode (
		.decode_in(w_16_data_mem2cpu), 
		.decoded_opcode(w_5_decoded_opcode), 
		.decoded_imm(w_8_decoded_imm));

	control	u_control (
		.clk(clk),
		.rst(rst),
		.i_5_control_opcode	(w_5_decoded_opcode),
		.i_8_control_imm	(w_8_decoded_imm),
		.or_4_fwd_wr_addr_from_cu(o_4_fwd_wr_addr_from_cu),
		.or_4_rd1_addr_from_cu	(o_4_rd1_addr_from_cu),	
		.or_1_rd1_addr_sel	(o_1_rd1_addr_sel),	
		.or_1_rd2_addr_sel	(o_1_rd2_addr_sel),	
		.or_2_fwd_wr_sel	(o_2_fwd_wr_sel),  	
		.or_1_alu_in2_sel	(o_1_alu_in2_sel), 	
		.or_5_alu_control	(o_5_alu_control), 	
		.or_1_branch		(o_1_branch),     
		.or_1_mem_wr_en		(o_1_mem_wr_en),   	
		.or_1_mem2reg_sel	(o_1_mem2reg_sel), 	
		.or_1_reg_wr_en		(o_1_reg_wr_en),   	
		.or_1_mem_addr_sel	(o_1_mem_addr_sel)	 
		);
		
endmodule 
