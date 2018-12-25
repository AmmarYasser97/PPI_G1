
module BSR_Mode_Testbench();
reg[7:0] PortD;
wire[7:0] PortC;


initial
begin
$monitor($time,,"Port D = %b  || Port C = %b",PortD,PortC);

#5
PortD = 8'b00001001;
#5
PortD = 8'b00001101;
#5
PortD = 8'b00000110;
#5
PortD = 8'b0000010;


end

BSR_Mode testbench(PortC,PortD);

endmodule
