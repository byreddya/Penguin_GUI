module prng(
    input clk,
    input reset,
    output reg random_number
);

    parameter SEED = 7'd1; // Initial seed
    parameter POLYNOMIAL = 7'b1100000; // 6th-degree polynomial: x^6 + x^5 + x^3 + x^2 + 1

  reg [6:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= SEED;
        end else begin
            // Calculate the LFSR output
          random_number <= state[6]; // The least significant bit is the random output

            // Shift the state left and apply the feedback polynomial
          state <= {state[5:0], (state[6] ^ state[5])};
        end
    end

endmodule