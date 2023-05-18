module t_parking();
parameter n=4;

wire ftsens,bksens;
wire [3:0] slot;
reg start,clk;
reg [n-1:0] pw,vn;

park dut(ftsens,bksens,slot,clk,start,pw,vn);

always #5 clk=~clk;

initial 
 begin
  clk=1'b1;
  start=1'b0;
  pw=4'b0000;
   vn=4'b0000;
	#10 start=1'b1;
	    vn=4'b1000;
	    pw=4'b1001;
	 #10  pw=4'b0011;
	 
	#10 start=1'b0;
	#10 pw=4'b0000;
	
	#10 start=1'b1;
	    vn=4'b1100;
	
	#10 pw=4'b1101;
	#20 pw=4'b0011;
	#10 start=1'b0;
	
	
  end

initial 
 begin
	$monitor ($time,"ftsens=%2d,bksens=%2d,slot=%2d",ftsens,bksens,slot);
	#200  $finish;
 end

endmodule


module parking(ftsens,bksens,slot,clk,start,pw,vn);
parameter n=4;
parameter PASSWORD= 4'b1010;
parameter CLOSE=1'b0 , OPEN= 1'b1;

output reg ftsens,bksens;
output reg [3:0] slot;
input start,clk;
input [n-1:0] pw,vn;

reg [n-1:0] park[0:15];
reg [n-1:0] c_pw;
reg f,b,state,gate;
reg k=0;

always @(posedge clk)
begin
state<=gate;
end

always@ (*)
begin
case (state)
 CLOSE: begin
	 if(start)
	  begin
	   ftsens= 1'b1;
	   c_pw= pw;
	   gate= OPEN;
	  end
	 else if(!start)
	  begin
	   ftsens= 1'b0;
           bksens=1'b0;
	   slot=0;
	   c_pw=0;
	   gate= CLOSE;
	  end
	end

  OPEN: begin
	 c_pw=pw;
	 if(c_pw== PASSWORD)
	  begin
	    park[k]= vn;
	    slot= vn;
	    k= k+1;
	    bksens=1'b1;
	    gate= CLOSE;
	   end
	  else if(c_pw!= PASSWORD)
	    begin
	    bksens=1'b0;
	    slot=0;
	    gate= OPEN;
	   end
	end
  default : gate= CLOSE;
 endcase

end

endmodule

