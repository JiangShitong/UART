`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 04:58:14 PM
// Design Name: 
// Module Name: uart
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart(
  
  input   wire           clk,
  input   wire           rst_n,
  input   wire           RXD,
  output   wire           TXD
);

  wire     [7:0]    rx_data;
  wire           wr_en;
  wire           rd_en;
  wire     [7:0]    tx_data;
  wire           empty;
  
  uart_rx uart_rx_inst(
  
  .clk        (clk  ),
  .rst_n        (rst_n),
  .RXD        (RXD  ),
  .data        (rx_data),
  .wr_en        (wr_en)
);
  
  fifo fifo_inst (
  .clk(clk),  // input wire wr_clk
  .din(rx_data),        // input wire [7 : 0] din
  .wr_en(wr_en),    // input wire wr_en
  .rd_en(rd_en),    // input wire rd_en
  .dout(tx_data),      // output wire [7 : 0] dout
  .full(),      // output wire full
  .empty(empty)    // output wire empty
);
  
  uart_tx uart_tx_inst(
  
  .clk        (clk  ),
  .rst_n        (rst_n  ),
  .empty        (empty  ),
  .data        (tx_data),
  .rd_en        (rd_en  ),
  .TXD        (TXD  )
);

endmodule
