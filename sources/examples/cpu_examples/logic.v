// replication
const integer width = 12;
assign mysignal = {width{1'b0}};	// twelve zeros
assign mysignal = {12{1'b1}};		// twelve ones

// concatenation
logic [7:0] op1;
logic [7:0] op2;
logic [7:0] sum;
logic ci, co;
assign {co, sum} = op1+op2+ci;

logic [7:0] ones_and_zeros;
assign ones_and_zeros = 8'b11110000;
assign ones_and_zeros = {4'b1111, 4'b0000};

const logic [3:0] ones = 4'b1111;
const logic [3:0] zeros = 4'b0000;

assign ones_and_zeros = {ones, zeros};

// concatenation and replication
assign ones_and_zeros = {{4{1'b1}}, {4{1'b0}}};

//other useful functions:
$readmemb()
$readmemh()
$clog2() 
