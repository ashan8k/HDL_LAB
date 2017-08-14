

// pattern 1 - only combinational logic
assign // only blocking assignments, i.e. "="

always@(*) begin
	// only blocking assignments, i.e. "="
end

// pattern 2 - only sequential logic
always@(posedge clk) begin
	if(rst) begin
		// only non-blocking assignments, i.e. "<="
		// only constants on right-hand side
	end else begin
		// only non-blocking assignments, i.e. "<="
		// only variables or constants (no logic operators) on right-hand side
	end
end

// pattern 3 - only sequential logic
always@(posedge clk) begin
	if(rst) begin
		// only non-blocking assignments, i.e. "<="
		// only constants on right-hand side
	end else begin
		// only non-blocking assignments, i.e. "<="
		// logical operations allowed on right-hand side
	end
end
