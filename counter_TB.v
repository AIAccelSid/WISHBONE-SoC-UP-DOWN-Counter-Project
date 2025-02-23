`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 03:56:13
// Design Name: 
// Module Name: counter_TB
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


module counter_TB;
 reg clk;
 reg rst_n;
 reg en;
 reg up_down;
 wire [3:0] count;
 
 initial begin
 clk = 0; 
 forever # 5 clk = ~clk; // 100mhz clk
 end
 
 counter uut(.clk(clk),.rst_n(rst_n),.en(en),.up_down(up_down),.count(count));
 
 initial begin
 rst_n = 0;
 en =0;
 up_down =1;
 
 #20 ;
 @(posedge clk);
 #1;
 rst_n = 1;
 #1;
 en =1;
 repeat(16) @(posedge clk);
 
 @(posedge clk);
 
 #1;
 up_down =0;
 #1;
 
 repeat(16) @(posedge clk);
 
 @(posedge clk);
 #1;
 en =0;
 
 #100 $finish;
 end
 
 initial begin
 $monitor("Time=%0t rst_n=%b en=%b up_down=%b count=%h", $time,rst_n,en,up_down,count);
 end

 
 
endmodule
