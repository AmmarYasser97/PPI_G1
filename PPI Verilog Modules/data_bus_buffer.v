module data_bus_buffer(control_signal, PD, internal_bus);


input control_signal;
//determines the direction of the data bus (0 => output) (1 => input)

inout [7:0]internal_bus;
//connected to the internal bus of the 8255A

inout [7:0]PD;
//connected to the system data bus. Transfers data, control word or status information


//_________________________________________________________________________________________//


assign PD = (control_signal == 1 || control_signal == 1'bZ || control_signal == 1'bX)? internal_bus: 8'bZZZZ_ZZZZ;
//if control_signal == 1 or Z or X ==> input  ==> PD takes the value of internal_bus
//if control_signal == 0           ==> output ==> PD is left floating and is driven by the processor

assign internal_bus = control_signal? 8'bZZZZ_ZZZZ: PD;
//if control_signal == 1 or Z or X ==> input  ==> internal_bus is left floating and is driven by the periferal
//if control_signal == 0           ==> output ==> internal bus takes the value of PD

endmodule

module test_data_bus_buffer();

reg control_signal;
wire [7:0] PD;
wire [7:0] internal_bus;

assign PD = control_signal? 8'bZZZZ_ZZZZ: 10;
assign internal_bus = (control_signal == 1 || control_signal == 1'bZ || control_signal == 1'bX)? 5: 8'bZZZZ_ZZZZ;

initial
begin
$monitor("%d %d %d", control_signal, PD, internal_bus); //ouput goes X when control_signal is 0 when adding the X and Z conditions
control_signal <= 0;
#10
control_signal <= 1;
#10
control_signal <= 0;
#10
control_signal <= 1;
#10
control_signal <= 1'bZ;
#10
control_signal <= 1'bX;
end

data_bus_buffer b2(control_signal, PD, internal_bus);
endmodule