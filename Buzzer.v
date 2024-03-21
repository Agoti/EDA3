module Buzzer(clk,enable,done,SPK);
    input clk;
    input enable;//使能端：每次使能都重新播放曲子，高电平有效

    output done;//播放完后输出1
    output SPK;//音频信号

    wire[4:0] note;
    ROM myROM(.clock(clk),.address(counter_num),.q(note));//ROM

    wire[31:0] counter_num;
    Counter mycounter(.clk(clk),.sup(255),.duration(100),.reset(enable),
        .number(counter_num),.carry(done));//计数器

    NoteToSignal mysig(.clk(clk),.note(note),.SPK(SPK),.mute(enable));//转换为音频信号

endmodule