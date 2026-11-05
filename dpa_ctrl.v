module dpa_ctrl(
	input						i_clk,
	input						i_arstn,
	input						i_pll_locked,
	input	[LANE_NUM*6-1:0]	i_dly_dbg,
	input	[LANE_NUM-1:0]		i_dly_lock,
	output	[LANE_NUM-1:0]		o_dly_rst,
	output	[LANE_NUM-1:0]		o_dly_ena,
	output						o_all_locked,
	output	[LANE_NUM-1:0]		o_rx_rst
);

parameter LANE_NUM = 4;
reg [LANE_NUM-1:0]	r_ena, r_lock;
reg	[1:0]			r_rx_rst;
reg					r_all_locked;
wire [LANE_NUM-1:0]	w_all0, w_all1;
wire				w_rst;
genvar i;

assign o_dly_rst	= {LANE_NUM{~i_pll_locked | ~i_arstn}};
assign o_dly_ena	= r_ena;
assign o_all_locked	= r_all_locked;
assign o_rx_rst		= {LANE_NUM{w_rst}};
assign w_rst		= ~r_rx_rst[1] & r_rx_rst[0];

generate
	for(i=0; i<LANE_NUM; i=i+1)begin
		always@(negedge i_clk or negedge i_arstn)begin
			if(!i_arstn)begin
				r_ena[i]	<= 1'b0;
				r_lock[i]	<= 1'b0;
			end else begin
				if(w_all0[i] | w_all1[i] | i_dly_lock[i])begin	// stop DPA callibration by putting ENA to LOW,
					r_ena[i]	<= 1'b0;						// when DBG stepped on 0 or 63, or DPA locked by itself
					r_lock[i]	<= 1'b1;
				end else begin
					r_ena[i]	<= 1'b1;
					r_lock[i]	<= r_lock[i];
				end
			end
		end
		assign w_all0[i]	= ~|(i_dly_dbg[6*(i+1)-1:6*i]);
		assign w_all1[i]	= &(i_dly_dbg[6*(i+1)-1:6*i]);
	end
endgenerate

always@(negedge i_clk or negedge i_arstn)begin
	if(!i_arstn)begin
		r_rx_rst	<= 2'b00;
		r_all_locked<= 1'b0;
	end else begin
		if(&r_lock)begin
			r_rx_rst[0]	<= 1'b1;
			r_rx_rst[1]	<= r_rx_rst[0];
		end
		if(w_rst)
			r_all_locked	<= 1'b1;	// all DPA locked signal
	end
end

endmodule