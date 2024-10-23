module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input logic clk,         // clock
    input logic rst,         // reset trigger
    input logic en,          // counter enable
    input logic [D_WIDTH-1:0] incr,
    output logic [D_WIDTH-1:0] data_out1,   // output 1
    output logic [D_WIDTH-1:0] data_out2   // output 2
);

    logic [A_WIDTH-1:0] addr;
    
counter myCounter (
    .incr (incr),
    .rst (rst),
    .en (en),
    .clk (clk),
    .dout (addr)
);

rom myRom1 (
    .clk (clk),
    .addr1 (addr),
    .dout1 (data_out1),
    .addr2 (addr + incr),
    .dout2 (data_out2)
);


endmodule
