module Binary2BCD(bin1,bin2,bcd);//这个模块弃用了

input[7:0] bin1;
input[7:0] bin2;

output[15:0] bcd;

assign bcd[15:12]=bin1/10;
assign bcd[11:8]=bin1%10;
assign bcd[7:4]=bin2/10;
assign bcd[3:0]=bin1%10;

endmodule