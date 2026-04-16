module test;

reg clk, reset;
wire red, yellow, green;

traffic_light tl(clk, reset, red, yellow, green);

// clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, test);

    clk = 0;
    reset = 1; #10;
    reset = 0;

    #100;

    $finish;
end

initial begin
    $monitor("Time=%0t | R=%b Y=%b G=%b", $time, red, yellow, green);
end

endmodule
