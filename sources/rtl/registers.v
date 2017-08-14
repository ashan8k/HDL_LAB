// Reg block module top level
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module registers # (
	parameter	REG_WIDTH=16)(
	
	// System related ports
	input 	wire	clk,				// clock
	input 	wire	rst,				// reset active HIGH
	 
	input	wire	[3:0]		i_4_rd1_addr,
	input	wire	[3:0]		i_4_rd2_addr,
	input 	wire	[3:0] 		i_4_wr_addr,
	input 	wire 	[REG_WIDTH-1:0] i_R_wr_data,
	input	wire			i_1_reg_wr_en,
	input	wire 	[REG_WIDTH-1:0] i_R_pcplus,
	
	output	reg	[REG_WIDTH-1:0] or_R_rd1_data,
	output	reg	[REG_WIDTH-1:0] or_R_rd2_data
	);
	// END of defining reg_block ports 

	// Defining general purpose and special purpose regs
 	reg	[REG_WIDTH-1:0] reg_array[15:0];
	integer i,j;
	always @ (posedge clk) begin
		if(rst == 1) begin
			or_R_rd1_data	<= 'h0;
			or_R_rd2_data	<= 'h0;
		//	for (i=0; i<16; i=i+1) reg_array[i] <= 'h0;	// initail definition
		//	for (i=0; i<13; i=i+1) reg_array[i]	<= 2*i;	// initail definition
			reg_array[0] <= 0;	
			reg_array[1] <= 0;	
			reg_array[2] <= 1;	
			reg_array[3] <= 1;	
			reg_array[4] <= 0;	
			reg_array[5] <= 0;	
			reg_array[6] <= 0;	
			reg_array[7] <= 0;	
			reg_array[8] <= 0;	
			reg_array[9] <= 0;	
			reg_array[10] <= 0;	
			reg_array[11] <= 0;	
			reg_array[12] <= 0;	
			reg_array[13] <= 16'ha0;	// SP to address x00000a0
			reg_array[14] <= 0;	// LR
			//reg_array[15] <= 'h0;	// PC is not this. using fetch_mem_wr.v's PC value 
		end
		else begin
			if(i_1_reg_wr_en == 0) begin
				or_R_rd1_data	<= (i_4_rd1_addr == 4'b1111) ? i_R_pcplus : reg_array[i_4_rd1_addr];
				or_R_rd2_data	<= (i_4_rd2_addr == 4'b1111) ? i_R_pcplus : reg_array[i_4_rd2_addr];
			end
			else begin
				reg_array[i_4_wr_addr] <= i_R_wr_data;
			end	
		end
	end
	

endmodule 
