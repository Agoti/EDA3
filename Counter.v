module Counter(clk,sup,duration,reset,number,carry);
    input clk;
    input[31:0] sup;//最大数
    input[31:0] duration;//决定计数器的速度
    input reset;//归零

    output reg[31:0] number;//计的数字
    output reg carry;//进位
	 
	 wire counter_clk;

    Filter counter_filter(
        .clk_in(clk),.reset(reset),.clk_out(counter_clk),.cnt(duration)
    );

    always@(negedge counter_clk or negedge reset) begin
      if(~reset)
      begin number=0; carry=0; end
      else if(number==sup) begin
        carry=0;
        number=0;
      end
		else if(number==sup-1)begin
			number=number+1;
			carry=1;
		end
      else begin
        number=number+1;
		  carry=0;
      end
    end

endmodule