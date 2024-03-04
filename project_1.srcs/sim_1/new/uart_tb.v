`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 04:59:05 PM
// Design Name: 
// Module Name: uart_tb
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


`timescale 1ns / 1ps

module uart_tb;

  reg            clk;
  reg            rst_n;
  reg            RXD;
  wire           TXD;

  initial begin
    clk = 0;
    rst_n = 0;
    RXD = 1;
    #105;
    rst_n = 1;
    
    #1000;
    RXD = 0;
    #104166;
    
    RXD = 1;
    #104166;
    RXD = 0;
    #104166;
    RXD = 1;
    #104166;
    RXD = 0;
    #104166;
    RXD = 1;
    #104166;
    RXD = 0;
    #104166;
    RXD = 0;
    #104166;
    RXD = 1;
    #104166;
    
    RXD = 1;
    #104166;
    
    #5000;
    $stop;
  end
  
  always #10 clk = ~clk;
  
  uart uart_inst(
  
  .clk      (clk  ),
  .rst_n      (rst_n  ),
  .RXD      (RXD  ),
  .TXD      (TXD  )
);
  
endmodule
