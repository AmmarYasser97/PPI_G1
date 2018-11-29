module Read_From_DATA_Testbench();
reg [1:0]A;
reg [7:0]DATA;
wire [7:0]PortA;
wire [7:0]PortB;
wire [7:0]PortC;

initial
begin
$monitor($time,,"DATA = %d    || A =%b    || PortA = %d      ||   PortB = %d      || PortC = %d",DATA , A, PortA,PortB,PortC);

#5
A <= 0;
DATA <= 20;

#5
DATA <=30;

#5
A <= 1;

#5
A <=2;


end


Read_From_DATA X(PortA, PortB, PortC, A, DATA);
endmodule

