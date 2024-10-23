module ram #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
) (
    input   logic                       clk,        // input clock
    input   logic                       rd_en,      // read enable 
    input   logic                       wr_en,      // write enable 
    input   logic[A_WIDTH-1:0]          rd_addr,    // address 1
    input   logic[A_WIDTH-1:0]          wr_addr,    // address 2
    input   logic[D_WIDTH-1:0]          din,        // serial data in port 1
    output  logic[D_WIDTH-1:0]          dout        // serial data out port 1
);

    logic[D_WIDTH-1:0] ram_array [2**A_WIDTH-1:0];

    always_ff @(posedge clk)
        begin
            if (wr_en == 1'b1)
                ram_array[wr_addr] <= din;
            if (rd_en == 1'b1)
                dout <= ram_array[rd_addr];
        end
        
endmodule