module rom #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input logic     clk,         // input clock
    input logic[ADDRESS_WIDTH-1:0]     addr1,     // serial data in
    output logic[DATA_WIDTH-1:0]     dout1,  // serial data out
    input logic[ADDRESS_WIDTH-1:0]     addr2,     // serial data in
    output logic[DATA_WIDTH-1:0]     dout2    // serial data out
);

    logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

    initial begin
            $display("Loading rom");
            $readmemh("sinerom.mem", rom_array);
    end;

    always_ff @(posedge clk)
        begin
            dout1 <= rom_array[addr1];
            dout2 <= rom_array[addr2];
        end
            
endmodule
