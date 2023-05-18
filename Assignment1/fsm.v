module fsm(coin,product_name,remaining_amt,product,clk,rst,start);

input [3:0] coin;
input [1:0] product_name;
input clk,rst;
output [3:0] remaining_amt;
output [1:0]product;

reg [3:0] cn;
reg [1:0] prd;
reg 

parameter 
          
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
	   prd=product_name;
	   cn=coin;
	   product=1'b1;
	  end
	 else if(!start)
	  begin
	   coin=4'b0000;
	   product_name=1'b0;
	   product=1'b0;
	  end
	end


