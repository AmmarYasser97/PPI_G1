module Control_Register(A, WRITE , READ, DATA, Control_Register);

input [1:0]A;
input WRITE,READ;
input [7:0]DATA;
output reg[7:0] Control_Register;
always @ (A == 3 && READ && ~WRITE)
begin
Control_Register = DATA; 
end

endmodule
