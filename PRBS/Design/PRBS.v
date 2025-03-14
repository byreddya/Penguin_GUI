module prng(
    input clk,
    input reset,
    input [6:0] seed,
    output reg [7:0] random_number
);

    parameter POLYNOMIAL = 7'b1100000; // 6th-degree polynomial: x^6 + x^5 + 1

    reg [6:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= seed;
            random_number <= 8'd0;
        end else begin
            // Calculate the LFSR output
            random_number <= {state[6],state}; // The least significant bit is the random output

            // Shift the state left and apply the feedback polynomial
            state <= {state[5:0], (state[6] ^ state[5])};
        end
    end

endmodule