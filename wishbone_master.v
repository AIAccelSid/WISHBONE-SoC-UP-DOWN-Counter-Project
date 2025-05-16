module wishbone_master (
    input  wire        clk,
    input  wire        rst_n,

    // WISHBONE Bus
    output reg         wb_cyc_o,
    output reg         wb_stb_o,
    output reg         wb_we_o,
    output reg  [3:0]  wb_sel_o,
    output reg  [31:0] wb_adr_o,
    output reg  [31:0] wb_dat_o,
    input  wire [31:0] wb_dat_i,
    input  wire        wb_ack_i
);

    initial begin
        wb_cyc_o = 0;
        wb_stb_o = 0;
        wb_we_o  = 0;
        wb_sel_o = 4'b1111;
        wb_adr_o = 32'b0;
        wb_dat_o = 32'b0;
        #100;
        // Example Transaction Sequence
        write_ctrl(1'b1, 1'b1);  // Enable, Count Up
        #200;
        read_count();
    end

    task write_ctrl(input bit en, input bit up_down);
        begin
            @(posedge clk);
            wb_cyc_o = 1;
            wb_stb_o = 1;
            wb_we_o  = 1;
            wb_adr_o = 32'h0000_0000;
            wb_dat_o = {30'b0, up_down, en};
            wait (wb_ack_i);
            @(posedge clk);
            wb_cyc_o = 0;
            wb_stb_o = 0;
            wb_we_o  = 0;
        end
    endtask

    task read_count();
        begin
            @(posedge clk);
            wb_cyc_o = 1;
            wb_stb_o = 1;
            wb_we_o  = 0;
            wb_adr_o = 32'h0000_0004;
            wait (wb_ack_i);
            $display("Counter Value: %0d", wb_dat_i);
            @(posedge clk);
            wb_cyc_o = 0;
            wb_stb_o = 0;
        end
    endtask

endmodule
