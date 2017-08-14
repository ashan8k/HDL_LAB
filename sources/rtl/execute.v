// Execute program
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module execute # (
	parameter	REG_WIDTH=16)(
	
	// System related ports
	input	wire 	clk,
	input  	wire 	rst,
	
	// conntrol_unit related ports - INPUT 
	input	wire			i_1_alu_in2_sel, 				
	input	wire	[4:0]		i_5_alu_control,			
	input	wire			i_1_branch,
	input	wire			i_1_mem_wr_en,   	
	input	wire			i_1_mem2reg_sel, 
	input	wire			i_1_reg_wr_en, 
	input	wire			i_1_mem_addr_sel,

	// decoder related ports
	input	wire 	[REG_WIDTH-1:0] i_R_rd1_data,
	input	wire 	[REG_WIDTH-1:0] i_R_rd2_data,
	input	wire	[3:0] 		i_4_reg_wr_addr,
	input	wire	[REG_WIDTH-1:0] i_R_sign_imm,
	input 	wire	[REG_WIDTH-1:0] i_R_pcplus,

	// Outputs 
	output	wire			o_1_alu_zero,
	output	wire	[REG_WIDTH-1:0]	o_R_alu_out,
	output	reg	[REG_WIDTH-1:0]	or_R_wr_data,
	output	reg	[3:0]		or_4_reg_wr_addr,
	output	reg	[REG_WIDTH-1:0]	or_R_pc_branch,

	// OUTPUTS comming from control.v
	output	reg			or_1_mem_addr_sel,
	output	reg			or_1_reg_wr_en,
	output	reg			or_1_mem2reg_sel,
	output	reg			or_1_mem_wr_en,
	output	reg			or_1_branch);

	// END of execute ports 
	
	// internal connections
	wire	[REG_WIDTH-1:0]	w_R_alu_in2;

	// mux for Alu second input 
	assign	w_R_alu_in2	= (i_1_alu_in2_sel) ? i_R_sign_imm : i_R_rd2_data ;

	// ALU Instantiation 
	alu # (
		.REG_WIDTH(REG_WIDTH))
	u_alu (
		.clk(clk),
		.i_R_alu_in1	(i_R_rd1_data),
		.i_R_alu_in2	(w_R_alu_in2),
		.i_5_alu_opcode	(i_5_alu_control),
		.or_R_alu_out	(o_R_alu_out),
		.or_1_alu_zero	(o_1_alu_zero)
	);

	always @ (posedge clk) begin
		// initial system reset
		if(rst==1) begin

			or_R_wr_data		<= 'h0; 
			or_4_reg_wr_addr	<= 'h0;
			or_R_pc_branch		<= 'h0;
			or_1_mem_addr_sel	<= 'h0;
			or_1_reg_wr_en		<= 'h0;
			or_1_mem2reg_sel	<= 'h0;
			or_1_mem_wr_en		<= 'h0;
			or_1_branch		<= 'h0;
		end
		else begin
			or_R_wr_data		<= i_R_rd2_data;
			or_4_reg_wr_addr	<= i_4_reg_wr_addr;
			if (i_5_alu_control[4:3]== 2'b10) begin		// CMP 
				or_R_pc_branch		<= i_R_pcplus + 2; // this is for CMP and skip the next 	
				//or_R_pc_branch		<= 16'h2a; for debug
			end
			else if (i_5_alu_control[4:3]== 2'b11) begin 	// BLEN
				or_R_pc_branch		<= {7'b1111111,i_R_sign_imm[7:0],1'b0 } + i_R_pcplus +2;	// pc+ neg value
			end
			else begin
				or_R_pc_branch		<= (i_R_sign_imm << 1) + i_R_pcplus +2;	// add pcplus + shifted_imm
			end
			or_1_mem_addr_sel	<=i_1_mem_addr_sel;
			or_1_reg_wr_en		<=i_1_reg_wr_en;
			or_1_mem2reg_sel	<=i_1_mem2reg_sel;
			or_1_mem_wr_en		<=i_1_mem_wr_en;
			or_1_branch		<=i_1_branch;


		end
	end

endmodule
