`timescale 1ms/1ms

module Controller_tb();


    reg clk;
    reg[3:0] num;           
    reg pressed;
    wire[31:0] sup;
    wire reset;
    reg[31:0] number;
    reg carry;
    wire[15:0] bcd;
    wire bi;
    wire enable;
    reg done;
	 reg rd;


    Controller mycontroller(
        .clk(clk),.rd(rd),.num(num),.pressed(pressed),.sup(sup),.reset(reset),
        .number(number),.carry(carry),.bcd(bcd),
        .bi(bi),.enable(enable),.done(done)
    );//调用器件
	 

    always begin
        #1 clk=~clk;
    end//时钟500Hz

    initial begin
		clk=0;rd=0;number=0;carry=0;done=0;pressed=0;
		#10 rd=1;
        #10 num=10;pressed=1;   //init
        #10 pressed=0;$display("init:bcd=%4x\n,",bcd);
        #10 num=1;pressed=1;
        #10 pressed=0;
        #10 num=3;pressed=1;    //24
        #10 pressed=0;$display("input1:bcd=%4x\n",bcd);
        #10 num=11;pressed=1;   //clear
        #10 pressed=0;$display("clear:bcd=%4x\n",bcd);
        #10 num=4;pressed=1;    //5
        #10 pressed=0;$display("input2:bcd=%4x\n",bcd);
        #10 num=12;pressed=1;   //charge
        #10 pressed=0;
		  #10
		  for(number=0;number<sup;number=number+1)#1000;
        #10 carry=1;
		  #10 $display("timeover:buzzer=%b\n",enable);
        #100 done=1;
		  #10000 carry=1;
		  #100 $display("sleep:rbi=%b\n",bi);
    end

	initial begin
	#25000 $finish;
	end
	
endmodule