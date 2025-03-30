`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 02:48:50 PM
// Design Name: 
// Module Name: module_testmips32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module module_testmips32();

reg clk1,clk2;

pipe_mips_32 uut(.clk1(clk1),.clk2(clk2));

initial begin
clk1=0;clk2=0; 
repeat (20)begin
    #5 clk1=1;#5 clk1=0;
    #5 clk2=1;#5 clk2=0;
   end 
end 

initial begin

 //Test case 1 
 

//for(integer k = 0 ; k < 31 ; k = k + 1)
//    pipe_mips_32.Reg[k] = k;
    
    
//    pipe_mips_32.mem[0] <= 32'h2801000a;     // ADDI R1,R0,10
//    pipe_mips_32.mem[1] <= 32'h28020014;     // ADDI R2,R0,20      
//    pipe_mips_32.mem[2] <= 32'h28030019;     // ADDI R3,R0,25
//    pipe_mips_32.mem[3] <= 32'h0ce77800;     // OR   R7,R7,R7    this is an dummy to overcome the data hazard
//    pipe_mips_32.mem[4] <= 32'h0ce77800;     // OR   R7,R7,R7    this is an dummy to overcome the data hazard
//    pipe_mips_32.mem[5] <= 32'h00222000;     // ADDI R4,R1,R2
//    pipe_mips_32.mem[6] <= 32'h0ce77800;     // OR   R7,R7,R7    this is an dummy to overcome the data hazard
//    pipe_mips_32.mem[7] <= 32'h00832800;     // ADD R5,R4,R3
//    pipe_mips_32.mem[8] <= 32'hfc000000;     //HALT
    
//    pipe_mips_32.halted <= 0;
//    pipe_mips_32.pc <= 0;  
//    pipe_mips_32.taken_branch <= 0; 
    
    
//    #280 
//    for(integer i = 0 ; i < 6 ; i = i + 1)
//        $display("R%1d - %2d", i,pipe_mips_32.Reg[i] );
        
        
  //Test case 2
  
  
//  for(integer k = 0 ; k < 32 ; k = k + 1)
//         pipe_mips_32.Reg[k] = k;
         
//     pipe_mips_32.mem[0] <= 32'h28010078;        //ADDI R1,R0,120   
//     pipe_mips_32.mem[1] <= 32'h0c631800;        //OR R3,R3,R3  dummy variable to overcome the data hazard
//     pipe_mips_32.mem[2] <= 32'h20220000;        //LW R2,0(R1) 
//     pipe_mips_32.mem[3] <= 32'h0c631800;        //OR R3,R3,R3  dummy variable to overcome the data hazard
//     pipe_mips_32.mem[4] <= 32'h2842002d;        //ADDI R2,R2,45 
//     pipe_mips_32.mem[5] <= 32'h0c631800;        // OR R3.R3.R3  dummy variable to overcome the data hazard
//     pipe_mips_32.mem[6] <= 32'h24220001;        //SW,R2,1(R1)
//     pipe_mips_32.mem[7] <= 32'hfc000000;        //HALT
     
//     pipe_mips_32.mem[120] <= 100;
     
    
//    pipe_mips_32.halted <= 0;
//    pipe_mips_32.pc <= 0;  
//    pipe_mips_32.taken_branch <= 0;  
    
     
//   #500 $display("mem[120] :  %4d  \n mem[121] : %4d",pipe_mips_32.mem[120],pipe_mips_32.mem[121]);    
            

//Test case 3 factorial of a number which is stored in address 200 and final answer stored will bw stored in 198 

for(integer k = 0 ; k < 32 ; k = k + 1)
    pipe_mips_32.Reg[k] <= k;
    
    pipe_mips_32.mem[0] <= 32'h280a00c8;        // ADDI R10,R0,200 
    pipe_mips_32.mem[1] <= 32'h28020001;        // ADDI  R2,R0,1 
    pipe_mips_32.mem[2] <= 32'h0e94a000;        // OR R20,R20,R20   dummy variable to overcome the data hazard
    pipe_mips_32.mem[3] <= 32'h21430000;        // LW R3,0(R10)
    pipe_mips_32.mem[4] <= 32'h0e94a000;        // OR R20,R20,R20   dummy variable to overcome the data hazard
    pipe_mips_32.mem[5] <= 32'h14431000;        //LOOP MUL R2,R2,R3
    pipe_mips_32.mem[6] <= 32'h2c630001;        //SUBI R3,R3,1
    pipe_mips_32.mem[7] <= 32'h0e94a000;        //OR R20,R20,R20    dummy variable to overcome the data hazard
    pipe_mips_32.mem[8] <= 32'h3460fffc;        //BNEQZ R3 , LOOP
    pipe_mips_32.mem[9] <= 32'h2542fffe;        //SW R2,-2(R2)
    pipe_mips_32.mem[10]<= 32'hfc000000;        //HALT
    
    
       pipe_mips_32.mem[200] <= 4 ;
     
    
    pipe_mips_32.halted <= 0;
    pipe_mips_32.pc <= 0;  
    pipe_mips_32.taken_branch <= 0;  
    
   
   $monitor ("R2 : %4d ",pipe_mips_32.Reg[2]);  
   #500 $display("mem[200] :  %2d  \n mem[198] : %6d",pipe_mips_32.mem[200],pipe_mips_32.Reg[2]);    
   
    
         
    #100 $finish;    
        
 end              
    
endmodule
