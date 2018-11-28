
module BSR_Mode_Testbench();
reg[7:0] PortD;
wire[7:0] PortC;


initial
begin
$monitor($time,,"Port D = %b  || Port C = %b",PortD,PortC);

#5
PortD = 8'b0xxx1001;
#5
PortD = 8'b0xxx1101;
#5
PortD = 8'b0xxx0110;
#5
PortD = 8'b0xxx0010;


end

BSR_Mode testbench(PortC,PortD);

endmodule
