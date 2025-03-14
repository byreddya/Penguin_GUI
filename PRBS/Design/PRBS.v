module prng(
    input clk,
    input reset,
    input [6:0] seed,
    input [1:0] mode, // 00: 7-bit, 01: 9-bit
    output reg [31:0] random_number
);

    parameter POLYNOMIAL_7 = 7'b1100000; // 6th-degree polynomial: x^6 + x^5 + 1
    parameter POLYNOMIAL_9 = 9'b100010000; // 8th-degree polynomial: x^8 + x^5 + 1

	reg start;
    reg [8:0] feedback;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            random_number <= 32'd0;
          	feedback <= 9'd0;
          	start <= 1'b0;
        end else begin
            // Determine the polynomial based on the mode
            if (mode == 2'b00) begin
              feedback <={2'd0,POLYNOMIAL_7};
              start <=1 ;
            end else begin
                feedback <= POLYNOMIAL_9;
              start <= 1;
            end
        end
     end
      
      always @(posedge clk or posedge reset) begin
        if (reset) begin
            random_number <= 32'd0;
        end else if (start) begin
            // Calculate the LFSR output
            if (mode == 2'b00) begin
                feedback[6:0] <= {feedback[5:0],(feedback[6]^feedback[5])};
              random_number <= {25'd0,feedback};
            end else begin
                feedback[8:0] <= {feedback[7:0],(feedback[8]^feedback[5])};
                random_number <= {23'd0,feedback};
            end

        end
    end

endmodule