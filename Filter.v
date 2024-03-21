module Filter(clk_in,cnt,clk_out,reset);//分频器
input clk_in;
input[31:0] cnt;
input reset;

output reg clk_out;

integer i;

initial begin
    i=0;
	 clk_out=0;
end

always @(posedge clk_in or negedge reset) begin
    if(reset==0)begin
        i=0;
        clk_out=0;
    end
    else if(i>=cnt/2) begin
        i=0;
        clk_out=~clk_out;
    end
    else i=i+1;
end


endmodule