// Decode module top level
// Group 3
// Author: Ashan Shanaka Liyanage 
// ashan8k@gmail.com

module decode (
	
	// inputs 
	input	wire	[15:0] 	decode_in,
	// outputs 
	output	reg	[4:0] 	decoded_opcode,
	output	reg	[7:0] 	decoded_imm);
	// END of defining decoder ports 

	localparam	NULL 	= 5'b00000;
	localparam	ADDSP	= 5'b00001;
	localparam	SUBSP	= 5'b00010;
	localparam	MOVS	= 5'b00011;
	localparam	MOV	= 5'b00100;
	localparam	ADDS	= 5'b00101;
	localparam	LDRPC	= 5'b00110;
	localparam	LDR	= 5'b00111;
	localparam	STR	= 5'b01000;
	localparam	BN	= 5'b01001;
	localparam	CMP	= 5'b10000;	// MSB bit is used for pc_branch
	localparam	BLEN	= 5'b11000;	// MSB 2nd bit is used for pc_branch
	localparam	POP  	= 5'b01010;
	localparam	PUSH 	= 5'b01011;
	// decoding logic
	always @ (decode_in) begin
		casez (decode_in[15:10])
			
		6'b10101?: begin // Addition version v1, ADD sp + value and store it rd
				decoded_opcode	= ADDSP;
				decoded_imm	= 'h0; 
			end
		6'b101100: begin
				decoded_opcode	= SUBSP;
				decoded_imm	= 'h0;
			end	
		6'b00100?: begin
				decoded_opcode	= MOVS;
				decoded_imm	= 'h0;
			end		
		6'b010001: begin
				decoded_opcode	= MOV;
				decoded_imm	= {4'b0000,decode_in[7],decode_in[2:0]};
			end		
		6'b000111: begin
				decoded_opcode	= ADDS;
				decoded_imm	= 'h0;
			end
		6'b01001?: begin
				decoded_opcode	= LDRPC;
				decoded_imm	= 'h0;
			end	
		6'b01101?: begin
				decoded_opcode	= LDR;
				decoded_imm	= 'h0;
			end
		6'b01100?: begin
				decoded_opcode	= STR;
				decoded_imm	= 'h0;
			end
		6'b11100?: begin
				decoded_opcode	= BN;
				decoded_imm	= 'h0;
			end		
		6'b00101?: begin
				decoded_opcode	= CMP;
				decoded_imm	= {5'b00000,decode_in[10:8]};
			end	
		6'b10110?: begin
				decoded_opcode	= PUSH;
				decoded_imm	= decode_in[7:0]; 
			end
		6'b10111?: begin
				decoded_opcode	= POP;
				decoded_imm	= decode_in[7:0]; 
			end
		6'b110111: begin
				decoded_opcode	= BLEN;
				decoded_imm	= decode_in[7:0]; 
			end
		default: begin
				decoded_opcode	= NULL;
				decoded_imm	= 'h0; 				
			end
		endcase
	end
	
endmodule 
