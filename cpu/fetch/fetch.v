// Fetch program developed for the HDL LAB for ARM cpu
// Group 3
// Developed by Ashan Shanaka Liyanage 
// ashan8k@gmail.com
module fetch(
	parameter 	MBUS_WIDTH = 8,			// Data width of the bus
	parameter 	ADDR_WIDTH = 32,		// Mem Address width
	parameter	MDR_WIDTH  = 16)(		// MDR width
	
	input 		clk,				// clock
	input 		reset_n,			// reset active LOW
	input 		read_enable,			// Enable the fetcher to fetch 
	input		[ADDR_WIDTH-1:0]mem_addr,	// Memory Address Ex: ARM 32  bits 
	input 		[MBUS_WIDTH]mem,		// 1 byte data wide data 
	output reg	[MDR_WIDTH-1:0]mem_data,	// Data from memory
	output reg	data_ready);			// When Data is ready active HIGH
	
	always@(posedge clk) begin
		if(!reset_n) begin
			data_ready <= 0;
			mem_data   <= 'h0;
		end
	end
	
	always@(posedge clk) begin
		if(read_enable) begin
			mem_data   <= {mem[mem_addr],mem[mem_addr+1]};	// fetching two bytes at once 
			data_ready <= 1;
		end
		else begin
			data_ready <= 0;
		end
	end
	
endmodule 
