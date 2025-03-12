module tb_full_adder;
    // Declare testbench signals
    reg A, B, CIN;  // Inputs to the full adder
    wire SUM, COUT; // Outputs from the full adder

    // Instantiate the full adder module
    full_adder FA (
        .A(A),
        .B(B),
        .CIN(CIN),
        .SUM(SUM),
        .COUT(COUT)
    );

    // Test all input combinations
    initial begin
        // Display header for the results
        $display("A B CIN | SUM COUT");
        $display("-------------------");

        // Test vector 1: A = 0, B = 0, CIN = 0
        A = 0; B = 0; CIN = 0;
        #10;  // Wait for 10 time units
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 2: A = 0, B = 0, CIN = 1
        A = 0; B = 0; CIN = 1;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 3: A = 0, B = 1, CIN = 0
        A = 0; B = 1; CIN = 0;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 4: A = 0, B = 1, CIN = 1
        A = 0; B = 1; CIN = 1;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 5: A = 1, B = 0, CIN = 0
        A = 1; B = 0; CIN = 0;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 6: A = 1, B = 0, CIN = 1
        A = 1; B = 0; CIN = 1;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 7: A = 1, B = 1, CIN = 0
        A = 1; B = 1; CIN = 0;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // Test vector 8: A = 1, B = 1, CIN = 1
        A = 1; B = 1; CIN = 1;
        #10;
        $display("%b %b %b | %b %b", A, B, CIN, SUM, COUT);

        // End the simulation
        $finish;
    end
endmodule
