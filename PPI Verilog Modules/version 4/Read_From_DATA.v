module Read_From_DATA(PortA, PortB, PortC, A,MODE, DATA);

input [1:0]A;
input [11:0]MODE;
input [7:0]DATA;
output [7:0]PortA;
output [7:0]PortB;
output [7:0]PortC;

assign PortA = (A == 0 && MODE == 12'b0100_1001xxxx)?DATA:8'bzzzz_zzzz;
assign PortB = (A == 1 && MODE == 12'b0100_1xxxx01x)?DATA:8'bzzzz_zzzz;
assign PortC = (A == 2 && MODE == 12'b0100_100x1xx1)?DATA:8'bzzzz_zzzz;


endmodule
