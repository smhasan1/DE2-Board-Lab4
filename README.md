# DE2-Board-Lab4
**Part 1:**  
Consider the circuit in Figure 1. It is a 4-bit synchronous counter which uses four T-type flip-flops. The counter increments its value on each positive edge of the clock if the Enable signal is asserted. The counter is reset to 0 by setting the Clear signal low – it is an active- low asynchronous clear. You are to implement an 8-bit counter of this type.  


Figure 1. A 4-bit counter.  

1. Write a Verilog file that defines an 8-bit counter by using the structure depicted in Figure 1. Your code should include a T flip-flop module that is instantiated 8 times to create the counter (i.e. structural Verilog).  
2. Compile the circuit. How many logic elements (LEs) are used to implement your circuit? What is the maximum frequency, Fmax, at which your circuit can be operated? (Use Time Quest in Quartus to determine the maximum frequency Fmax.)  
3. Simulate your circuit to verify its correctness.  
4. Augment your Verilog file to use the pushbutton KEY0 as the Clock input, switches SW1 and SW0 as Enable and Clear inputs, and 7-segment displays HEX1-0 to display the hexadecimal count as your circuit operates. Make the necessary pin assignments needed to implement the circuit on the DE2 board, and compile the circuit. For this part, you should re-use the hexadecimal-to-7-segment display decoder that you created for Lab #3.  
5. Download your circuit into the FPGA chip and test its functionality by operating the switches.  
6. Use the Quartus II RTL Viewer to see how Quartus II software synthesized your circuit. What are the differences in comparison with Figure 1?  

**Part 2.**  
Another way to specify a counter is by using a register and adding 1 to its value. This can be accomplished using the following Verilog statement:  

  Q <= Q + 1;  

Compile an 8-bit version of this counter and determine the number of LEs needed and the Fmax that is attainable. Use the same KEY, SW and 7-segment displays as in Part I above. Use the RTL Viewer to see the structure of this implementation versus the design from Part I. Repeat the steps of Part I above for this counter.  

**Part 3.**  
Design and implement a circuit that flashes the red LEDs on the DE2 board in the following pattern (which mimics the “perceived” motion of the lights on an old-style movie house). First, LEDR0 turns on. After about 1 second, LEDR0 turns off and LEDR1 turns on. After 1 second, LEDR1 turns off and LEDR2 turns on, and so on, until LEDR17 turns on for 1 second. After LEDR17 has been on for a second, it turns off and LEDR16 turns on, with the pattern continuing back down to LEDR0. After reaching LEDR0, the pattern begins again.  

You may want to use your rotating register (with parallel load) from Lab #3 for this part of the lab. Note that all flip-flops used in your design must be clocked directly by the 50 MHz clock on the DE2 board. This means that your flip-flops/counters may need an “enable” signal that is asserted only in specific clock cycles.  

1. Write a Verilog file that realizes the behaviour described above. You should use the 50 MHz clock on the DE2 board as the clock input to your circuit. Your circuit should have no other inputs beside the clock.  
2. Simulate your circuit with QSim to verify its correctness.  
3. Include the pin constraints for the DE2 board, and synthesize the circuit with Quartus II.  
4. Download your circuit into the FPGA chip and test its functionality.  
