module PPI_8255();

input RD_bar; //read control signal
input WR_bar; //write control signal
input CS_bar; //enables the communication between microprocessor and periferals

//A1 and A0 select the port to read/write
input A0;
input A1;

input RESET;

//PORTS
inout [7:0]PA;
inout [7:0]PB;
inout [7:4]PC_u;
inout [3:0]PC_l;
inout [7:0]PD;


endmodule
