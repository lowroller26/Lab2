module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input logic clk,         // clock
    input logic rst,         // reset trigger
    input logic en,          // counter enable
    input logic [D_WIDTH-1:0] incr,
    output logic [D_WIDTH-1:0] data_out   // output   
);

    logic [A_WIDTH-1:0] addr;
    
counter myCounter (
    .incr (incr),
    .rst (rst),
    .en (en),
    .clk (clk),
    .dout (addr)
);

rom myRom (
    .clk (clk),
    .addr (addr),
    .dout (data_out)
);

endmodule
