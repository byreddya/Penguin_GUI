// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
module tb_prng;

    // Inputs to the Device Under Test (DUT)
    reg clk;
    reg reset;

    // Output from the DUT
    wire [31:0] random_number;

    // Instantiate the Device Under Test (DUT)
    prng uut (
        .clk(clk),
        .reset(reset),
        .random_number(random_number)
    );

    // Generate clock signal
    always begin
        #5 clk = ~clk; // Clock period = 10 units
    end

    // Test procedure
    initial begin
        // Initialize inputs
      $dumpfile("dump.vcd"); $dumpvars;  
      clk = 0;
        reset = 0;

        // Apply reset
        reset = 1;  // Apply reset to initialize the state
        #10;
        reset = 0;  // Release reset

        // Observe the random number after reset
        #20;
        // Run the PRNG for several clock cycles to generate random numbers
        #100; // Wait for some time to see several generated random numbers

        // Apply reset again to check if it resets the random number to the initial seed
        reset = 1;
        #10;
        reset = 0;
        
        // Wait to observe the random number after reset
        #50;

        // End the simulation
        $finish;
    end

    // Monitor the random number
    initial begin
        $monitor("Time = %0t, Reset = %b, Random Number = %h", $time, reset, random_number);
    end

endmodule
