module top_module (
    input  wire clk,
    input  wire rst_n
);

    wire wb_cyc, wb_stb, wb_we, wb_ack;
    wire [3:0]  wb_sel;
    wire [31:0] wb_adr, wb_dat_i, wb_dat_o;

    wire        en, up_down;
    wire [31:0] count;

    // Counter Instance
    counter u_counter (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .up_down(up_down),
        .count(count)
    );

    // WISHBONE Slave Instance
    wishbone_slave u_slave (
        .clk(clk),
        .rst_n(rst_n),
        .wb_cyc_i(wb_cyc),
        .wb_stb_i(wb_stb),
        .wb_we_i(wb_we),
        .wb_sel_i(wb_sel),
        .wb_adr_i(wb_adr),
        .wb_dat_i(wb_dat_o),
        .wb_dat_o(wb_dat_i),
        .wb_ack_o(wb_ack),
        .en(en),
        .up_down(up_down),
        .count(count)
    );

    // WISHBONE Master Instance (for testing)
    wishbone_master u_master (
        .clk(clk),
        .rst_n(rst_n),
        .wb_cyc_o(wb_cyc),
        .wb_stb_o(wb_stb),
        .wb_we_o(wb_we),
        .wb_sel_o(wb_sel),
        .wb_adr_o(wb_adr),
        .wb_dat_o(wb_dat_o),
        .wb_dat_i(wb_dat_i),
        .wb_ack_i(wb_ack)
    );

endmodule
