module TLC_tb;

  // Inputs
  reg s;       // Sensor input
  reg rst;     // Reset input
  reg clk;     // Clock input

  // Outputs
  wire [1:0] main;   // Main road output
  wire [1:0] side;   // Side road output
  
  // Instantiate TLC module
  TLC DUT (
    .sensor(s),
    .clock(clk),
    .reset(rst),
    .main_road(main),
    .side_road(side)
  );

  initial begin
  // Clock Generation
  forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

  // Initial Stimulation
  initial begin
    rst = 1;        // Assert reset
    #10;            // Hold reset for 10 time units
    rst = 0;        // Deassert reset
    
    #100;           // Wait for some time
    
    s = 1;          // Simulate sensor detecting vehicles/pedestrians on side road
    #100;           // Wait for some time
    
    s = 0;          // Simulate no detection on side road
    #100;           // Wait for some time
    
    $finish;        // End simulation
  end

  // Dump VCD file and monitor signals
  initial begin
    $dumpfile("TLC_tb.vcd");
    $dumpvars(0, TLC_tb);
    $monitor("time=%0t, sensor=%b, rst=%b, main=%b, side=%b", $time, s, rst, main, side);
    #600;           // Run simulation for 600 time units
    $finish;        // End simulation
  end

endmodule
