module sigdelay (
    input   logic       clk,
    input   logic       wr,
    input   logic       rd,
    input   logic       rst,
    input   logic[7:0]  mic_signal_in,
    input   logic[7:0]  offset,
    output  logic[7:0]  delayed_signal,
    output  logic[7:0]  mic_signal_out
);

    logic [8:0] addr;

counter myCounter (
    .clk    (clk),
    .rst    (rst),
    .dout   (addr)
);  

ram myRam (
    .wr_en      (wr),
    .rd_en      (rd),
    .wr_addr    (addr),
    .rd_addr    (addr + offset),
    .clk        (clk),
    .din        (mic_signal_in),
    .dout       (delayed_signal)
);

    always_ff @(posedge clk)
        mic_signal_out <= mic_signal_in;

endmodule 
