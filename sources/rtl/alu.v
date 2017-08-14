module alu # (
	parameter 	REG_WIDTH=16)(
	input	wire	clk,
	input	wire	[REG_WIDTH-1:0]	i_R_alu_in1,
	input	wire	[REG_WIDTH-1:0]	i_R_alu_in2,
	input	wire 	[4:0]		i_5_alu_opcode,
	output 	reg	[REG_WIDTH-1:0]	or_R_alu_out,
	output 	reg			or_1_alu_zero);
	
	localparam 	NULL	= 5'b00000;
	localparam 	ADDSP	= 5'b00001;
	localparam	SUBSP	= 5'b00010;
	localparam	MOVS	= 5'b00011;
	localparam	MOV	= 5'b00100;
	localparam	ADDS	= 5'b00101;
	localparam	LDRPC	= 5'b00110;
	localparam	LDR	= 5'b00111;
	localparam	BN	= 5'b01001;
	localparam	CMP	= 5'b10000;
	localparam	BLEN	= 5'b11000;
//	localparam	MUL    	= 5'b00011;
//	localparam	AND    	= 5'b00100;
//	localparam	OR    	= 5'b00101;
//	localparam	XOR    	= 5'b00110;
//	localparam	COMP    = 5'b00111;
	always @(posedge clk) begin
		case (i_5_alu_opcode)
			ADDSP	: begin
					or_R_alu_out 	<= i_R_alu_in1 + ({{REG_WIDTH-8}*{1'b0},i_R_alu_in2[7:0]}<<2);
					or_1_alu_zero 	<= 0;
			end
            		SUBSP  	: begin
					or_R_alu_out 	<= i_R_alu_in1 - {{REG_WIDTH-7}*{1'b0},(i_R_alu_in2[6:0]<<2)};
					or_1_alu_zero 	<= 0;
			end
            		MOVS  	: begin
					or_R_alu_out 	<= {{REG_WIDTH-8}*{1'b0},i_R_alu_in2[7:0]};
					or_1_alu_zero	<= 0;
			end
			MOV  	: begin
					or_R_alu_out 	<= i_R_alu_in2;
					or_1_alu_zero	<= 0;
			end
			ADDS  	: begin
					or_R_alu_out 	<= i_R_alu_in1+ {{REG_WIDTH-3}*{1'b0},i_R_alu_in2[8:6]};
					or_1_alu_zero	<= 0;
			end
			LDRPC	: begin
					if ((i_R_alu_in2[1]) || (i_R_alu_in2[3]&&(!i_R_alu_in2[0]))) begin
						or_R_alu_out 	<= i_R_alu_in1 + ({{REG_WIDTH-8}*{1'b0},i_R_alu_in2[7:0]}<<2)+2;
					end
					else begin
						or_R_alu_out 	<= i_R_alu_in1 + ({{REG_WIDTH-8}*{1'b0},i_R_alu_in2[7:0]}<<2);
					end
					or_1_alu_zero 	<= 0;
			end
			LDR	: begin
					or_R_alu_out 	<= i_R_alu_in1 + {{REG_WIDTH-7}*{1'b0},i_R_alu_in2[10:6],2'b00};
					or_1_alu_zero 	<= 0;
			end
			BN	: begin
					or_R_alu_out 	<= 0;
					or_1_alu_zero 	<= 1;
			end
			CMP	: begin
					//{or_1_alu_zero,or_R_alu_out} 	<= {1'b0,8'h00, i_R_alu_in2[7:0]} - {1'b0,i_R_alu_in1}-{16'h0000,1'b1};
					if(i_R_alu_in2[7:0]>i_R_alu_in1[7:0]) begin
						or_1_alu_zero 	<=0;
						or_R_alu_out	<=0;
					end 
					else begin
						or_1_alu_zero 	<=1;
						or_R_alu_out	<=0;
					end
					//{or_1_alu_zero,or_R_alu_out[15:8]} 	<= {1'b0,i_R_alu_in2[7:0]} - {i_R_alu_in1[8:0]}-{8'h00,1'b1};
			end
			BLEN	: begin
					or_R_alu_out 	<= 0;
					or_1_alu_zero 	<= 1;
			end

			default : begin 
					or_R_alu_out 	<= 'h0;
					or_1_alu_zero 	<= 'h0;
			end
		endcase
	end
endmodule
