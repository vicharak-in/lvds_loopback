///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
/*
 * data_check (updated)
 * ------------------------------------------------------------
 * Same "consecutive byte increments by 1" self-check as before,
 * with one addition: a `resync` input. align_ctrl pulses this
 * every time it changes word_aligner's rotation, so the very
 * next byte is treated as a fresh "first_sample" instead of
 * being compared against a prev_data captured under the OLD
 * (possibly wrong) rotation - which would otherwise guarantee
 * a false error on the first sample after every rotation change.
 */
/*
module data_check (
    input  wire       clk,
    input  wire       rstn,
    input  wire       enable,
    input  wire       resync,
    input  wire [7:0] data_in,

    output reg        pass,
    output reg        error,
    output reg [31:0] error_count
);

    reg [7:0] prev_data;
    reg       first_sample;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            prev_data    <= 8'h00;
            first_sample <= 1'b0;
            pass         <= 1'b0;
            error        <= 1'b0;
            error_count  <= 32'd0;
        end
        else if (!enable || resync) begin
            // Same re-arm behavior whether the test is simply
            // disabled, or align_ctrl asked for a fresh start
            // after moving to a new rotation.
            prev_data    <= 8'h00;
            first_sample <= 1'b0;
            pass         <= 1'b0;
            error        <= 1'b0;
        end
        else if (!first_sample) begin
            // First received byte establishes the starting point.
            prev_data    <= data_in;
            first_sample <= 1'b1;
            pass         <= 1'b0;
            error        <= 1'b0;
        end
        else begin
            if (data_in == (prev_data + 8'h01)) begin
                pass  <= 1'b1;
                error <= 1'b0;
            end
            else begin
                pass  <= 1'b0;
                error <= 1'b1;

                if (error_count != 32'hFFFFFFFF)
                    error_count <= error_count + 1'b1;
            end

            prev_data <= data_in;
        end
    end

endmodule
*/

module data_check (
    input               clk,
    input               rstn,
    input               start,
    input [7:0]         data_in,

    output reg          pass,
    output reg          error
);

reg [7:0] prev_data = 0;
reg       state = 0;

reg r_start = 0;
reg d_start = 0;

always@(posedge clk) begin
    r_start <= start;
    d_start <= r_start;
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        pass <= 0;
        error <= 0;
        state <= 0;
    end else begin
        case(state)
            0 : begin
                pass <= 0;
                prev_data <= 0;
                state <= d_start;
            end
            1 : begin
                if(d_start) begin
                    if(prev_data == 8'hFF) begin
                        pass <= (data_in <= 8'd0);
                        error <= ~(data_in <= 8'd0);
                    end else begin
                        pass <= (data_in == (prev_data + 1));
                        error <= ~(data_in == (prev_data + 1));
                    end
                    prev_data <= data_in;
                end else begin
                    state <= 0;
                end
            end
        endcase
    end

end

endmodule
