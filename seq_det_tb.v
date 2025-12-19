module seq_det_tb();
reg rst,clk,in;
wire out;
seq_det dut(in,out,rst,clk);

task initialize;
begin
clk=1'b0;
rst=1'b1;
in=1'b0;
end
endtask

always #5 clk=~clk;

task rst_d;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task inputs(input integer i);
begin
@(negedge clk)
in=i;
end
endtask

initial
begin
initialize;
rst_d;
inputs(0);
inputs(0);
inputs(1);
inputs(0);
inputs(1);
inputs(0);
inputs(1);
inputs(1);
inputs(0);
inputs(0);
inputs(1);
inputs(1);
inputs(1);
inputs(0);
#10;
$finish;
end
endmodule

