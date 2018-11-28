module Control_Register_Testbench();

reg[1:0] A;
reg WRITE,READ;
reg[7:0] DATA;
wire[7:0] Control_Register;

initial 
begin
$monitor($time,,"DATA = %d,A = %b,READ = %b,WRITE = %b Control_Register = %d",DATA,A,READ,WRITE,Control_Register);
DATA = 14;
#5
A <= 0;
READ <=0;
WRITE <=0;

#5
A <= 0;
READ <=1;
WRITE <=0;

#5
READ <= 1;
WRITE <= 0;
A <= 2;

#5
DATA<=16;
READ <= 1;
WRITE <= 0;
A <= 2;

#5
READ <= 1;
WRITE <= 0;
A <= 1;

#5

READ <= 0;
WRITE <= 0;
A <= 2;

#5
READ <= 1;
WRITE <= 0;
A <= 3;

#5
A<=1;
#5
DATA = 20;

#5
A<=0;
#5
A<=3;


end

Control_Register CR(A, WRITE , READ, DATA, Control_Register);
endmodule

