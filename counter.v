`timescale 1ns / 1ps
module counter
(
	input clk,
    input rst,
    output led1,led2
    );
 
reg [26:0] count; //A sizable 27 bit register so that the blink can be seen and is visible, too small a register will make the
      //register stay on as it will blink extremely fast.
reg [1:0] blinker = 2'b11;

always@ (posedge clk or posedge rst)
 begin
  if (rst)
   count <= 0;  //if reset button is pressed, initialize or reset the register
  else
  begin
   count <= count + 1;
	if(count[23] == 0)
		blinker <= 2'b01;
	else
		blinker <= 2'b10;
	end
 end
   
assign led1 = blinker[0];
assign led2 = blinker[1];


endmodule