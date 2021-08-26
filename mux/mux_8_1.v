
module mux8_1(out ,in ,s 
    );
output out;
input [7:0] in;
input [2:0] s;
wire [5:0] k ;
	mux2_1 mux1(k[0] , in[1:0] , s[0]);
	mux2_1 mux2(k[1] , in[3:2] , s[0]);
	mux2_1 mux3(k[2] , in[5:4] , s[0]);
	mux2_1 mux4(k[3] , in[7:6] , s[0]);
	mux2_1 mux5(k[4] , k[1:0]  , s[1]);
	mux2_1 mux6(k[5] , k[3:2]  , s[1]);
	mux2_1 mux7(out  , k[5:4]  , s[2]);
endmodule

module mux2_1( output o, input [1:0] in ,input s);
assign o = s ? in[1]:in[0];

endmodule
