module TrafficLight_FSM(
    input clk, rst,
    output reg [2:0] lights // Red-Yellow-Green
);
    
    typedef enum reg [1:0] {RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10} state_t;
    state_t state, next_state;
    
    reg [3:0] timer;

    // State transition on clock edge
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            timer <= 0;
        end
        else begin
            if (timer == 4'd10 && state == RED) begin
                state <= GREEN;
                timer <= 0;
            end
            else if (timer == 4'd8 && state == GREEN) begin
                state <= YELLOW;
                timer <= 0;
            end
            else if (timer == 4'd3 && state == YELLOW) begin
                state <= RED;
                timer <= 0;
            end
            else begin
                timer <= timer + 1;
            end
        end
    end

    // Output logic
    always @(*) begin
        case (state)
            RED:    lights = 3'b100;
            GREEN:  lights = 3'b001;
            YELLOW: lights = 3'b010;
            default: lights = 3'b100;
        endcase
    end

endmodule