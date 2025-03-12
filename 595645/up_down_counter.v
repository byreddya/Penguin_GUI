module sync_updown_counter (
    input clk, rst, enable, up_down,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (rst)
        count <= 4'b0000;
    else if (enable) begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule
