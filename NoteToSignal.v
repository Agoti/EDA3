module NoteToSignal(clk,note,mute,SPK);
    input clk;
    input[4:0] note;//音符
	 input mute;//静音信号
    
    output SPK;

    reg[31:0] freq;
	 wire[31:0] tone;
	 
	 assign tone=5000/freq;//频率转换为分频宽度

    reg reset;

    Filter n2s_filter(.clk_in(clk),.clk_out(SPK),.cnt(tone),.reset(reset));

    always@(note or mute)begin//音符转换为频率
	 if(mute==0) begin reset=0;freq=262; end
	 else
        case(note)
        0:begin reset=0;freq=262; end//0表示休止符
        25:begin reset=1;freq=262; end//之前用的低音效果不好，后来用高音，没改谱子改的这里
        26:begin reset=1;freq=294; end
        27:begin reset=1;freq=330; end
        28:begin reset=1;freq=349; end
        29:begin reset=1;freq=392; end
        30:begin reset=1;freq=440; end
        31:begin reset=1;freq=494; end
        1:begin reset=1;freq=523; end
        2:begin reset=1;freq=587; end
        3:begin reset=1;freq=659; end
        4:begin reset=1;freq=699; end
        5:begin reset=1;freq=784; end
        6:begin reset=1;freq=880; end
        7:begin reset=1;freq=988; end
        8:begin reset=1;freq=1047; end
        9:begin reset=1;freq=1179; end
		  10:begin reset=1;freq=1319; end
		  11:begin reset=1;freq=1397; end
		  12:begin reset=1;freq=1568; end
		  13:begin reset=1;freq=1760; end
		  14:begin reset=1;freq=1976; end
		  15:begin reset=1;freq=1179; end
        default:begin reset=0;freq=262; end
        endcase
    end

endmodule