`timescale 1ms/1ms

module Keyboard_tb();

    integer expected_number;
    integer i;
    reg en;

    reg clk;
    wire[3:0] row;
    wire[3:0] col;
    wire[3:0] num;
    wire pressed;
    wire toggle;

    reg mismatch_flag;

    Keyboard mykeyboard(.clk(clk),.row(row),.col(col),.num(num),
    .pressed(pressed),.toggle(toggle));//调用器件
	 
	 num2col myn2c(.en(en),.col(col),.row(row),.num(expected_number));//模块：产生col的信号模拟按键的按下

    always begin
        #1 clk=~clk;
    end//时钟

    initial begin
		  clk=0;
        mismatch_flag=0;
        $display("normal press...\n");//正常按下
        for(i=0;i<16;i=i+1) begin
            #100 en=0;
            #100 
            #100 en=1;expected_number=i;
            #100
            $display("output:%x, shouldbe:%1x\n",num,expected_number);
            if(num!=expected_number)mismatch_flag=1;
        end
        if(mismatch_flag)$display("mismatch\n");
        $display("long press...\n");
		  en=0;
        #200 en=1;expected_number=2;//长按键3000ms
        #3000 en=0;
        #200 
        $display("debounce...\n");
        for(i=0;i<10;i=i+1) begin//抖动按下
            #1 en=0;
            #1 en=1;expected_number=5;            
        end
        #200
        for(i=0;i<10;i=i+1) begin//抖动松开
            #1 en=1;expected_number=5;
            #1 en=0;
        end
    end

	initial begin
	#12000 $finish;
	end
	
endmodule

    module num2col(en,num,row,col);
        input en;
        input[3:0] num;
        input[3:0] row;
		  output reg[3:0] col;

        always@(*)begin
            if(en==0)col=4'b1111;
            else begin
                case(row)
                    4'b1110:
                        case(num)
                        3:col=4'b0111;
                        2:col=4'b1011;
                        1:col=4'b1101;
                        0:col=4'b1110;
                        default:col=4'b1111;
                        endcase
                    4'b1101:
                    case(num)
                        7:col=4'b0111;
                        6:col=4'b1011;
                        5:col=4'b1101;
                        4:col=4'b1110;
                        default:col=4'b1111;
                        endcase
                    4'b1011:
                    case(num)
                        11:col=4'b0111;
                        10:col=4'b1011;
                        9:col=4'b1101;
                        8:col=4'b1110;
                        default:col=4'b1111;
                        endcase
                    4'b0111:
                    case(num)
                        15:col=4'b0111;
                        14:col=4'b1011;
                        13:col=4'b1101;
                        12:col=4'b1110;
                        default:col=4'b1111;
                        endcase
                endcase
            end
        end

    endmodule

