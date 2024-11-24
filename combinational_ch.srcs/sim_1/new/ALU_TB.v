`timescale 1ns / 1ps  // Define the time unit and precision for simulation

// Testbench module for the ALU
module ALU_TB();

  // Declare testbench variables
  reg [3:0] a;         // 4-bit input operand 'a'
  reg [3:0] b;         // 4-bit input operand 'b'
  reg [1:0] op;        // 2-bit operation selector (op)
  wire [7:0] res;      // 8-bit output for the result from the ALU

  // Instantiate the ALU module under test (DUT)
			  
			  
			   
				 
  
  ALU DUT_ALU(a, b, op, res); 

  // Test stimulus
  initial begin
    // Display results in the console using the $monitor system task
    // Format: "operand1 operator operand2 = result"
    // The operator is dynamically displayed based on the `op` value:
    // 00: '+', 01: '*', 10: '%', 11: '&'
    $monitor("\n%d %c %d = %d\n", 
             a, 
             (op[1] ? (op[0] ? '&' : '%') : (op[0] ? '*' : '+')), 
             b, 
             res);

    // Test addition (op = 00)
    a = 2; b = 3; op = 0; #10;   // Add 2 and 3
    a = 3; b = 4; #10;           // Add 3 and 4
    a = 10; b = 9; #10;          // Add 10 and 9
    a = 15; b = 15; #10;         // Add 15 and 15

    // Test multiplication (op = 01)
    a = 2; b = 3; op = 1; #10;   // Multiply 2 and 3
    a = 3; b = 4; #10;           // Multiply 3 and 4
    a = 10; b = 9; #10;          // Multiply 10 and 9
    a = 15; b = 15; #10;         // Multiply 15 and 15

    // Test modulus (op = 10)
    a = 2; b = 3; op = 2; #10;   // Modulus 2 % 3
    a = 3; b = 4; #10;           // Modulus 3 % 4
    a = 10; b = 9; #10;          // Modulus 10 % 9
    a = 15; b = 15; #10;         // Modulus 15 % 15

    // Test bitwise AND (op = 11)
    a = 2; b = 3; op = 3; #10;   // Bitwise AND of 2 and 3
    a = 3; b = 4; #10;           // Bitwise AND of 3 and 4
    a = 10; b = 9; #10;          // Bitwise AND of 10 and 9
    a = 15; b = 15; #10;         // Bitwise AND of 15 and 15

    // End simulation
    $stop; // Stops the simulation
  end
endmodule
