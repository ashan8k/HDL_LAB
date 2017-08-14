// CPU file includes
// fetch_mem_wr.v 
// decode_control.v 
// reg_rd_wr.v 
// execute.v
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module cpu # (
	parameter	ADDR_WIDTH = 12,
	parameter 	REG_WIDTH = 16 
	)(
	// System related inputs				
	input  wire	clk,				// System clock 
	input  wire	rst,				// System reset active HIGH
	// Memory related ports definishing
	input  wire	[15:0] data_mem2cpu,		// mem2cpu			 
	output wire	[15:0] data_cpu2mem,		// cpu2mem from MDA register
	output wire	[ADDR_WIDTH-1:0] addr_cpu2mem,	// Address from PC register
	output wire	mem_en, 			// Enable memory from a registor at control unit			 
	output wire	mem_rd_en, 			// Read enable memory from a registor at control unit
	output wire	mem_wr_en 			// Write enable memory from a registor at control unit
	);

	// Defining wires of internal connection
	
	// wire interface in between fetch_mem_wr.v (f) and decode_control.v (d)
	wire	[15:0] 		w_16_f_d_data_mem2cpu;
	wire 	[REG_WIDTH-1:0] w_R_f_d_pcplus;
	
	wire	[REG_WIDTH-1:0] w_R_f_d_alu_out;
	wire			w_1_f_d_mem2reg_sel;
	wire	[3:0] 		w_4_f_d_reg_wr_addr;
	wire			w_1_f_d_reg_wr_en;

	// wire interface in between decode_control.v (d) and reg_rd_wr.v (r)
	wire			w_1_d_r_mem_addr_sel;
	wire			w_1_d_r_reg_wr_en;
	wire			w_1_d_r_mem2reg_sel;
	wire			w_1_d_r_mem_wr_en;
	wire			w_1_d_r_branch;
	wire	[4:0]		w_5_d_r_alu_control;
	wire			w_1_d_r_alu_in2_sel;
	wire	[1:0]		w_2_d_r_fwd_wr_sel;
	wire			w_1_d_r_rd1_addr_sel;
	wire			w_1_d_r_rd2_addr_sel;
	wire	[3:0]		w_4_d_r_rd1_addr_from_cu;
	wire	[3:0]		w_4_d_r_fwd_wr_addr_from_cu;

	wire	[3:0]		w_4_d_r_rd1_addr1;
	wire	[3:0]		w_4_d_r_rd2_addr1;
	wire	[3:0]		w_4_d_r_rd2_addr2;
	wire	[3:0]		w_4_d_r_reg_wr_addr;
	wire	[REG_WIDTH-1:0]	w_R_d_r_wr_data;
	wire			w_1_d_r_reg_wr_en_2;	// reg_wr_en
	wire	[3:0]		w_4_d_r_fwd_wr_addr1;
	wire	[3:0]		w_4_d_r_fwd_wr_addr2;
	wire	[10:0]		w_11_d_r_imm;
	wire	[REG_WIDTH-1:0] w_R_d_r_pcplus;

	// wire interface in between reg_rd_wr.v (r) and execute.v (e)
	wire			w_1_r_e_mem_addr_sel;
	wire			w_1_r_e_reg_wr_en;
	wire			w_1_r_e_mem2reg_sel;
	wire			w_1_r_e_mem_wr_en;
	wire			w_1_r_e_branch;
	wire	[4:0]		w_5_r_e_alu_control;
	wire			w_1_r_e_alu_in2_sel;

	wire	[REG_WIDTH-1:0] w_R_r_e_rd1_data;
	wire	[REG_WIDTH-1:0] w_R_r_e_rd2_data;
	wire 	[3:0]		w_4_r_e_reg_wr_addr;	
	wire	[REG_WIDTH-1:0] w_R_r_e_sign_imm;
	wire	[REG_WIDTH-1:0] w_R_r_e_pcplus;

	// wire interface in between execute.v (e) and fetch_mem_wr.v (f)
	wire			w_1_e_f_mem_addr_sel;
	wire			w_1_e_f_reg_wr_en;
	wire			w_1_e_f_mem2reg_sel;
	wire			w_1_e_f_mem_wr_en;
	wire			w_1_e_f_branch;
	
	wire			w_1_e_f_alu_zero;
	wire	[REG_WIDTH-1:0] w_R_e_f_alu_out;
	wire	[REG_WIDTH-1:0] w_R_e_f_wr_data;

	wire	[3:0]		w_4_e_f_reg_wr_addr;
	wire	[REG_WIDTH-1:0]	w_R_e_f_pc_branch;
	
	// fetch_mem_wr instantialtion -----------------------------------------------------------------------------------
	fetch_mem_wr #(	
	.ADDR_WIDTH(ADDR_WIDTH),
	.REG_WIDTH(REG_WIDTH))
	u_fetch_mem_wr(
	// System related sygnals 
	.clk(clk),
	.rst(rst),

	// decoder related 
	.o_16_data_mem2cpu	(w_16_f_d_data_mem2cpu),
	.or_R_pcplus		(w_R_f_d_pcplus),
                         
	// write_reg related
	.or_R_alu_out		(w_R_f_d_alu_out),
	.or_1_mem2reg_sel	(w_1_f_d_mem2reg_sel),
	.or_4_reg_wr_addr	(w_4_f_d_reg_wr_addr),
	.or_1_reg_wr_en		(w_1_f_d_reg_wr_en),
                         
	// inputs from execute.v 
	.i_1_alu_zero		(w_1_e_f_alu_zero),
	.i_R_alu_out		(w_R_e_f_alu_out),
	.i_R_wr_data		(w_R_e_f_wr_data),
	.i_4_reg_wr_addr	(w_4_e_f_reg_wr_addr),
	.i_R_pc_branch		(w_R_e_f_pc_branch),
                         
	// Inputs comming from Execute related ports - controller's ports
	.i_1_mem_addr_sel	(w_1_e_f_mem_addr_sel),
	.i_1_reg_wr_en		(w_1_e_f_reg_wr_en),
	.i_1_mem2reg_sel	(w_1_e_f_mem2reg_sel),
	.i_1_mem_wr_en		(w_1_e_f_mem_wr_en),
	.i_1_branch		(w_1_e_f_branch),
                         
	// RAM related ports
	.i_16_data_mem2cpu	(data_mem2cpu),
	.o_1_mem_en		(mem_en),
	.o_1_mem_rd_en		(mem_rd_en),
	.o_1_mem_wr_en		(mem_wr_en),
	.o_16_data_cpu2mem	(data_cpu2mem),
	.o_A_addr_cpu2mem	(addr_cpu2mem)
	);
	
	/// decode_control instantialtion -------------------------------------------------------------------------------
	decode_control # (
	.REG_WIDTH(REG_WIDTH))
	u_decode_control(
	
	// System related ports
	.clk(clk),				// clock
	.rst(rst),				// reset active HIGH

	// fetch related ports
	.i_16_data_mem2cpu	(w_16_f_d_data_mem2cpu),
	.i_R_pcplus		(w_R_f_d_pcplus),

	// write to registers related ports 
	.i_R_alu_out		(w_R_f_d_alu_out),
	.i_1_mem2reg_sel	(w_1_f_d_mem2reg_sel),
	.i_4_reg_wr_addr	(w_4_f_d_reg_wr_addr),
	.i_1_reg_wr_en		(w_1_f_d_reg_wr_en),

	// Output wires from control unit . why wires? control unit output regs so no need regs again	 
	.o_4_fwd_wr_addr_from_cu(w_4_d_r_fwd_wr_addr_from_cu),
	.o_4_rd1_addr_from_cu	(w_4_d_r_rd1_addr_from_cu),
	.o_1_rd1_addr_sel	(w_1_d_r_rd1_addr_sel),
	.o_1_rd2_addr_sel	(w_1_d_r_rd2_addr_sel),
	.o_2_fwd_wr_sel		(w_2_d_r_fwd_wr_sel),
	.o_1_alu_in2_sel	(w_1_d_r_alu_in2_sel),
	.o_5_alu_control	(w_5_d_r_alu_control),
	.o_1_branch		(w_1_d_r_branch),
	.o_1_mem_wr_en		(w_1_d_r_mem_wr_en),
	.o_1_mem2reg_sel	(w_1_d_r_mem2reg_sel),
	.o_1_reg_wr_en		(w_1_d_r_reg_wr_en),
	.o_1_mem_addr_sel	(w_1_d_r_mem_addr_sel),	

	// output regs to reg_rd_wr module
	.or_4_rd1_addr1		(w_4_d_r_rd1_addr1),
	.or_4_rd2_addr1		(w_4_d_r_rd2_addr1),
	.or_4_rd2_addr2		(w_4_d_r_rd2_addr2),
	.or_R_wr_data		(w_R_d_r_wr_data),
	.or_4_reg_wr_addr	(w_4_d_r_reg_wr_addr),
	.or_1_reg_wr_en		(w_1_d_r_reg_wr_en_2),
	.or_4_fwd_wr_addr1	(w_4_d_r_fwd_wr_addr1),
	.or_4_fwd_wr_addr2	(w_4_d_r_fwd_wr_addr2),
	.or_11_imm		(w_11_d_r_imm),
	.or_R_pcplus      	(w_R_d_r_pcplus)      
	);

	// reg_rd_wr intance instantialtion -----------------------------------------------------------------------------------
	reg_rd_wr # (
	.REG_WIDTH(REG_WIDTH))
	u_reg_rd_wr(
	
	// System related ports
	.clk(clk),				// clock
	.rst(rst),				// reset active HIGH

	// singnal comming from control unit
	.i_4_fwd_wr_addr_from_cu(w_4_d_r_fwd_wr_addr_from_cu),
	.i_4_rd1_addr_from_cu	(w_4_d_r_rd1_addr_from_cu),
	.i_1_rd1_addr_sel	(w_1_d_r_rd1_addr_sel),
	.i_1_rd2_addr_sel	(w_1_d_r_rd2_addr_sel),
	.i_2_fwd_wr_sel		(w_2_d_r_fwd_wr_sel),
	.i_1_alu_in2_sel	(w_1_d_r_alu_in2_sel),
	.i_5_alu_control	(w_5_d_r_alu_control),
	.i_1_branch		(w_1_d_r_branch),
	.i_1_mem_wr_en		(w_1_d_r_mem_wr_en),
	.i_1_mem2reg_sel	(w_1_d_r_mem2reg_sel),
	.i_1_reg_wr_en		(w_1_d_r_reg_wr_en),
	.i_1_mem_addr_sel	(w_1_d_r_mem_addr_sel),

	// signal going from ( related to controlunit )
	.or_1_alu_in2_sel	(w_1_r_e_alu_in2_sel),  
	.or_5_alu_control	(w_5_r_e_alu_control),  
	.or_1_branch		(w_1_r_e_branch),       
	.or_1_mem_wr_en		(w_1_r_e_mem_wr_en),    
	.or_1_mem2reg_sel	(w_1_r_e_mem2reg_sel),  
	.or_1_reg_wr_en		(w_1_r_e_reg_wr_en),    
	.or_1_mem_addr_sel	(w_1_r_e_mem_addr_sel), 
	
	// Signal comming from decode side  // inputs
	.i_4_rd1_addr1		(w_4_d_r_rd1_addr1),  
	.i_4_rd2_addr1		(w_4_d_r_rd2_addr1),  
	.i_4_rd2_addr2		(w_4_d_r_rd2_addr2),  
	.i_R_wr_data		(w_R_d_r_wr_data),    
	.i_4_reg_wr_addr	(w_4_d_r_reg_wr_addr),    
	.i_1_reg_wr_en_2	(w_1_d_r_reg_wr_en_2),   
	.i_4_fwd_wr_addr1	(w_4_d_r_fwd_wr_addr1),
	.i_4_fwd_wr_addr2	(w_4_d_r_fwd_wr_addr2),
	.i_11_imm		(w_11_d_r_imm),        
	.i_R_pcplus     	(w_R_d_r_pcplus),      

	// Execute related ports // outputs	 
	.o_R_rd1_data		(w_R_r_e_rd1_data),
	.o_R_rd2_data		(w_R_r_e_rd2_data),
	.or_4_reg_wr_addr	(w_4_r_e_reg_wr_addr),
	.or_R_sign_imm		(w_R_r_e_sign_imm),
	.or_R_pcplus		(w_R_r_e_pcplus)       
);


	
	// execute instantialtion -------------------------------------------------------------------------------------
	execute # (
	.REG_WIDTH(REG_WIDTH))
	u_execute(
	
	// System related ports
	.clk(clk),
	.rst(rst),
	
	// inputs
	// conntrol_unit related ports 
	.i_1_alu_in2_sel	(w_1_r_e_alu_in2_sel),   
	.i_5_alu_control	(w_5_r_e_alu_control),   
	// Execute related ports - controller's ports
	.i_1_mem_addr_sel	(w_1_r_e_mem_addr_sel),
	.i_1_reg_wr_en		(w_1_r_e_reg_wr_en),
	.i_1_mem2reg_sel	(w_1_r_e_mem2reg_sel),
	.i_1_mem_wr_en		(w_1_r_e_mem_wr_en),
	.i_1_branch		(w_1_r_e_branch),


	// decoder related ports
	.i_R_rd1_data		(w_R_r_e_rd1_data),    
	.i_R_rd2_data		(w_R_r_e_rd2_data),    
	.i_4_reg_wr_addr	(w_4_r_e_reg_wr_addr),    	 
	.i_R_sign_imm		(w_R_r_e_sign_imm),
	.i_R_pcplus		(w_R_r_e_pcplus),

	//  Memory related ports
	.o_1_alu_zero		(w_1_e_f_alu_zero),   
	.o_R_alu_out		(w_R_e_f_alu_out),    
	.or_R_wr_data		(w_R_e_f_wr_data),    
	.or_4_reg_wr_addr	(w_4_e_f_reg_wr_addr),
	.or_R_pc_branch 	(w_R_e_f_pc_branch),  

	// Execute related ports - controller's ports
	.or_1_mem_addr_sel	(w_1_e_f_mem_addr_sel),
	.or_1_reg_wr_en		(w_1_e_f_reg_wr_en),   
	.or_1_mem2reg_sel	(w_1_e_f_mem2reg_sel), 
	.or_1_mem_wr_en		(w_1_e_f_mem_wr_en),   
	.or_1_branch		(w_1_e_f_branch)
);

	
endmodule 
