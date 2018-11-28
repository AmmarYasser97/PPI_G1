module Write_On_DATA(DATA, PortA, PortB, PortC, A,MODE);

input [1:0]A;
input [11:0]MODE;
output [7:0]DATA;
input [7:0]PortA;
input [7:0]PortB;
input [7:0]PortC;


assign DATA = (A == 0 && MODE ==12'b0010_1000xxxx)?PortA:(A == 1 && MODE == 12'b0010_1xxxx00x)?PortB:(A == 2 && MODE == 12'b0010_100x0xx0)?PortC:8'bzzzz_zzzz;



endmodule
