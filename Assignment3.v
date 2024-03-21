module Assignment3(clk,col,row,digs,segs,SPK);

    input clk;
    input[3:0] col;
    output[3:0] row;
    output[3:0] digs;
    output[7:0] segs;
    output SPK;
	 
    Controller mycontroller(
        .clk(clk),.rd(1),.num(num),.pressed(pressed),.sup(sup),.reset(reset),
        .number(number),.carry(carry),.bcd(bcd),
        .bi(bi),.enable(enable),.done(done)
    );//控制器

    wire[3:0] num;
    wire pressed;

    Keyboard controller_keyboard(
        .clk(clk),
        .col(col),
        .row(row),
        .num(num),
        .pressed(pressed)
    );//键盘模块

    wire[15:0] bcd;
    wire bi;
    
    SevenSegs controller_display(
        .clk(clk),
        .BCD(bcd),
        .DIGS(digs),
        .SEGS(segs),
        .DOT(4'b0100),
        .BI(bi)
    );//数码管模块

    wire reset;
    wire[31:0] sup;

    wire[31:0] number;
    wire carry;

    Counter controller_counter(
        .clk(clk),
        .sup(sup),
        .duration(50000000),
        .reset(reset),
        .number(number),
        .carry(carry)
    );//计时器模块

    wire done;
    wire enable;
    Buzzer mybuzzer(
        .clk(clk),.done(done),.enable(enable),.SPK(SPK)
    );//蜂鸣器模块

endmodule