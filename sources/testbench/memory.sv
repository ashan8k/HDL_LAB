// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Modified by M.Sc. Haoyuan Ying, Dual 8-bit Memory Port -> Single 16-bit
// Email: 	boris.traskov@ies.tu-darmstadt.de

`timescale 1 ns / 1 ps

module memory(
	clk,
	en,
	rd_en,
	wr_en,
	addr,
	din,
	dout
);

//stores this many halfwords (1halfword=16bit=2Byte)
parameter	MEM_DEPTH	= 2**12;

//addresses this many Bytes (1Byte = 8bit)
localparam	ADDR_WIDTH	= $clog2(MEM_DEPTH);

// PORTS
input	logic						clk;
input	logic						en;
input	logic						rd_en;
input	logic 					wr_en;
input	logic [15:0]			din;
output	logic [15:0]			dout;
input	logic [ADDR_WIDTH-1:0] 		addr;

// MEM ARRAY AND INTERNAL SIGNALS
logic [15:0] ram [0:MEM_DEPTH-1];
logic [15:0] wr_halfword;
integer wr_i;

// WR_EN DECODER
always_comb begin
	wr_halfword = ram[addr[ADDR_WIDTH-1:0]];
	if (wr_en==1'b1) begin
		wr_halfword = din;
	end
end

// REGISTERED WRITE
always_ff@(posedge clk) begin
	if (en==1'b1) begin
		ram[addr[ADDR_WIDTH-1:0]] <= wr_halfword;
	end
end

// REGISTERED READ
always_ff@(posedge clk) begin
	if (en==1'b1) begin
		if (rd_en==1'b1) begin
			dout <= ram[addr[ADDR_WIDTH-1:0]];
		end
	end
end

endmodule
