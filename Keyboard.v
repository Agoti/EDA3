module Keyboard(clk,col,row,num,pressed,toggle);
    input clk;
    input [3:0] col;
    output [3:0] row;
    output [3:0] num;
    output pressed;//按下标志
    output toggle;//按下会给出一个时钟周期的高电平
    
    wire [15:0] key1;
    wire [15:0] key2;
	 wire pressed_temp;

    KeyboardScanner myScanner(
        .clk(clk),
        .col(col),
        .row(row),
        .key(key1),
		  .pressed(pressed_temp)
    );//扫描模块
    KeyboardDebouncer myDebouncer(
        .clk(clk),
        .key_in(key1),
        .key_out(key2),
		  .pressed_in(pressed_temp),
		  .pressed_out(pressed),
		  .toggle(toggle)
    );//防抖模块
    Coder_4bits myCoder(
        .onehot(key2),
        .binary(num)
    );//编码器
endmodule