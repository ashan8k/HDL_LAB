module testbench();

// PARAMETERS
parameter bus_width_param   = 32;
parameter addr_width_param  = 23;

// INTERNAL SIGNALS
logic clk;
logic rst;
logic en;
logic [bus_width_param-1:0]	din;
logic [bus_width_param-1:0]	dout;

// MODULE INSTANTIATION
example
#(  .bus_width (bus_width_param),
    .addr_width(addr_width_param)) 
dut
(   .clk (clk),
    .rst (rst),
    .en  (en),
    .din (din),
    .dout(dout)
);

//memory ...
//clk_gen ...
//rst_gen ...
endmodule;