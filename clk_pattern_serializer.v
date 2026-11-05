module clk_pattern_serializer(
	input			i_sclk_clk,
	input			i_pll_locked,
	output	[1:0]	o_clk_pattern
);
parameter SER_WIDTH = 8;
localparam ODD	= SER_WIDTH % 2;
localparam ONES	= SER_WIDTH / 2;
localparam INIT	= {SER_WIDTH{1'b0}} | ({ONES{1'b1}} << (ODD*2+1));
reg	[SER_WIDTH-1:0]	r_ring;
always@(posedge i_sclk_clk or negedge i_pll_locked)begin
	if(!i_pll_locked)begin
		r_ring	<= INIT;
	end else begin
		r_ring	<= {r_ring[SER_WIDTH-3:0], r_ring[SER_WIDTH-1:SER_WIDTH-2]};
	end
end
assign o_clk_pattern = r_ring[SER_WIDTH-1:SER_WIDTH-2];
endmodule
