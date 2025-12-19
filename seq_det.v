module seq_det(in,out,rst,clk);
input rst,clk,in;
output out;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
parameter s6=3'b110;
reg [2:0]ps,ns;

//present state logic
always @ (posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

//next state logic
always @(*)
begin
ns=s0;
case(ps)

s0:if(in)
ns=s1;
else
ns=s0;

s1:if(in)
ns=s2;
else
ns=s3;

s2:if(in)
ns=s6;
else
ns=s5;

s3:if(in)
ns=s4;
else
ns=s0;

s4:if(in)
ns=s2;
else
ns=s3;

s5:if(in)
ns=s4;
else
ns=s0;

s6:if(in)
ns=s6;
else
ns=s5;
endcase
end

//output logic
assign out=(ps==s4 || ps==s5 || ps==s6 ) ? 1'b1:1'b0;

endmodule

