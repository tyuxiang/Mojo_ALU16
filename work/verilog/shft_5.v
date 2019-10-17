/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shft_5 (
    input [15:0] firstNumber,
    input [4:0] secondNumber,
    input [1:0] alufn,
    output reg [15:0] answer
  );
  
  
  
  always @* begin
    answer = 4'bxxxx;
    if (alufn == 1'h0) begin
      answer = firstNumber << secondNumber;
    end
    if (alufn == 1'h1) begin
      answer = firstNumber >> secondNumber;
    end
    if (alufn == 4'hb) begin
      answer = firstNumber >>> secondNumber;
    end
  end
endmodule
