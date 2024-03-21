module Test_KeyboardDisplay(clk,col,segs,digs,row,pressed,toggle);
	//这是一个测试键盘的数码管的程序。数码管左面会显示按下次数，右面会显示按键对应的数字
    input clk;
    input[3:0] col;

    output[7:0] segs;
    output[3:0] digs;
    output[3:0] row;

    output wire pressed;
	 output wire toggle;
    wire[3:0] number;
    wire[15:0] bcd;
    reg[3:0] counter;

    Keyboard mykeyboard(
        .row(row),
        .col(col),
        .clk(clk),
        .num(number),
        .pressed(pressed)
		  ,.toggle(toggle)
    );
	 
    assign bcd[3:0]=number%10;
    assign bcd[7:4]=number/10;
	 
	 initial counter=0;

    always@(posedge pressed) begin
        if(counter==15)counter=0;
        else counter=counter+1;
    end
    
	 //Filter togglefilter(.clk_in(clk),.clk_out(toggle_clk),.cnt(50000),.reset(1));
	 //always@(posedge toggle_clk) begin
	 //if(toggle)
     //   if(counter==15)counter=0;
     //   else counter=counter+1;
    //end
	 
    assign bcd[11:8]=counter%10;
    assign bcd[15:12]=counter/10;

    SevenSegs mysegs(
        .clk(clk),
        .DOT(4'b0100),
        .BI(0),
        .BCD(bcd),
        .SEGS(segs),
        .DIGS(digs)
    );

endmodule