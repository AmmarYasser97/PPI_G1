module INOUT_A(WRITE,READ,Control_Register,DATA,PortA);

input WRITE;
input READ;
input [7:0]Control_Register;

inout [7:0]DATA;
inout [7:0]PortA;

reg [7:0]DATA_reg;
reg [7:0]PortA_reg;



assign DATA = DATA_reg;
assign PortA = PortA_reg;

always @ (WRITE,READ)
begin

if(WRITE && ~READ && Control_Register[4] && ~Control_Register[5] && ~Control_Register[6])
begin
DATA_reg = PortA_reg;
end
else if(~WRITE && READ && ~Control_Register[4] && ~Control_Register[5] && ~Control_Register[6])
begin
PortA_reg = DATA_reg;
end
else
begin
DATA_reg = 0;
PortA_reg = 0;
end

end
endmodule

