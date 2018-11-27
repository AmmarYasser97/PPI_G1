module port(PX,internal_bus,enable_signal,group_signal);

input enable_signal,group_signal;
//enable_signal => signal which comes from R/W control logic
//group_signal => signal which comes from Group control 

inout [7:0]PX,[7:0]internal_bus;
//PX => 8 bits of data
//internal_bus => connected to the internal bus of the 8255A


 //***********************************************************************//

assign PX = (enable_signal)?(group_signal)? 8'bzzzz_zzzz: internal_bus: /*handle not enable port*/;
//if enable_signal == 1 then port is enable
//	if group signal == 1 ==> input ==> PX is left floating and is driven by user
//	else if group signal ==0 ==> output ==> PX takes the value of internal bus
//else if enable_signal == 0 then port is disabled

assign internal_bus = (enable_signal)?(group_signal)? PX: /* data from data buffer*/:/*handle not enable port*/;
//if enable_signal == 1 then port is enable
//	if group signal == 1 ==> input ==> ????
//	else if group signal ==0 ==> output ==> PX takes the value of internal bus
//else if enable_signal == 0 then port is disabled




endmodule 