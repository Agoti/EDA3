module Controller(clk,rd,num,pressed,sup,reset,number,
                    carry,bcd,bi,enable,done);

    input clk;
	 input rd;
    input[3:0] num;
    input pressed;
    output reg[31:0] sup;
    output reg reset;
    input[31:0] number;
    input carry;
    output reg[15:0] bcd;
    output reg bi;
    output reg enable;
    input done;

    localparam sleep=3'b000;
    localparam init=3'b001;
    localparam coin0=3'b010;
    localparam coin1=3'b011;
    localparam charge=3'b100;
    localparam finish=3'b101;

    wire controller_clk;
    Filter controller_clk_filter(
        .clk_in(clk),.cnt(50000),.clk_out(controller_clk),.reset(1)
    );
    
	 //assign controller_clk=clk;
	 
    reg[2:0] state;
	 
	 initial state=sleep;

    always@(posedge controller_clk or negedge rd)begin
	 if(!rd) state=sleep;
	 else
        case(state)
            sleep:
                if(pressed&&num==10)state=init;
                else state=sleep;
            init:
                if(carry)state=sleep;
                else if(pressed&&num>=0&&num<=8)state=coin1;
                else state=init;
            coin0:
					 //if(carry)state=sleep;
                if(pressed&&num==11)state=init;
                else if(pressed&&num==12)state=charge;
                else if(pressed&&num>=0&&num<=9)state=coin1;
                else state=coin0;
            coin1:
                if(!pressed)state=coin0;
					 else state=coin1;					 
            charge:
                if(carry)state=finish;
                else if(pressed&&num==11)state=init;
					 else state=charge;
            finish:
                if(done||(pressed&&num==11))state=init;
                else state=finish;
				default:state=sleep;
        endcase
    end

    always@(posedge controller_clk)begin
        case(state)
            sleep:
				begin
					 
					 sup=10;
                reset=0;
					
                bcd=16'h0000;
                bi=1;

                enable=0;
                
				end
            init:
				begin
                
					 sup=10;
                if(pressed&&num>=0&&num<=8)begin 
                reset=0;
					 
					 bcd[15:12]=4'h0;
					 bcd[11:8]=(num+1);
					 bcd[7:4]=((num+1)<<1)/10;
					 bcd[3:0]=((num+1)<<1)%10;
					 end
                else begin 
                reset=1;
					 
					 bcd=16'h0000;
					 end
					
					 bi=0;
					 enable=0;                
				end
            coin0:
				begin
                sup=10;
                reset=0;
					 
					 if(pressed&&num>=0&&num<=9)begin 

						if(bcd[15:12]==4'h0)
						begin 
							if(bcd[11:8]==4'h1)begin
							bcd[15:12]=4'h1;
							bcd[11:8]=(num+1)%10;
							bcd[7:4]=((10+((num+1)%10))<<1)/10;
							bcd[3:0]=((10+((num+1)%10))<<1)%10;
							end

							else begin
						
								bcd[15:8]=8'h20;
								bcd[7:0]=8'h40;
							end
						end
						else begin
							bcd=bcd;
						end
					end
					else bcd=bcd;


                
                bi=0;

                enable=0;
				end
            coin1:
				begin
					 reset=0;
					 
					 sup=10;
                bcd=bcd;
					 
					 bi=0;

                enable=0;
				end
            charge:
				begin
                sup=(bcd[15:12]*10+bcd[11:8])<<1;
					 
					 if(pressed&&num==11)
                reset=0;
					 else reset=1;
					 
                bcd[15:8]=bcd[15:8];
                bcd[7:4]=(((bcd[15:12]*10+bcd[11:8])<<1)-number)/10;
					 bcd[3:0]=(((bcd[15:12]*10+bcd[11:8])<<1)-number)%10;
                bi=0;

                enable=0;
				end
            finish:
				begin
                sup=10;
                reset=0;

                bcd=16'h0000;
                bi=0;

                enable=1;
				end
				default:
				begin
					 sup=10;
                reset=0;

                bcd=16'h0000;
                bi=1;

                enable=0;
				end
        endcase
    end


endmodule


// module Controller(clk,col,row,digs,segs,SPK);
//     input clk;
//     input [3:0] col;
//     output [3:0] row;
//     output [3:0] digs;
//     output [7:0] segs;

//     output SPK;

//     wire[3:0] num;
//     wire toggle;

//     Keyboard controller_keyboard(
//         .clk(clk),
//         .col(col),
//         .row(row),
//         .num(num),
//         .toggle(toggle)
//     );

//     reg[15:0] bcd;
//     reg rbi;
    
//     SevenSegs controller_display(
//         .clk(clk),
//         .BCD(bcd),
//         .DIGS(digs),
//         .SEGS(segs),
//         .DOT(4'b0100),
//         .RBI(rbi)
//     );

//     reg reset;
//     reg[31:0] sup;

//     wire[31:0] sec_passed;
//     wire time_up;

//     Counter controller_counter(
//         .clk(clk),
//         .sup(sup),
//         .duration(50000000),
//         .reset(reset),
//         .number(sec_passed),
//         .carry(time_up)
//     );

//     localparam k0 = 6'd0,k1 = 6'd1,k2 = 6'd2,k3 = 6'd3,k4 = 6'd4,k5 = 6'd5,k6 = 6'd6,k7 = 6'd7
//     ,k8 = 6'd8,k9 = 6'd9,k10 = 6'd10,k11 = 6'd11,k12 = 6'd12,k13 = 6'd13,k14 = 6'd14,k15 = 6'd15,k16 = 6'd16
//     ,k17 = 6'd17,k18 = 6'd18,k19 = 6'd19,k20 = 6'd20;
//     localparam c0 = 6'd30,c1 = 6'd31,c2 = 6'd32,c3 = 6'd33,c4 = 6'd34,c5 = 6'd35,c6 = 6'd36,c7 = 6'd37
//     ,c8 = 6'd38,c9 = 6'd39,c10 = 6'd40,c11 = 6'd41,c12 = 6'd42,c13 = 6'd43,c14 = 6'd44,c15 = 6'd45,
//     c16 = 6'd46,c17 = 6'd47,c18 = 6'd48,c19 = 6'd49,c20 = 6'd50;
//     localparam finish=6'd21;
//     localparam init=6'd22;

//     wire controller_clk;
//     Filter controller_clk_filter(
//         .clk_in(clk),.cnt(50000),.clk_out(controller_clk),.reset(1)
//     );

//     reg[1:0] prev_press;
//     wire toggle_negedge;

//     always@(posedge controller_clk) begin
// 	     prev_press[1]=prev_press[0];
//         prev_press[0]=toggle;
//     end

//     assign toggle_negedge=prev_press[1]&(~prev_press[0]);

//     wire done;
//     reg dis;
//     Buzzer mybuzzer(
//         .clk(clk),.done(done),.dis(dis),.SPK(SPK)
//     );


//     reg[5:0] state;
// 	 reg[5:0] next_state;

//     initial state=init;
	 
// 	always@(posedge controller_clk) begin
//         state=next_state;
//     end

//     always@(*) begin
//         case(state)
//         init:
//         begin
//             if(num==10) next_state=k0;
//             else next_state=init;
//         end
//         k0:
//         begin
//             if(time_up) next_state=init;
//             else 
// 				if(toggle_negedge)
//             case(num)
//                 0: next_state=k1;
//                 1: next_state=k2;
//                 2: next_state=k3;
//                 3: next_state=k4;
//                 4: next_state=k5;
//                 5: next_state=k6;
//                 6: next_state=k7;
//                 7: next_state=k8;
//                 8: next_state=k9;
//                 9: next_state=k0;
// 				default: next_state=k0;
//             endcase
// 				else next_state=k0;
//         end
//         k1:
//         begin
//             if(time_up) next_state=init;
//             else if(toggle_negedge)
//             case(num)
//                 0: next_state=k11;
//                 1: next_state=k12;
//                 2: next_state=k13;
//                 3: next_state=k14;
//                 4: next_state=k15;
//                 5: next_state=k16;
//                 6: next_state=k17;
//                 7: next_state=k18;
//                 8: next_state=k19;
//                 9: next_state=k10;
//                 11: next_state=k0;
//                 12: next_state=c1;
//                 default:next_state=k1;
//             endcase
// 			else next_state=k1;
//         end
//         k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20:
//         begin
//             if(time_up) next_state=init;
//             else if(toggle_negedge)
//             case(num)
//                 0: next_state=k20;
//                 1: next_state=k20;
//                 2: next_state=k20;
//                 3: next_state=k20;
//                 4: next_state=k20;
//                 5: next_state=k20;
//                 6: next_state=k20;
//                 7: next_state=k20;
//                 8: next_state=k20;
//                 9: next_state=k20;
//                 11: next_state=k0;
//                 12: 
// 						case(state)
// 						k2:next_state=c2;k3:next_state=c3;k4:next_state=c4;k5:next_state=c5;
// 						k6:next_state=c6;k7:next_state=c7;k8:next_state=c8;k9:next_state=c9;k10:next_state=c10;
// 						k11:next_state=c11;k12:next_state=c12;k13:next_state=c13;k14:next_state=c14;k15:next_state=c15;
// 						k16:next_state=c16;k17:next_state=c17;k18:next_state=c18;k19:next_state=c19;k20:next_state=c20;default:next_state=init;
// 						endcase
//                 default:next_state=state;
//             endcase
// 				else next_state=state;
//         end
//         c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20:
//         begin
//             if(time_up) next_state=finish;
//             else if(num==11) next_state=k0;
// 				else next_state=state;
//         end
//         finish:
//             if(num==11) next_state=k0;
//             else if(done) next_state=k0;
// 			else next_state=finish;
// 			default: next_state=state;
// 		  endcase
//     end

//     // reg[1:0] charging_begin;
//     // wire charge_posedge;

//     // always@(posedge controller_clk) begin
// 	//      charging_begin[1]=charging_begin[0];
//     //     if(state>=c0&&state<=c20) charging_begin[0]=1;
//     //     else charging_begin[0]=0;
//     // end

//     // assign charge_posedge=charging_begin[0]&(~charging_begin[1]);

//     always@(*) begin
//         if(state==init)begin
//             rbi=1;
//             bcd=0;
//             dis=0;
				
//             reset=0;
// 				sup=10;

//         end
//         else if(k0<=state&&state<=k20) begin
//             rbi=0;
//             bcd[15:12]=state/10;
//             bcd[11:8]=state%10;
//             bcd[7:0]=0;

//             reset=~toggle_negedge;
//             sup=10;

//             dis=0;
//         end
//         else if(c0<=state&&state<=c20) begin
//             rbi=0;
//             bcd[15:12]=(state-30)/10;
//             bcd[11:8]=(state-30)%10;
//             bcd[7:4]=((sup-sec_passed)/10)%10;
//             bcd[3:0]=(sup-sec_passed)%10;

//             reset=1;
//             sup=(state-30)<<1;

//             dis=0;
//         end
//         else if(state==finish) begin
//             rbi=0;
//             bcd=0;

//             reset=0;
// 				sup=10;

//             dis=1;
//         end
// 		  else 
// 		  begin
// 			rbi=1;
//             bcd=0;
//             dis=0;

//             reset=0;
// 				sup=10;
// 		  end
//     end


// endmodule