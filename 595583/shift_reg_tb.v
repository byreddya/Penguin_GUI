`timescale 1ns / 1ps

module tb_shift_register;

    // Testbench signals
    reg clk;
    reg reset;
    reg shift_in;
    reg shift_left;
    wire [7:0] q;

    // Instantiate the shift_register module
    shift_register uut (
        .clk(clk),
        .reset(reset),
        .shift_in(shift_in),
        .shift_left(shift_left),
        .q(q)
    );

    // Clock generation (period 10 ns for 100 MHz clock)
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 ns (10 ns period)
    end

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        shift_in = 0;
        shift_left = 0;

        // Apply reset
        $display("Applying reset...");
        reset = 1;
        #10;  // Wait for 10 ns
        reset = 0;

        // Test 1: Shift left operation
        $display("Shifting left...");
        shift_in = 1; // Apply 1 as shift input
        shift_left = 1; // Shift left signal enabled
        #10;  // Wait for a clock cycle
        shift_in = 0; // Apply 0 as shift input
        #10;  // Wait for a clock cycle

        // Test 2: Shift right operation
        $display("Shifting right...");
        shift_in = 1; // Apply 1 as shift input
        shift_left = 0; // Shift right signal enabled
        #10;  // Wait for a clock cycle
        shift_in = 0; // Apply 0 as shift input
        #10;  // Wait for a clock cycle

        // Test 3: Shift left with a different pattern
        $display("Shifting left with different pattern...");
        shift_in = 1;  // Apply 1 as shift input
        shift_left = 1; // Shift left signal enabled
        #10;
        shift_in = 1;  // Apply 1 as shift input again
        #10;
        shift_in = 0;  // Apply 0 as shift input
        #10;

        // Test 4: Shift right with another pattern
        $display("Shifting right with another pattern...");
        shift_in = 1;  // Apply 1 as shift input
        shift_left = 0; // Shift right signal enabled
        #10;
        shift_in = 0;  // Apply 0 as shift input
        #10;
        shift_in = 1;  // Apply 1 as shift input
        #10;

        // Test 5: Reset during operation
        $display("Testing reset during operation...");
        reset = 1;
        #10; // Wait for reset to propagate
        reset = 0; // Release reset
        
        // Final check: check the value of the register after reset
        $display("Final register value: %b", q);

        // End of simulation
        $finish;
    end

endmodule
