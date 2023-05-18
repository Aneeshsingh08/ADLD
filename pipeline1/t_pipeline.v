module t_pipeline();
parameter N=10;
reg [N-1:0]A,B,C,D;
reg  clk;
wire [N-1:0] F;
pipeline dut(F,A,B,C,D,clk);
initial clk=1'b0;
always #5 clk=~clk;
  initial 
   begin
	#4 A=7'd10;
	   B=7'd20;
 	   C=7'd30;
	   D=7'd40;

	#4 A=7'd5;
	   B=7'd10;
 	   C=7'd20;
	   D=7'd15;

     	#4 A=7'd1;
	   B=7'd2;
 	   C=7'd3;
	   D=7'd4;
   end
initial 
  begin
	$monitor($time, "F=%d",F);
	#600 $finish;
  end
endmodule


module pipeline(F,A,B,C,D,clk);
parameter N =10;
input [N-1:0] A,B,C,D;
input clk;
output [N-1:0] F;
reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;
assign F=  L34_F;
always @(posedge clk)
	begin
	    L12_x1 <= #4 A+B;
	    L12_x2 <= #4 C-D;
	    L12_D  <= D;


	    L23_x3 <= #4 L12_x1+L12_x2;
	    L23_D  <= L12_D;

	    L34_F <= #6 L23_x3 * L23_D;
	end

endmodule
