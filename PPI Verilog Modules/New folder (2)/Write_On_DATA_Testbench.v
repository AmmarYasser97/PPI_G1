module Write_On_DATA_Testbench();
wire [7:0]DATA;
reg [7:0]PortA;
reg [7:0]PortB;
reg [7:0]PortC;

reg [1:0]A;


initial
begin
$monitor($time,,"DATA = %d    || A =%b    || PortA = %d      ||   PortB = %d      || PortC = %d",DATA , A, PortA,PortB,PortC);

#5
A <= 0;
PortA <= 20;

#5
PortA <=30;

#5
A <= 1;

#5
PortB <= 50;

#5
A<=2;


end



Write_On_DATA X(DATA, PortA, PortB, PortC , A);
endmodule
