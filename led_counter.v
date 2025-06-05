module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);
    //
    localparam CLK = CLK_FREQ - 1;

    reg [31:0] counter;
    reg [7:0] _leds;

    always @(posedge clk or negedge clk) begin
        if (!rst_n) begin
            counter  = 32'b0;
            _leds    = 8'b0;
        end else begin
            if (counter >= CLK) begin
                counter <= 32'b0;
                _leds   <= _leds+1;
            end else begin
                counter <= counter+1;
            end
        end
    end

    assign leds = _leds;

endmodule
