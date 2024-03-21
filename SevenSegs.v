module SevenSegs(clk,BCD,DOT,BI,DIGS,SEGS);//注释写在文档里了，忘了在这边写，不好意思
    input clk;
    input[15:0] BCD;
    input[3:0] DOT;
    input BI;

    output reg[3:0] DIGS;
    output reg[7:0] SEGS;

    parameter SevenSegs_s0=0;
	 parameter SevenSegs_s1=1;
	 parameter SevenSegs_s2=2;
	 parameter SevenSegs_s3=3;

    wire SevenSegs_scanclk;
    reg[1:0] SevenSegs_scanning_state;
    reg[3:0] SevenSegs_Num;
    reg SevenSegs_Point;

    Filter SevenSegs_filter(
        .clk_in(clk),.clk_out(SevenSegs_scanclk),.cnt(50000),.reset(1)
    );

    always@(posedge SevenSegs_scanclk) begin
        case(SevenSegs_scanning_state)
            SevenSegs_s0:SevenSegs_scanning_state=SevenSegs_s1;
            SevenSegs_s1:SevenSegs_scanning_state=SevenSegs_s2;
            SevenSegs_s2:SevenSegs_scanning_state=SevenSegs_s3;
            SevenSegs_s3:SevenSegs_scanning_state=SevenSegs_s0;
            default:SevenSegs_scanning_state=SevenSegs_s1;
        endcase
    end

    always@(*) begin
        case(SevenSegs_scanning_state)
            SevenSegs_s0:
            begin
                DIGS=4'b0001;
                SevenSegs_Num=BCD[3:0];
                if(DOT[0]==1) SevenSegs_Point=1;
                else SevenSegs_Point=0;
            end
            SevenSegs_s1:
            begin
                DIGS=4'b0010;
                SevenSegs_Num=BCD[7:4];
                if(DOT[1]==1) SevenSegs_Point=1;
                else SevenSegs_Point=0;
            end
            SevenSegs_s2:
            begin
                DIGS=4'b0100;
                SevenSegs_Num=BCD[11:8];
                if(DOT[2]==1) SevenSegs_Point=1;
                else SevenSegs_Point=0;
            end
            SevenSegs_s3:
            begin
                DIGS=4'b1000;
                SevenSegs_Num=BCD[15:12];
                if(DOT[3]==1) SevenSegs_Point=1;
                else SevenSegs_Point=0;
            end
            default:
            begin
                DIGS=4'b0000;
                SevenSegs_Num=15;
                SevenSegs_Point=0;
            end
        endcase
    end

    always@(*)begin
        if(BI==1) SEGS[7]=0;
        else SEGS[7]=SevenSegs_Point;
    end

    always@(*) begin
        if(BI==1) SEGS[6:0]=0;
        else begin
		  case(SevenSegs_Num)
        0:SEGS[6:0]=7'b1111110;
        1:SEGS[6:0]=7'b0110000;
        2:SEGS[6:0]=7'b1101101;
        3:SEGS[6:0]=7'b1111001;
        4:SEGS[6:0]=7'b0110011;
        5:SEGS[6:0]=7'b1011011;
        6:SEGS[6:0]=7'b1011111;
        7:SEGS[6:0]=7'b1110000;
        8:SEGS[6:0]=7'b1111111;
        9:SEGS[6:0]=7'b1111011;
        default:SEGS[6:0]=7'b0000000;
        endcase
		  end
    end

endmodule