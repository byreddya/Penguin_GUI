module half_adder(
    input A,      // Input A
    input B,      // Input B
    output SUM,   // Sum output
    output CARRY  // Carry output
);
    assign SUM = A ^ B;       // XOR gate for sum
    assign CARRY = A & B;     // AND gate for carry
endmodule