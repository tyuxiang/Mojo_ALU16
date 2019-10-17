/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comp_6 (
    input z,
    input v,
    input n,
    input [1:0] alufn,
    output reg [15:0] answer
  );
  
  
  
  always @* begin
    answer = 4'bxxxx;
    if (alufn == 2'h1) begin
      answer = 16'h0000;
      answer[0+0-:1] = z;
    end
    if (alufn == 2'h2) begin
      answer = 16'h0000;
      answer[0+0-:1] = (n ^ v);
    end
    if (alufn == 2'h1) begin
      answer = 16'h0000;
      answer[0+0-:1] = z | (n ^ v);
    end
  end
endmodule
