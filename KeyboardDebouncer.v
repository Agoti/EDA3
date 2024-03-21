module KeyboardDebouncer(clk,key_in,key_out,pressed_in,pressed_out,toggle);
    input clk;
    input[15:0] key_in;
	 input pressed_in;

    output[15:0] key_out;
	 output pressed_out;
	 output reg toggle;

    wire debounce_clk;
	 
	 parameter steady = 2'b00;
    parameter temporary = 2'b01;
	 parameter colddown =2'b10;

    Filter debounce_clk_filter(.clk_in(clk),.cnt(1000000),.clk_out(debounce_clk),.reset(1));//分频：周期20ms

    reg [15:0] key_reg0;
    reg [15:0] key_reg1;
	 reg [15:0] key_reg2;
	 
	 reg pressed_reg0;
	 reg pressed_reg1;
	 reg pressed_reg2;

    always@(posedge debounce_clk) begin//移位寄存，取到最新电平，其他的依次后移
        key_reg0 = key_in;
        key_reg1 = key_reg0;
		  key_reg2 = key_reg1;
		  
		  pressed_reg0 = pressed_in;
        pressed_reg1 = pressed_reg0;
		  pressed_reg2 = pressed_reg1;
    end

    assign key_out = (~key_reg0&~key_reg1&~key_reg2)|(~key_reg0&~key_reg1&key_reg2);
	 assign pressed_out = (pressed_reg0&pressed_reg1&pressed_reg2)|(pressed_reg0&pressed_reg1&~pressed_reg2);
	 //低低低或高低低为高电平，这里把低电平有效转换成了高电平有效
	 
	 //下面的代码是给出toggle信号的值，toggle是按键按下的边沿出现后给出一个时钟周期（1ms）的高电平，不过改进后的电路已经不用了
	 //所以可以不看。是我自己写的。
	 wire debounce_toggle_clk;
	 Filter toggle_clk_filter(.clk_in(clk),.cnt(50000),.clk_out(debounce_toggle_clk),.reset(1));
	 //assign debounce_toggle_clk=clk;
	 
    reg[2:0] monostable_state;
    initial monostable_state=steady;

    always@(posedge debounce_toggle_clk)begin
        case(monostable_state)
        steady:
		  begin
            if(pressed_out) monostable_state=temporary;
            else monostable_state=steady;
            toggle=0;
				end
        temporary:
		  begin
            monostable_state=colddown;
            toggle=1;
				end

		  colddown:
		  begin
            if(~pressed_out)monostable_state=steady;
				else monostable_state=colddown;
            toggle=0;
				end
		  default:monostable_state=steady;
		  
		  endcase
    end


endmodule