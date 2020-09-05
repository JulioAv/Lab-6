module testbench();

	reg clk, D, reset;
	wire Q;
	
	initial begin
	
		$monitor("clk=%b reset=%b D=%b Q=%b", clk, reset, D, Q);
		clk=0;
		#1 reset=0;
		D=0;
		#1 reset=1;
		#2 reset=0;
		
		repeat (4) begin
		
			#2 D=~D;
		end 
		
		#2 $finish;
		
		$dumpfile("dff_tb.vcd");
		$dumpvars(0, testbench);
	
	end 
	
		always
		#1 clk=~clk;

endmodule 