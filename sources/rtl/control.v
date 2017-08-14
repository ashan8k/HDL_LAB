// Control unit program
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module control (
	//system related ports 
	input  	wire 	clk,
	input  	wire 	rst,
	
	// decoder related ports
	input	wire 	[4:0]	i_5_control_opcode,
	input	wire	[7:0]	i_8_control_imm,
	
	// controller outputs
	output	reg	[3:0]	or_4_fwd_wr_addr_from_cu,	// newly added
	output	reg 	[3:0]	or_4_rd1_addr_from_cu,
	output	reg 		or_1_rd1_addr_sel,
	output	reg 		or_1_rd2_addr_sel,
	output	reg 	[1:0]	or_2_fwd_wr_sel,		// changed 1 to 2
	output	reg		or_1_alu_in2_sel,
	output	reg	[4:0]	or_5_alu_control,		// changed 3 to 5
	output	reg		or_1_branch,
	output	reg		or_1_mem_wr_en,
	output	reg		or_1_mem2reg_sel,
	output	reg		or_1_reg_wr_en,
	output	reg		or_1_mem_addr_sel);  
	// END of defining decoder ports 
	
	// state register
	reg	[4:0]	current_state;
	reg	[4:0]	next_state;


	localparam	SP   = 13;	// SP address

	localparam	INIT 	= 5'b00000;
	localparam	ADDSP 	= 5'b00001;
	localparam	SUBSP  	= 5'b00010;
	localparam	MOVS	= 5'b00011;
	localparam	MOV	= 5'b00100;
	localparam	ADDS	= 5'b00101;
	localparam	LDRPC	= 5'b00110;
	localparam	LDR	= 5'b00111;
	localparam	STR	= 5'b01000;
	localparam	BN	= 5'b01001;
	localparam	CMP	= 5'b10000;
	localparam	BLEN	= 5'b11000;
	localparam	POP  	= 5'b01010;
	localparam	PUSH 	= 5'b01011;


	always @ (posedge clk) begin
		if(rst == 1) begin
			
			current_state	<= INIT;
		end
		else begin
			current_state	<= next_state;
		end
	end
	
	always @ ( posedge clk) begin
		case (current_state)
			INIT	: begin

				if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end
			end
// ADD(SP) ---------------------------------------------------------------------------------
			ADDSP	: begin
			
				if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
			end
// SUB(SP) ---------------------------------------------------------------------------------
			SUBSP	: begin
							if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end
// MOVS ---------------------------------------------------------------------------------
			MOVS	: begin
							if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
			
			end
// MOV----------------------------------------------------------------------------------
			MOV	: begin
							if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
			
			end
// ADDS ---------------------------------------------------------------------------------
			ADDS	: begin
						if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end

// LDRPC ---------------------------------------------------------------------------------
			LDRPC	: begin
				if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	

			end
// LDR ---------------------------------------------------------------------------------
			LDR	: begin
							if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end
// STR ---------------------------------------------------------------------------------
			STR	: begin
						if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end	
// BN ---------------------------------------------------------------------------------
			BN	: begin
						if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
			end
// CMP ---------------------------------------------------------------------------------
			CMP	: begin
						if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end
// BLEN ---------------------------------------------------------------------------------
			BLEN	: begin
				if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end
// default ---------------------------------------------------------------------------------
			default	: begin
						if (i_5_control_opcode == ADDSP) begin
					next_state		<= ADDSP;
					or_4_fwd_wr_addr_from_cu<='h0;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;
				end
				else if (i_5_control_opcode == SUBSP) begin
					next_state		<= SUBSP;
					or_4_fwd_wr_addr_from_cu<= SP;
					or_4_rd1_addr_from_cu	<= SP; 	
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= SUBSP;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOVS) begin
					next_state		<= MOVS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= MOVS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == MOV) begin
					next_state		<= MOV;
					or_4_fwd_wr_addr_from_cu<= i_8_control_imm[3:0];
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 1;
					or_2_fwd_wr_sel	     	<= 2'b10;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= MOV;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == ADDS) begin
					next_state		<= ADDS;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0; 	
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= ADDS;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 'h0;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 'h0;

				end
				else if (i_5_control_opcode == LDRPC) begin
					next_state		<= LDRPC;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 4'hf; 	// giving PC alias
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b01;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDRPC;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;

				end
				else if (i_5_control_opcode == LDR) begin
					next_state		<= LDR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 'h0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR;
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 'h0;
					or_1_mem2reg_sel     	<= 1;
					or_1_reg_wr_en	     	<= 1;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == STR) begin
					next_state		<= STR;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= LDR; // similar 
					or_1_branch	     	<= 'h0;
					or_1_mem_wr_en	     	<= 1; // writing now
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 1;
				end
				else if (i_5_control_opcode == BN) begin
					next_state		<= BN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == CMP) begin
					next_state		<= CMP;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= i_8_control_imm[2:0];
					or_1_rd1_addr_sel    	<= 1;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 1;
					or_5_alu_control     	<= CMP;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				end
				else if (i_5_control_opcode == BLEN) begin
					next_state		<= BLEN;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 0;
					or_1_rd1_addr_sel    	<= 0;	
					or_1_rd2_addr_sel    	<= 0;
					or_2_fwd_wr_sel	     	<= 2'b00;
					or_1_alu_in2_sel     	<= 0;
					or_5_alu_control     	<= BLEN;
					or_1_branch	     	<= 1;
					or_1_mem_wr_en	     	<= 0; 
					or_1_mem2reg_sel     	<= 0;
					or_1_reg_wr_en	     	<= 0;
					or_1_mem_addr_sel    	<= 0;
				

				end
				else begin
					next_state		<= INIT;
					or_4_fwd_wr_addr_from_cu<= 'h0;
					or_4_rd1_addr_from_cu	<= 'h0;
					or_1_rd1_addr_sel	<= 'h0;
					or_1_rd2_addr_sel	<= 'h0;
					or_2_fwd_wr_sel		<= 'h0;
					or_1_alu_in2_sel	<= 'h0;
					or_5_alu_control	<= 'h0;
					or_1_branch		<= 'h0;
					or_1_mem_wr_en		<= 'h0;
					or_1_mem2reg_sel	<= 'h0;
					or_1_reg_wr_en		<= 'h0;
					or_1_mem_addr_sel	<= 'h0; 	

				end	
	
			end
		endcase
	end
endmodule	
