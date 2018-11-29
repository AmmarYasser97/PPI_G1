module new();

reg [1:0]A;
reg READ,WRITE,CS,RESET;

wire [7:0]DATA;
wire [7:0]PortA;
wire [7:0]PortB;
wire [7:0]PortC;

reg [7:0]DATA_reg;
reg [7:0]PortA_reg;
reg [7:0]PortB_reg;
reg [7:0]PortC_reg;


assign DATA =(~WRITE && READ && ~CS && ~RESET )?DATA_reg:8'bzzzz_zzzz;

assign PortA = (WRITE && ~READ && ~CS && ~RESET )?PortA_reg:8'bzzzz_zzzz;
assign PortB = (WRITE && ~READ && ~CS && ~RESET )?PortB_reg:8'bzzzz_zzzz;
assign PortC = (WRITE && ~READ && ~CS && ~RESET )?PortC_reg:8'bzzzz_zzzz;


initial
begin
$monitor($time,,"CS=%b Reset=%b A=%b read=%b write=%b DATA=%d - %b Port A=%d Port B=%d Port C=%b",
CS,RESET,A,READ,WRITE,DATA, DATA,PortA,PortB,PortC);
#5
RESET<=1;
#5
RESET<=0;
#5
CS<=0;
READ<=1;
WRITE<=0;
/*
#5
DATA_reg<=8'b1001_1011;
A<=2'b11;
#5
A<=2'b10;
DATA_reg <= 8'b0000_1111;
#5
DATA_reg <= 8'b0000_000_0;
#5
DATA_reg <= 8'b0000_010_0;
#5
DATA_reg <= 8'b0000_100_1;
#5
DATA_reg <= 8'b0000_110_1;

*/

#5
DATA_reg <= 8'b1001_1011;
A<=3;
#5
DATA_reg <= 15;
A<=00;

#5
DATA_reg <= 20;
A<=01;

#5
DATA_reg <= 25;
A<=10;


#5
A<=00;
#1
A<=01;
DATA_reg<=110;

#5
A=3;
DATA_reg <= 8'b1000_0000;


#5
READ <= 0;
WRITE <= 1;
PortA_reg<=90;
A=00;

#5
READ <= 1;
WRITE <= 0;
A<=11;
DATA_reg <= 8'b0101_000_0;

#5
DATA_reg <= 8'b0111_001_1;

#5
A=3;
DATA_reg <= 8'b1001_1011;

#5
A=2'b00;
DATA_reg <= 99;

#5
CS<=1;
end



//PPI_8255 PPI(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);
New_TOP T(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);
endmodule 
