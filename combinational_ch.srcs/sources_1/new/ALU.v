`timescale 1ns / 1ps  // Define the time unit and precision for simulation

// ALU module definition
module ALU(
    input [3:0] a,          // 4-bit input operand 'a'
    input [3:0] b,          // 4-bit input operand 'b'
    input [1:0] op,         // 2-bit operation selector
    output reg [7:0] result // 8-bit output for the result of the operation
    );

  // Always block triggered by any changes in the inputs ('a', 'b', or 'op')
  always @ (*) begin
    // Perform operation based on the value of 'op'
    case (op)
      0: result = a + b;    // When op = 00, perform addition
      1: result = a * b;    // When op = 01, perform multiplication
      2: result = a % b;    // When op = 10, perform modulus operation
      3: result = a & b;    // When op = 11, perform bitwise AND
    endcase
  end
endmodule
