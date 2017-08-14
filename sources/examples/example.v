module example(
	//coding style: declare all ports only with their plain names here
	clk,
	rst,
	en,
	din,
	dout
);

//PARAMETERS
//coding style: use capitals
parameter BUS_WIDTH  = 32;

// PORT DEFINITIONS
// coding style: define port direction and size here
input  logic 					clk;
input  logic					rst;
input  logic					en;
input  logic [BUS_WIDTH-1:0]	din;
output logic [BUS_WIDTH-1:0]	dout;

//INTERNAL SIGNALS
//coding style: lower case, use underscores if need be
logic [BUS_WIDTH-1:0]			ls5;

// VERBOSE STATE-TYPE DEFINITON + VARIABLE INSTANTIATION
typedef enum { IDLE_STATE, BUSY_STATE } STATE_TYPE;
STATE_TYPE state;


// COMBINATIONAL LOGIC
//coding style: use only blocking assignments, use the * designator to sense all right-hand-side (LHS) signals
always@(*) begin
  ls5	= din << 5;
end
// alternatively use the following: (recommended only for simple blocks)
assign ls5 = din << 5;

// ''LATCHED MEALY'' FSM (REGISTERED OUTPUTS)
// use only non-blocking assignments
always_ff@(posedge clk) begin
	if (rst) begin
		state	<= IDLE_STATE;
		dout	<= 0;
	end else begin
		case (state)
			IDLE_STATE : begin
				state	<= BUSY_STATE;
				dout	<= 0;
			end
			BUSY_STATE : begin
				if (en) begin
					state	<= IDLE_STATE;
					dout	<= ls5;
				end
			end
		endcase
	end
end

endmodule;
