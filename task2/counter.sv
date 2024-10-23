module counter#(
  parameter WIDTH = 8
)(
  // interface signals
  input  logic             clk,      // clock
  input  logic             rst,      // reset
  input  logic             en,       // load counter from data
  input  logic [WIDTH-1:0] incr,     // value to preload
  output logic [WIDTH-1:0] dout     // count output
);

always_ff @ (posedge clk)
  if (rst) dout <= {WIDTH{1'b0}};
  else     dout <= dout + incr;

endmodule
