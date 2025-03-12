module full_adder(
    input A,        // Input A
    input B,        // Input B
    input CIN,      // Carry input
    output SUM,     // Sum output
    output COUT     // Carry output
);
    wire HA1_SUM, HA1_CARRY, HA2_CARRY;

    // First half adder
    half_adder HA1(
        .A(A),
        .B(B),
        .SUM(HA1_SUM),
        .CARRY(HA1_CARRY)
    );

    // Second half adder
    half_adder HA2(
        .A(HA1_SUM),
        .B(CIN),
        .SUM(SUM),
        .CARRY(HA2_CARRY)
    );

    // OR the carries from both half adders to get final carry out
    assign COUT = HA1_CARRY | HA2_CARRY;

endmodule