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


module counter #(parameter WIDTH = 32) (
    input  wire               clk,
    input  wire               rst_n,
    input  wire               en,
    input  wire               up_down,
    output reg  [WIDTH-1:0]   count
);

    reg [WIDTH-1:0] next_count;

    // Combinational Logic for Next Count
    always @(*) begin
        next_count = count;  // Default hold value

        if (en) begin
            if (up_down) begin
                next_count = (count != {WIDTH{1'b1}}) ? count + 1 : count;  // Prevent overflow
            end else begin
                next_count = (count != {WIDTH{1'b0}}) ? count - 1 : count;  // Prevent underflow
            end
        end
    end

    // Sequential Logic for Count Update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= (up_down) ? {WIDTH{1'b0}} : {WIDTH{1'b1}};
        end else begin
            count <= next_count;
        end
    end

endmodule
