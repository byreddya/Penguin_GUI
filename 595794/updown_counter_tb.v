module tb_updown_counters;
    reg clk, rst, enable, up_down;
    wire [3:0] sync_count;
    wire [3:0] async_count;

    sync_updown_counter sync_uut (
        .clk(clk), .rst(rst), .enable(enable), .up_down(up_down), .count(sync_count)
    );
    
  

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; enable = 0; up_down = 1;
        #10 rst = 0; enable = 1;
        
        // Count Up
        #50 up_down = 1;
        
        // Count Down
        #50 up_down = 0;
        
        // Disable Counting
        #20 enable = 0;
        
        #20 $finish;
    end

    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
        $monitor("Time = %d, Sync Count = %b, Async Count = %b", $time, sync_count, async_count);
    end
endmodule