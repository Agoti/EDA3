module KeyboardScanner(clk,col,row,key,pressed);
    input clk;
    input[3:0] col;

    output reg[3:0] row;
    output reg[15:0] key;
    output wire pressed;
	 
    wire scan_clk;
    reg[1:0] state;
    reg[3:0] pcheck;

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    

    Filter keyboard_clk_filter(.clk_in(clk),.cnt(50000),.clk_out(scan_clk)
    ,.reset(1));//分频1kHz

    //assign scan_clk=clk;

    always @(posedge scan_clk) begin//状态机：扫描四行

        case(state)
            s0:state=s1;
            s1:state=s2;
            s2:state=s3;
            s3:state=s0;
            default:state=s0;
        endcase
    end
    always @(state) begin//给出行输出
        case(state)
            s0:row=4'b0111;
            s1:row=4'b1011;
            s2:row=4'b1101;
            s3:row=4'b1110;
            default:;
        endcase
    end

    always @(negedge scan_clk) begin//根据行和列确定键值
        case(row)
            4'b1110:
            case(col)
                4'b1110:begin key=~16'h0001;pcheck[0]=1; end
                4'b1101:begin key=~16'h0002;pcheck[0]=1; end
                4'b1011:begin key=~16'h0004;pcheck[0]=1; end
                4'b0111:begin key=~16'h0008;pcheck[0]=1; end
                4'b1111:begin key=key;pcheck[0]=0; end
                default:begin key=key;pcheck[0]=1; end
            endcase
            4'b1101:
            case(col)
                4'b1110:begin key=~16'h0010;pcheck[1]=1; end
                4'b1101:begin key=~16'h0020;pcheck[1]=1; end
                4'b1011:begin key=~16'h0040;pcheck[1]=1; end
                4'b0111:begin key=~16'h0080;pcheck[1]=1; end
                4'b1111:begin key=key;pcheck[1]=0; end
                default:begin key=key;pcheck[1]=1; end
            endcase
            4'b1011:
            case(col)
                4'b1110:begin key=~16'h0100;pcheck[2]=1; end
                4'b1101:begin key=~16'h0200;pcheck[2]=1; end
                4'b1011:begin key=~16'h0400;pcheck[2]=1; end
                4'b0111:begin key=~16'h0800;pcheck[2]=1; end
                4'b1111:begin key=key;pcheck[2]=0; end
                default:begin key=key;pcheck[2]=1; end
            endcase
            4'b0111:
            case(col)
                4'b1110:begin key=~16'h1000;pcheck[3]=1; end
                4'b1101:begin key=~16'h2000;pcheck[3]=1; end
                4'b1011:begin key=~16'h4000;pcheck[3]=1; end
                4'b0111:begin key=~16'h8000;pcheck[3]=1; end
                4'b1111:begin key=key;pcheck[3]=0; end
                default:begin key=key;pcheck[3]=1; end
            endcase
            default:begin key=key;pcheck=1; end
        endcase
    end

    assign pressed=pcheck[0]|pcheck[1]|pcheck[2]|pcheck[3];//按下标志

endmodule