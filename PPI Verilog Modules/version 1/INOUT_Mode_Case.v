module INOUT_Mode_Case(A, WRITE , READ,DATA, PortA, PortB, PortC);

//Defining the arguments and their address size
input [1:0] A;
input WRITE, READ;

inout [7:0]DATA;
inout [7:0]PortA;
inout [7:0]PortB;
inout [7:0]PortC;

reg [7:0]DATA_reg;
reg [7:0]PortA_reg;
reg [7:0]PortB_reg;
reg [3:0]PortC_U_reg;
reg [3:0]PortC_L_reg;

assign DATA = (~READ && WRITE)? DATA_reg: 8'bzzzz_zzzz;

assign PortA = (READ && ~WRITE)? PortA_reg: 8'bzzzz_zzzz;
assign PortB = (READ && ~WRITE)? PortB_reg: 8'bzzzz_zzzz;
assign PortC = (READ && ~WRITE)? {PortC_U_reg,PortC_L_reg}: 8'bzzzz_zzzz;

//register to save the last control register

reg [7:0]Control_Register;



always @ (WRITE, READ, A)
begin

/*
DATA_reg = DATA;
PortA_reg = PortA;
PortB_reg = PortB;
{PortC_U_reg, PortC_L_reg} = PortC;
*/

//if (A == 3 && READ && ~WRITE)
//Control_Register = DATA_reg;

casez({A, READ, WRITE, Control_Register[6:0]})

11'b1110_zzzzzzz : Control_Register = DATA_reg;


11'b0001_001zzzz : DATA_reg = PortA_reg;
11'b0101_zzzz01z : DATA_reg = PortB_reg;
11'b1001_00z1zzz : DATA_reg = PortC_U_reg;
11'b1001_zzzz0z1 : DATA_reg = PortC_L_reg;

11'b0010_000zzzz : PortA_reg = DATA_reg;
11'b0110_zzzz00z : PortB_reg = DATA_reg;
11'b1010_00z0zzz : PortC_U_reg = DATA_reg;
11'b1010_zzzz0z0 : PortC_L_reg = DATA_reg;

default: Control_Register = 8'b11111111;

endcase

/*
DATA = DATA_reg;
PortA = PortA_reg;
PortB = PortB_reg;
PortC = {PortC_U_reg,PortC_L_reg};
*/

end


endmodule

