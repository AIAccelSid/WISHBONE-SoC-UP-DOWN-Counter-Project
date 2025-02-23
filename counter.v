`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 03:38:15
// Design Name: 
// Module Name: counter
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


module counter( input wire clk,
                input wire rst_n,
                input wire en,
                input wire up_down,
                output reg [3:0] count

    );
    reg [3:0] next_count;
    always @(*) begin
    
    if (en) begin
    if (up_down) begin
    
    next_count = (count != 4'b1111)? count + 4'b0001 : count;
    end else begin
    
    next_count = (count != 4'b0000)? count - 4'b0001: count ;
    end
    end 
    end
    
    always @(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
    count <= up_down ? 4'b0000 : 4'b1111;
    end else begin
    count <= next_count;
    
   end
   
   end
    
    
endmodule
