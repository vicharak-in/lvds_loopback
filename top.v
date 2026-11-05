module lvds_loopback_top (
    input  wire                         rstn,
    input                               debug_rst,

    // Slow clocks from TX and RX PLLs
    input  wire                         tx_slowclk,
    input  wire                         rx_slowclk,

    // PLL status
    input  wire                         txpll_locked,
    input  wire                         rxpll_locked,

    // LVDS RX Clock
    output                              lvds_rx_clk_RX_ENA,
    
    // LVDS RX parallel data from Interface Designer
    input [SER_WIDTH - 1 : 0]           lvds_rx_d0_RX_DATA,
    output                              lvds_rx_d0_RX_ENA,
    output                              lvds_rx_d0_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d1_RX_DATA,
    output                              lvds_rx_d1_RX_ENA,
    output                              lvds_rx_d1_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d2_RX_DATA,
    output                              lvds_rx_d2_RX_ENA,
    output                              lvds_rx_d2_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d3_RX_DATA,
    output                              lvds_rx_d3_RX_ENA,
    output                              lvds_rx_d3_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d4_RX_DATA,
    output                              lvds_rx_d4_RX_ENA,
    output                              lvds_rx_d4_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d5_RX_DATA,
    output                              lvds_rx_d5_RX_ENA,
    output                              lvds_rx_d5_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d6_RX_DATA,
    output                              lvds_rx_d6_RX_ENA,
    output                              lvds_rx_d6_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d7_RX_DATA,
    output                              lvds_rx_d7_RX_ENA,
    output                              lvds_rx_d7_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d8_RX_DATA,
    output                              lvds_rx_d8_RX_ENA,
    output                              lvds_rx_d8_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d9_RX_DATA,
    output                              lvds_rx_d9_RX_ENA,
    output                              lvds_rx_d9_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d10_RX_DATA,
    output                              lvds_rx_d10_RX_ENA,
    output                              lvds_rx_d10_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d11_RX_DATA,
    output                              lvds_rx_d11_RX_ENA,
    output                              lvds_rx_d11_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d12_RX_DATA,
    output                              lvds_rx_d12_RX_ENA,
    output                              lvds_rx_d12_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d13_RX_DATA,
    output                              lvds_rx_d13_RX_ENA,
    output                              lvds_rx_d13_RX_RST,

    input [SER_WIDTH - 1 : 0]           lvds_rx_d14_RX_DATA,
    output                              lvds_rx_d14_RX_ENA,
    output                              lvds_rx_d14_RX_RST,

    //LVDS TX Clock lane
    output                              lvds_tx_clk_TX_OE,
    output                              lvds_tx_clk_TX_RST,

    // LVDS TX parallel data to Interface Designer
    output                              lvds_tx_d0_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d0_TX_DATA,
    output                              lvds_tx_d0_TX_RST,

    output                              lvds_tx_d1_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d1_TX_DATA,
    output                              lvds_tx_d1_TX_RST,

    output                              lvds_tx_d2_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d2_TX_DATA,
    output                              lvds_tx_d2_TX_RST,

    output                              lvds_tx_d3_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d3_TX_DATA,
    output                              lvds_tx_d3_TX_RST,

    output                              lvds_tx_d4_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d4_TX_DATA,
    output                              lvds_tx_d4_TX_RST,

    output                              lvds_tx_d5_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d5_TX_DATA,
    output                              lvds_tx_d5_TX_RST,

    output                              lvds_tx_d6_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d6_TX_DATA,
    output                              lvds_tx_d6_TX_RST,

    output                              lvds_tx_d7_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d7_TX_DATA,
    output                              lvds_tx_d7_TX_RST,

    output                              lvds_tx_d8_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d8_TX_DATA,
    output                              lvds_tx_d8_TX_RST,

    output                              lvds_tx_d9_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d9_TX_DATA,
    output                              lvds_tx_d9_TX_RST,

    output                              lvds_tx_d10_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d10_TX_DATA,
    output                              lvds_tx_d10_TX_RST,

    output                              lvds_tx_d11_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d11_TX_DATA,
    output                              lvds_tx_d11_TX_RST,

    output                              lvds_tx_d12_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d12_TX_DATA,
    output                              lvds_tx_d12_TX_RST,

    output                              lvds_tx_d13_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d13_TX_DATA,
    output                              lvds_tx_d13_TX_RST,

    output                              lvds_tx_d14_TX_OE,
    output wire [SER_WIDTH - 1 : 0]     lvds_tx_d14_TX_DATA,
    output                              lvds_tx_d14_TX_RST,

    // LEDs
    output wire [3:0] led
);

wire d_rst;
assign d_rst = (rstn && (~debug_rst));

// Enable data generation/checking
wire       test_enable;

// Status
wire [LANE_NUM-1:0] pass;
wire [LANE_NUM-1:0] error;
wire [LANE_NUM-1:0] start;

parameter LANE_NUM	= 8;
parameter SER_WIDTH	= 8;

wire [LANE_NUM-1:0] w_rx_rst;
wire [LANE_NUM-1:0] w_rx_ena;
wire [LANE_NUM-1:0] w_tx_oe;
wire [LANE_NUM-1:0] w_tx_rst;
wire [(SER_WIDTH * LANE_NUM) - 1 : 0]   w_rx_data;
wire [(SER_WIDTH * LANE_NUM) - 1 : 0]   w_tx_data;

// Clock lane interface signals of Tx and Rx
assign lvds_rx_clk_RX_ENA   = d_rst ? 1'b1 : 0;
assign lvds_tx_clk_TX_OE    = d_rst ? 1'b1 : 0;
assign lvds_tx_clk_TX_RST	= d_rst ? 1'b0 : 0;

// For all existed Lanes
/*
assign {lvds_rx_d14_RX_ENA, lvds_rx_d13_RX_ENA, lvds_rx_d12_RX_ENA, lvds_rx_d11_RX_ENA, lvds_rx_d10_RX_ENA, 
        lvds_rx_d9_RX_ENA, lvds_rx_d8_RX_ENA, lvds_rx_d7_RX_ENA, lvds_rx_d6_RX_ENA, lvds_rx_d5_RX_ENA,
        lvds_rx_d4_RX_ENA, lvds_rx_d3_RX_ENA, lvds_rx_d2_RX_ENA, lvds_rx_d1_RX_ENA, lvds_rx_d0_RX_ENA}  = w_rx_ena;

assign {lvds_rx_d14_RX_RST, lvds_rx_d13_RX_RST, lvds_rx_d12_RX_RST, lvds_rx_d11_RX_RST, lvds_rx_d10_RX_RST,
        lvds_rx_d9_RX_RST, lvds_rx_d8_RX_RST, lvds_rx_d7_RX_RST, lvds_rx_d6_RX_RST, lvds_rx_d5_RX_RST,
        lvds_rx_d4_RX_RST, lvds_rx_d3_RX_RST, lvds_rx_d2_RX_RST, lvds_rx_d1_RX_RST, lvds_rx_d0_RX_RST}  = w_rx_rst;

assign {lvds_tx_d14_TX_OE, lvds_tx_d13_TX_OE, lvds_tx_d12_TX_OE, lvds_tx_d11_TX_OE, lvds_tx_d10_TX_OE,
        lvds_tx_d9_TX_OE, lvds_tx_d8_TX_OE, lvds_tx_d7_TX_OE, lvds_tx_d6_TX_OE, lvds_tx_d5_TX_OE,
        lvds_tx_d4_TX_OE, lvds_tx_d3_TX_OE, lvds_tx_d2_TX_OE, lvds_tx_d1_TX_OE, lvds_tx_d0_TX_OE}       = w_tx_oe;

assign {lvds_tx_d14_TX_RST, lvds_tx_d13_TX_RST, lvds_tx_d12_TX_RST, lvds_tx_d11_TX_RST, lvds_tx_d10_TX_RST,
        lvds_tx_d9_TX_RST, lvds_tx_d8_TX_RST, lvds_tx_d7_TX_RST, lvds_tx_d6_TX_RST, lvds_tx_d5_TX_RST,
        lvds_tx_d4_TX_RST, lvds_tx_d3_TX_RST, lvds_tx_d2_TX_RST, lvds_tx_d1_TX_RST, lvds_tx_d0_TX_RST}  = w_tx_rst;

assign {lvds_tx_d14_TX_DATA, lvds_tx_d13_TX_DATA, lvds_tx_d12_TX_DATA, lvds_tx_d11_TX_DATA, lvds_tx_d10_TX_DATA,
        lvds_tx_d9_TX_DATA, lvds_tx_d8_TX_DATA, lvds_tx_d7_TX_DATA, lvds_tx_d6_TX_DATA, lvds_tx_d5_TX_DATA,
        lvds_tx_d4_TX_DATA, lvds_tx_d3_TX_DATA, lvds_tx_d2_TX_DATA, lvds_tx_d1_TX_DATA, lvds_tx_d0_TX_DATA} = w_tx_data;

assign w_rx_data = {lvds_rx_d14_RX_DATA, lvds_rx_d13_RX_DATA, lvds_rx_d12_RX_DATA, lvds_rx_d11_RX_DATA, lvds_rx_d10_RX_DATA,
                    lvds_rx_d9_RX_DATA, lvds_rx_d8_RX_DATA, lvds_rx_d7_RX_DATA, lvds_rx_d6_RX_DATA, lvds_rx_d5_RX_DATA,
                    lvds_rx_d4_RX_DATA, lvds_rx_d3_RX_DATA, lvds_rx_d2_RX_DATA, lvds_rx_d1_RX_DATA, lvds_rx_d0_RX_DATA};
*/


//Only working lanes
assign {lvds_rx_d12_RX_ENA, lvds_rx_d10_RX_ENA,
        lvds_rx_d9_RX_ENA, lvds_rx_d7_RX_ENA, lvds_rx_d6_RX_ENA,
        lvds_rx_d4_RX_ENA, lvds_rx_d1_RX_ENA, lvds_rx_d0_RX_ENA}  = w_rx_ena;

assign {lvds_rx_d12_RX_RST, lvds_rx_d10_RX_RST,
        lvds_rx_d9_RX_RST, lvds_rx_d7_RX_RST, lvds_rx_d6_RX_RST,
        lvds_rx_d4_RX_RST, lvds_rx_d1_RX_RST, lvds_rx_d0_RX_RST}  = w_rx_rst;

assign {lvds_tx_d12_TX_OE, lvds_tx_d10_TX_OE,
        lvds_tx_d9_TX_OE, lvds_tx_d7_TX_OE, lvds_tx_d6_TX_OE,
        lvds_tx_d4_TX_OE, lvds_tx_d1_TX_OE, lvds_tx_d0_TX_OE}       = w_tx_oe;

assign {lvds_tx_d12_TX_RST, lvds_tx_d10_TX_RST,
        lvds_tx_d9_TX_RST, lvds_tx_d7_TX_RST, lvds_tx_d6_TX_RST,
        lvds_tx_d4_TX_RST, lvds_tx_d1_TX_RST, lvds_tx_d0_TX_RST}  = w_tx_rst;

assign {lvds_tx_d12_TX_DATA, lvds_tx_d10_TX_DATA,
        lvds_tx_d9_TX_DATA, lvds_tx_d7_TX_DATA, lvds_tx_d6_TX_DATA,
        lvds_tx_d4_TX_DATA, lvds_tx_d1_TX_DATA, lvds_tx_d0_TX_DATA} = w_tx_data;

assign w_rx_data = {lvds_rx_d12_RX_DATA, lvds_rx_d10_RX_DATA,
                    lvds_rx_d9_RX_DATA, lvds_rx_d7_RX_DATA, lvds_rx_d6_RX_DATA,
                    lvds_rx_d4_RX_DATA, lvds_rx_d1_RX_DATA, lvds_rx_d0_RX_DATA};


// For single lane
/*
assign {lvds_rx_d14_RX_ENA}  = w_rx_ena;
assign {lvds_rx_d14_RX_RST}  = w_rx_rst;
assign {lvds_tx_d14_TX_OE}   = w_tx_oe;
assign {lvds_tx_d14_TX_RST}  = w_tx_rst;
assign {lvds_tx_d14_TX_DATA} = w_tx_data;
assign w_rx_data = {lvds_rx_d14_RX_DATA};
*/

assign w_rx_rst = {LANE_NUM{1'b0}};
assign w_rx_ena	= d_rst ? {LANE_NUM{1'b1}} : 0;
assign w_tx_oe	= d_rst ? {LANE_NUM{1'b1}} : 0;
assign w_tx_rst	= d_rst ? {LANE_NUM{1'b0}} : 0;

// Start the test only after both PLLs are locked.
assign test_enable = txpll_locked && rxpll_locked;

genvar i;
generate
    for(i = 0; i < LANE_NUM; i = i + 1) begin : lane
        data_gen u_data_gen (
            .clk      (tx_slowclk),
            .rstn     (d_rst),
            .enable   (test_enable),
            .start    (start[i]),
            .data_out (w_tx_data[i * 8 +: 8])
        );

        data_check u_data_check (
            .clk         (rx_slowclk),
            .rstn        (d_rst),
            .start       (start[i]),
            .data_in     (w_rx_data[i * 8 +: 8]),
            .pass        (pass[i]),
            .error       (error[i])
        );
    end
endgenerate

// ------------------------------------------------------------
// LED STATUS
// ------------------------------------------------------------
//
// LED0 = Data test pass in all lanes
// LED1 = RX PLL locked
// LED2 = TX PLL locked
// LED3 = Error in any lane

assign led[0] = &pass;
assign led[1] = rxpll_locked;
assign led[2] = txpll_locked;
assign led[3] = |error;

endmodule