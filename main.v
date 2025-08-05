module regent (
    input  wire [3:0] din,
    input  wire       reset,
    input  wire       clk,
    input  wire [1:0] sel,
    output wire [3:0] max_out,
    output wire [3:0] min_out,
    output reg  [3:0] reg_out
);

  reg [3:0] reg0out, reg1out, reg2out, reg3out;
  reg [3:0] max_reg, min_reg;

  function [3:0] max4;
    input [3:0] a, b, c, d;
    begin
      max4 = a;
      if (b > max4) max4 = b;
      if (c > max4) max4 = c;
      if (d > max4) max4 = d;
    end
  endfunction

  function [3:0] min4;
    input [3:0] a, b, c, d;
    begin
      min4 = a;
      if (b < min4) min4 = b;
      if (c < min4) min4 = c;
      if (d < min4) min4 = d;
    end
  endfunction

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      reg0out <= 4'b1000;
      reg1out <= 4'b1000;
      reg2out <= 4'b1000;
      reg3out <= 4'b1000;
    end else begin
      reg3out <= reg2out;
      reg2out <= reg1out;
      reg1out <= reg0out;
      reg0out <= din;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset)
      max_reg <= 4'b0000;
    else begin
      if (max4(reg0out, reg1out, reg2out, reg3out) > max_reg)
        max_reg <= max4(reg0out, reg1out, reg2out, reg3out);
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset)
      min_reg <= 4'b1111;
    else begin
      if (min4(reg0out, reg1out, reg2out, reg3out) < min_reg)
        min_reg <= min4(reg0out, reg1out, reg2out, reg3out);
    end
  end

  always @(*) begin
    case (sel)
      2'b00: reg_out = reg0out;
      2'b01: reg_out = reg1out;
      2'b10: reg_out = reg2out;
      2'b11: reg_out = reg3out;
      default: reg_out = reg3out;
    endcase
  end

  assign max_out = max_reg;
  assign min_out = min_reg;

endmodule
