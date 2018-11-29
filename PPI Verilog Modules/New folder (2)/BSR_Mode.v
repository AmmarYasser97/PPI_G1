module BSR_Mode(Output,ENABLE,RESET,Control);


//Defining the arguments and their address size
output reg[7:0]Output;
input ENABLE;
input RESET;
input [7:0]Control;

/*

The 3 control bits from 1->3 defines the selected bit from port C to set/reset
Control[0] is the bit showing if the selected bit should be set/reset
set = 1 , reset = 0

whenever control changes the set/reset is done 

*/
always @ (Control)
begin
if(ENABLE == 1 && RESET == 0)
begin
Output[Control[3:1]] = Control[0];
end
end

endmodule
