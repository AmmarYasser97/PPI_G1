module Top_Module_v2(A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC);

input [1:0]A;
input READ,WRITE,CS,RESET;

inout [7:0]DATA;
inout [7:0]PortA;
inout [7:0]PortB;
inout [7:0]PortC;


reg [7:0]Control_Register;
wire[11:0] MODE;


wire [7:0]DATA_1;
wire [7:0]DATA_3;


wire [7:0]PortA_2;


wire [7:0]PortB_2;


wire [7:0]PortC_2;


assign MODE ={RESET,READ,WRITE,CS,Control_Register};

assign DATA_1 = DATA;
assign DATA_3 = DATA;



assign PortA_2 = PortA;
assign PortB_2 = PortB;
assign PortC_2 = PortC;


//Read from Data

assign PortA = (A == 0 && MODE[11:4] == 8'b0100_1001)?DATA_1:8'bzzzz_zzzz;
assign PortB = (A == 1 && {MODE[11:7],MODE[2:1]} == 7'b0100_101)?DATA_1:8'bzzzz_zzzz;
assign PortC = (A == 2 && {MODE[11:5],MODE[3],MODE[0]} == 9'b0100_10011)?DATA_1:8'bzzzz_zzzz;


/*
assign PortA = (A == 0 && MODE == 12'b0100_1001xxxx)?DATA_1:8'bzzzz_zzzz;
assign PortB = (A == 1 && MODE == 12'b0100_1xxxx01x)?DATA_1:8'bzzzz_zzzz;
assign PortC = (A == 2 && MODE == 12'b0100_100x1xx1)?DATA_1:8'bzzzz_zzzz;*/


//write on data
//assign DATA = (A == 0 && MODE ==12'b0010_1000xxxx)?PortA_2:(A == 1 && MODE == 12'b0010_1xxxx00x)?PortB_2:(A == 2 && MODE == 12'b0010_100x0xx0)?PortC_2:8'bzzzz_zzzz;




always @ (A,READ,WRITE,CS,RESET,DATA,PortA,PortB,PortC,Control_Register)
begin
if(A[0] && A[1] && READ && ~WRITE && ~CS && ~RESET)
begin
Control_Register = DATA;
end

if(RESET)
begin
//Setting all Ports to Input mode
Control_Register = 8'b10011011;
end

end



//BSR_Mode BSR(PortC,~DATA_3[7],RESET,DATA_3);
endmodule
