 `timescale 1 ns / 1 ps

module execute(
	clock,
	op0,
	op1,
	sel,
	alu_out
);
	
input wire  clock;
input wire [31:0] op0;
input wire [31:0] op1;
input wire sel;
output reg [31:0] alu_out;

reg [31:0] op0r;
reg [31:0] op1r;
reg [ 1:0] selr;

reg [31:0] result ;
  
always@ (*) begin
	if(selr) begin 
		result= op0r + op1r;
	end else begin
		result= op0r - op1r;  
	end
end
  
always @ ( posedge clock) begin
	op0r <= op0;
	op1r <= op1;
	selr <= sel;
	alu_out<=result;
end

endmodule 
