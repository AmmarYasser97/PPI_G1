module tompmodule_testbench();

reg [1:0]A;
reg READ,WRITE,CS,RESET;

wire [7:0]DATA;
wire [7:0]PortA;
wire [7:0]PortB;
wire [7:0]PortC;

initial
begin
$monitor($time,,"CS=%b Reset=%b A=%b read=%b write=%b DATA=%b Port A=%b Port B=%b Port C=%b",
CS,RESET,A,READ,WRITE,DATA,PortA,PortB,PortC);

RESET<=1;
#10
CS<=1;
A<=00;
WRITE<=1;
READ<=0;
DATA<=14;

#10
A<=01;

#10
CS<=1;
A<=10;
WRITE<=1;
READ<=0;
DATA<=10;

#10
RESET<=1;

#10
CS<=1;
A<=01;
WRITE<=1;
READ<=0;
DATA<=12;

#10
CS<=0;
A<=01;
WRITE<=1;
READ<=0;
DATA<=9;

end


module PPI_8255 PPI(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);

endmodule 