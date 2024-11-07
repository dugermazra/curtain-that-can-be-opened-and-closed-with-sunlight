// Melis Azra Düðer 20220701083 241 project
 
module CurtainControl(
   input wire clk,          // System clock
   input wire reset,      
   input wire Sun,          // Sunlight sensor signal
   output reg Curtain_Open  
);
 
   reg [15:0] counter;      // 16-bit counter for delay
   
   
   parameter DELAY = 16'd10800;
   always @(posedge clk or posedge reset) begin
       if (reset) begin
           counter <= 16'd0;        // Reset the counter
           Curtain_Open <= 1'b0;    // Close the curtain by default
       end else begin
         
           if (Sun) begin   // If sunlight is present, increment the counter
               if (counter < DELAY) begin
                   counter <= counter + 1;
               end else begin
                   Curtain_Open <= 1'b1; // Open the curtain after delay
               end
           end else begin
               
               counter <= 16'd0;
               Curtain_Open <= 1'b0;
           end
       end
   end
 
endmodule
 
