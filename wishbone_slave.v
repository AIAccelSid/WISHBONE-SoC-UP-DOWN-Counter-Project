module wishbone_slave #(
    parameter WIDTH = 32
)(
    input  wire               clk,
    input  wire               rst_n,

    // WISHBONE Signals
    input  wire               wb_cyc_i,
    input  wire               wb_stb_i,
    input  wire               wb_we_i,
    input  wire  [3:0]        wb_sel_i,
    input  wire  [31:0]       wb_adr_i,
    input  wire  [31:0]       wb_dat_i,
    output reg   [31:0]       wb_dat_o,
    output reg                wb_ack_o,

    // Counter Control
    output reg                en,
    output reg                up_down,
    input  wire [WIDTH-1:0]   count
);

    // Address Map
    localparam ADDR_CTRL  = 32'h0000_0000;  // Control Register
    localparam ADDR_COUNT = 32'h0000_0004;  // Current Counter Value

    // WISHBONE Slave Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wb_ack_o  <= 1'b0;
            en        <= 1'b0;
            up_down   <= 1'b1;
            wb_dat_o  <= 32'b0;
        end else begin
            wb_ack_o <= 1'b0;  // Default no response

            if (wb_cyc_i && wb_stb_i && !wb_ack_o) begin
                wb_ack_o <= 1'b1;

                if (wb_we_i) begin  // Write
                    case (wb_adr_i)
                        ADDR_CTRL: begin
                            en      <= wb_dat_i[0];
                            up_down <= wb_dat_i[1];
                        end
                        default: ; // Do nothing for undefined addresses
                    endcase
                end else begin  // Read
                    case (wb_adr_i)
                        ADDR_CTRL:  wb_dat_o <= {30'b0, up_down, en};
                        ADDR_COUNT: wb_dat_o <= count;
                        default:    wb_dat_o <= 32'hDEAD_BEEF;  // Illegal read addr
                    endcase
                end
            end
        end
    end

endmodule
