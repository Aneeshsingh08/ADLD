module ram(d_out,d_in,addr,wr,cs);
input [9:0]addr;
input [7:0]d_in;
output [7:0]d_out;
input wr,cs;
reg[7:0]mem[0:1023];
assign d_out =mem[addr];
always@(wr or cs)
if(wr)
mem[addr]=d_in;
endmodule
