module TrafficLight_TB;
    reg clk, rst;
    wire [2:0] lights;
    
    // Instantiate FSM module
    TrafficLight_FSM fsm_inst (.clk(clk), .rst(rst), .lights(lights));
   
    // Clock generation (10 time units period)
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        #10 rst = 0;
        
        // Run simulation for enough time to check all states
        #300;
        
        // End simulation
        $finish;
    end
    
    initial begin
        $dumpfile("traffic_light.vcd"); 
        $dumpvars(0, TrafficLight_TB);
        $monitor("Time=%0t | State Lights=%b", $time, lights);
    end
endmodule