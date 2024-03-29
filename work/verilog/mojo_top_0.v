/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_answer;
  wire [1-1:0] M_alu_n;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_z;
  reg [16-1:0] M_alu_firstNumber;
  reg [16-1:0] M_alu_secondNumber;
  reg [6-1:0] M_alu_alufn;
  new_alu_1 alu (
    .firstNumber(M_alu_firstNumber),
    .secondNumber(M_alu_secondNumber),
    .alufn(M_alu_alufn),
    .answer(M_alu_answer),
    .n(M_alu_n),
    .v(M_alu_v),
    .z(M_alu_z)
  );
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_3 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  mult_seven_seg_4 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_inc;
  mult_dec_ctr_5 dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  wire [1-1:0] M_ctr_value;
  counter_6 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  localparam START_state = 6'd0;
  localparam ZERO_state = 6'd1;
  localparam ONE_state = 6'd2;
  localparam TWO_state = 6'd3;
  localparam THREE_state = 6'd4;
  localparam FOUR_state = 6'd5;
  localparam FIVE_state = 6'd6;
  localparam SIX_state = 6'd7;
  localparam SEVEN_state = 6'd8;
  localparam EIGHT_state = 6'd9;
  localparam NINE_state = 6'd10;
  localparam TEN_state = 6'd11;
  localparam ELEVEN_state = 6'd12;
  localparam TWELVE_state = 6'd13;
  localparam THIRTEEN_state = 6'd14;
  localparam FOURTEEN_state = 6'd15;
  localparam FIFTEEN_state = 6'd16;
  localparam SIXTEEN_state = 6'd17;
  localparam SEVENTEEN_state = 6'd18;
  localparam EIGHTEEN_state = 6'd19;
  localparam NINETEEN_state = 6'd20;
  localparam TWENTY_state = 6'd21;
  localparam TWENTYONE_state = 6'd22;
  localparam TWENTYTWO_state = 6'd23;
  localparam TWENTYTHREE_state = 6'd24;
  localparam TWENTYFOUR_state = 6'd25;
  localparam TWENTYFIVE_state = 6'd26;
  localparam TWENTYSIX_state = 6'd27;
  localparam TWENTYSEVEN_state = 6'd28;
  localparam TWENTYEIGHT_state = 6'd29;
  localparam TWENTYNINE_state = 6'd30;
  localparam THIRTY_state = 6'd31;
  localparam THIRTYONE_state = 6'd32;
  localparam THIRTYTWO_state = 6'd33;
  localparam THIRTYTHREE_state = 6'd34;
  localparam THIRTYFOUR_state = 6'd35;
  localparam THIRTYFIVE_state = 6'd36;
  localparam THIRTYSIX_state = 6'd37;
  localparam THIRTYSEVEN_state = 6'd38;
  localparam THIRTYEIGHT_state = 6'd39;
  localparam THIRTYNINE_state = 6'd40;
  localparam FORTY_state = 6'd41;
  localparam FORTYONE_state = 6'd42;
  localparam FORTYTWO_state = 6'd43;
  localparam INVALID_state = 6'd44;
  localparam ERROR_state = 6'd45;
  
  reg [5:0] M_state_d, M_state_q = START_state;
  
  always @* begin
    M_state_d = M_state_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    M_alu_firstNumber = 16'h0000;
    M_alu_secondNumber = 16'h0000;
    M_alu_alufn = 6'h00;
    M_edge_detector_in = 1'bz;
    M_dec_ctr_inc = 1'h0;
    M_seg_values = 16'bzzzzzzzzzzzzzzzz;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    if (io_button[0+0-:1]) begin
      M_edge_detector_in = M_ctr_value;
      M_seg_values = M_dec_ctr_digits;
      M_dec_ctr_inc = M_edge_detector_out;
      io_seg = ~M_seg_seg;
      io_sel = ~M_seg_sel;
    end
    
    case (M_state_q)
      START_state: begin
        io_led[16+7+0-:1] = 1'h1;
        if (io_button[0+0-:1]) begin
          M_state_d = ZERO_state;
        end
      end
      ZERO_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h00;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = ONE_state;
          if (M_alu_answer != 16'h0003 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      ONE_state: begin
        M_alu_firstNumber = 16'h7fff;
        M_alu_secondNumber = 16'h7fff;
        M_alu_alufn = 6'h00;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWO_state;
          if (M_alu_answer != 16'hfffe | M_alu_z != 1'h0 | M_alu_v != 1'h1 | M_alu_n != 1'h1) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWO_state: begin
        M_alu_firstNumber = 16'h0003;
        M_alu_secondNumber = 16'hffff;
        M_alu_alufn = 6'h00;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THREE_state;
          if (M_alu_answer != 16'h0002 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THREE_state: begin
        M_alu_firstNumber = 16'h8000;
        M_alu_secondNumber = 16'h8000;
        M_alu_alufn = 6'h00;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FOUR_state;
          if (M_alu_answer != 16'h0000 | M_alu_z != 1'h1 | M_alu_v != 1'h1 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FOUR_state: begin
        M_alu_firstNumber = 16'h0003;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h01;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FIVE_state;
          if (M_alu_answer != 16'h0001 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FIVE_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'hffff;
        M_alu_alufn = 6'h01;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = SIX_state;
          if (M_alu_answer != 16'h0002 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      SIX_state: begin
        M_alu_firstNumber = 16'h7fff;
        M_alu_secondNumber = 16'hffff;
        M_alu_alufn = 6'h01;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = SEVEN_state;
          if (M_alu_answer != 16'h8000 | M_alu_z != 1'h0 | M_alu_v != 1'h1 | M_alu_n != 1'h1) begin
            M_state_d = ERROR_state;
          end
        end
      end
      SEVEN_state: begin
        M_alu_firstNumber = 16'hf004;
        M_alu_secondNumber = 16'hf005;
        M_alu_alufn = 6'h01;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = EIGHT_state;
          if (M_alu_answer != 16'hffff | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h1) begin
            M_state_d = ERROR_state;
          end
        end
      end
      EIGHT_state: begin
        M_alu_firstNumber = 16'h0003;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h02;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = NINE_state;
          if (M_alu_answer != 16'h0006 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      NINE_state: begin
        M_alu_firstNumber = 16'h7fff;
        M_alu_secondNumber = 16'h7fff;
        M_alu_alufn = 6'h02;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TEN_state;
          if (M_alu_answer != 16'h0001 | M_alu_z != 1'h0 | M_alu_v != 1'h1 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TEN_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'hffff;
        M_alu_alufn = 6'h02;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = ELEVEN_state;
          if (M_alu_answer != 16'hffff | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h1) begin
            M_state_d = ERROR_state;
          end
        end
      end
      ELEVEN_state: begin
        M_alu_firstNumber = 16'h0000;
        M_alu_secondNumber = 16'h0000;
        M_alu_alufn = 5'h02;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWELVE_state;
          if (M_alu_answer != 16'h0000 | M_alu_z != 1'h1 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWELVE_state: begin
        M_alu_firstNumber = 16'hffff;
        M_alu_secondNumber = 16'hfffa;
        M_alu_alufn = 6'h02;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTEEN_state;
          if (M_alu_answer != 16'h0006 | M_alu_z != 1'h0 | M_alu_v != 1'h1 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTEEN_state: begin
        M_alu_firstNumber = 16'h0004;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h03;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FOURTEEN_state;
          if (M_alu_answer != 16'h0002 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FOURTEEN_state: begin
        M_alu_firstNumber = 16'h0004;
        M_alu_secondNumber = 16'hfffe;
        M_alu_alufn = 6'h03;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FIFTEEN_state;
          if (M_alu_answer != 16'hfffe | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h1) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FIFTEEN_state: begin
        M_alu_firstNumber = 16'hfffc;
        M_alu_secondNumber = 16'hfffe;
        M_alu_alufn = 6'h03;
        io_led[16+0+0-:1] = M_alu_z;
        io_led[16+1+0-:1] = M_alu_v;
        io_led[16+2+0-:1] = M_alu_n;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = SIXTEEN_state;
          if (M_alu_answer != 16'h0002 | M_alu_z != 1'h0 | M_alu_v != 1'h0 | M_alu_n != 1'h0) begin
            M_state_d = ERROR_state;
          end
        end
      end
      SIXTEEN_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h31;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = SEVENTEEN_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      SEVENTEEN_state: begin
        M_alu_firstNumber = 16'h0002;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h31;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = EIGHTEEN_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      EIGHTEEN_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h31;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = NINETEEN_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      NINETEEN_state: begin
        M_alu_firstNumber = 16'h0003;
        M_alu_secondNumber = 16'h0003;
        M_alu_alufn = 6'h33;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTY_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTY_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h33;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYONE_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYONE_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYTWO_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYTWO_state: begin
        M_alu_firstNumber = 16'h0002;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYTHREE_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYTHREE_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h35;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYFOUR_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYFOUR_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYFIVE_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYFIVE_state: begin
        M_alu_firstNumber = 16'h0002;
        M_alu_secondNumber = 16'h0001;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYSIX_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYSIX_state: begin
        M_alu_firstNumber = 16'h0001;
        M_alu_secondNumber = 16'h0002;
        M_alu_alufn = 6'h37;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYSEVEN_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYSEVEN_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'haaaa;
        M_alu_alufn = 6'h18;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYEIGHT_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYEIGHT_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'hf0f0;
        M_alu_alufn = 6'h18;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = TWENTYNINE_state;
          if (M_alu_answer != 16'h5050) begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWENTYNINE_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'haaaa;
        M_alu_alufn = 6'h1e;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTY_state;
          if (M_alu_answer != 16'hffff) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTY_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'hf0f0;
        M_alu_alufn = 6'h1e;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYONE_state;
          if (M_alu_answer != 16'hf5f5) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYONE_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'haaaa;
        M_alu_alufn = 6'h16;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYTWO_state;
          if (M_alu_answer != 16'hffff) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYTWO_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'hf0f0;
        M_alu_alufn = 6'h16;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYTHREE_state;
          if (M_alu_answer != 16'ha5a5) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYTHREE_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'hf0f0;
        M_alu_alufn = 6'h1a;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYFOUR_state;
          if (M_alu_answer != 16'h5555) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYFOUR_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 16'h5555;
        M_alu_alufn = 6'h1a;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYFIVE_state;
          if (M_alu_answer != 16'h5555) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYFIVE_state: begin
        M_alu_firstNumber = 16'hffff;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYSIX_state;
          if (M_alu_answer != 16'h8000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYSIX_state: begin
        M_alu_firstNumber = 16'hfffe;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYSEVEN_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYSEVEN_state: begin
        M_alu_firstNumber = 16'haaaa;
        M_alu_secondNumber = 2'h2;
        M_alu_alufn = 6'h20;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYEIGHT_state;
          if (M_alu_answer != 16'haaa8) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYEIGHT_state: begin
        M_alu_firstNumber = 16'hffff;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = THIRTYNINE_state;
          if (M_alu_answer != 16'h0001) begin
            M_state_d = ERROR_state;
          end
        end
      end
      THIRTYNINE_state: begin
        M_alu_firstNumber = 16'h7fff;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FORTY_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FORTY_state: begin
        M_alu_firstNumber = 16'haaaa;
        M_alu_secondNumber = 2'h2;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FORTYONE_state;
          if (M_alu_answer != 16'h2aaa) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FORTYONE_state: begin
        M_alu_firstNumber = 16'haaaa;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h23;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = FORTYTWO_state;
          if (M_alu_answer != 16'hffff) begin
            M_state_d = ERROR_state;
          end
        end
      end
      FORTYTWO_state: begin
        M_alu_firstNumber = 16'h5555;
        M_alu_secondNumber = 4'hf;
        M_alu_alufn = 6'h23;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = INVALID_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      INVALID_state: begin
        M_alu_firstNumber = 16'hffff;
        M_alu_secondNumber = 16'h0010;
        M_alu_alufn = 6'h21;
        io_led[8+7-:8] = M_alu_answer[8+7-:8];
        io_led[0+7-:8] = M_alu_answer[0+7-:8];
        if (M_edge_detector_out) begin
          M_state_d = START_state;
          if (M_alu_answer != 16'h0000) begin
            M_state_d = ERROR_state;
          end
        end
      end
      ERROR_state: begin
        M_seg_values = 16'hcabb;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
