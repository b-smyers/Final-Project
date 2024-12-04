module Testbench;
    reg [15:0] a;
    wire [31:0] result;

    // Instantiate the SignExtension module
    SignExtender sign_ext(.a(a), .result(result));

    initial begin
        // Test cases
        a = 16'h0005;  // Positive number
        #10;
        $display("Input: %h, Output: %h", a, result);

        a = 16'hFFFA;  // Negative number
        #10;
        $display("Input: %h, Output: %h", a, result);

        a = 16'h7FFF;  // Maximum positive number
        #10;
        $display("Input: %h, Output: %h", a, result);

        a = 16'h8000;  // Minimum negative number
        #10;
        $display("Input: %h, Output: %h", a, result);

        $finish;
    end
endmodule
