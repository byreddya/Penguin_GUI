module shift_register (
    input clk,          // Clock signal
    input reset,        // Reset signal
    input shift_in,     // Input data to be shifted in
    input shift_left,   // Control signal for left shift (1 for left shift, 0 for right shift)
    output reg [7:0] q  // 8-bit register output
);

    // Shift register logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 8'b00000000;  // Reset the register to 0
        end else begin
            if (shift_left) begin
                q <= {q[6:0], shift_in};  // Left shift (shift in goes to LSB)
            end else begin
                q <= {shift_in, q[7:1]};  // Right shift (shift in goes to MSB)
            end
        end
    end

endmodule
