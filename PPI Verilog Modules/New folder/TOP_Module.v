module PPI_8255(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);
input [1:0]A;
input READ,WRITE,CS,RESET;

inout [7:0]DATA;
inout [7:0]PortA;
inout [7:0]PortB;
inout [7:0]PortC;

reg [7:0]Control_Register;
wire[11:0] MODE;

assign MODE ={RESET,READ,WRITE,CS,Control_Register};

always @ (A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC,Control_Register)
begin
if(WRITE && READ && ~CS && ~RESET)
begin
Control_Register = DATA;
end

if(RESET)
begin
//Setting all Ports to Input mode
Control_Register = 8'b10011011;
end

end

Write_On_DATA(DATA, PortA, PortB, PortC, A,MODE);
Read_From_DATA(PortA, PortB, PortC, A,MODE, DATA);
BSR_Mode BSR(PortC,~DATA[7],RESET,DATA);
endmodule
