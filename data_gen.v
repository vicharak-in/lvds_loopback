/*
module data_gen (
    input  wire       clk,
    input  wire       rstn,
    input  wire       enable,
    output reg [7:0]  data_out
);

reg start = 0;
reg [15:0] count = 0;
reg [3:0] data_cnt = 0;
reg done = 0;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        data_out <= 8'h00;
        count <= 0;
        data_cnt <= 0;
        done <= 0;
    end else if (data_cnt == 10) begin
        done <= 1;
        data_out <= 0;
    end else if (enable) begin
        if(count > 16'd1000) begin
            data_out <= data_out + 8'h01;
            data_cnt <= data_cnt + 1;
            //data_out <=  8'hA5;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule
*/

module data_gen (
    input  wire       clk,
    input  wire       rstn,
    input  wire       enable,
    output reg [7:0]  data_out,
    output reg        start
);

reg state = 0;
reg [26:0] counter = 0;
reg [26:0] data_cnt = 0;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        data_out <= 8'h00;
        start <= 0;
        state <= 0;
    end else begin
        case(state)
            0 : begin
                if (enable && (data_cnt < 27'd12_499_999)) begin
                    data_out <= data_out + 8'h01;
                    start <= 1'b1;
                    data_cnt <= data_cnt + 1;
                end else begin
                    state <= 1;
                    data_cnt <= 0;
                    data_out <= 0;
                end
            end
            1 : begin
                start <= 0;
                if (counter == 27'd12_499_999) begin
                    counter <= 0;
                    state <= 0;
                end else begin
                    counter <= counter + 1;
                end
            end
        endcase
    end
end

endmodule