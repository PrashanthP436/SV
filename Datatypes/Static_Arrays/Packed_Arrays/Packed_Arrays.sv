// 1. Packed Array (Vectors) has dimensions before variable declaration
// 2. Memory allocation is contiguous for bits ([6:0] -> 6,5,4,3,2,1,0)
// for ex : bit [a:0][b:0][c:0] .....[z:0] p_array; can be accessed as p_array[a][b][c] ....[z] as per write or read requirement

module packed_array;
  
  logic [6:0] p_array;   // Vector of 7 bits
  //logic [7]  p_array; // llegal declaration. C style is not allowed for packed arrays(Vectors)
  bit   [3:0] [7:0] p_array1; // Vector of 4, (8 bit sub vectors) or 32 bit vector 
  reg  [2:0] [3:0] [7:0] p_array2; // Vector of 3, 32 bit sub vectors(4 (8 bit sub vectors)). order is left to right([2:0] -> [3:0] -> [7:0]) for read or write
  
  initial begin
    p_array = 'h3f;
    
    $display("============ Packed Array 1D =================");
    foreach(p_array[i]) begin
      $display("p_array[%0d] : %0b",i,p_array[i]);
    end
    
    foreach(p_array1[i]) p_array1[i] = i + 'd10;
    foreach(p_array2[i]) p_array2[i] = i+'d12;
    
    $display("============ Packed Array 2D =================");
    foreach(p_array1[i]) begin
      $display("p_array1[%0d] : %0d",i,p_array1[i]);
    end
    
    $display("============ Packed Array 3D =================");
    foreach(p_array2[i,j]) begin
      $display("p_array2[%0d] : %0d, \np_array2[%0d][%0d] : %0d",i,p_array2[i],i,j,p_array2[i][j]);
    end
    
    $display("============ Print all Packed Arrays =================");
    $display("p_array : %d \n p_array1 : %0h, \n p_array2 : %0h %0d, %0d",p_array,p_array1,p_array2,p_array1[2][7:4],$bits(p_array2[1]));
    p_array++;p_array1++;p_array2++;  // Packed Arrays are treated as integral values. so increment is valid
    $display("p_array : %d \n p_array1 : %0h, \n p_array2 : %0h %0d, %0d",p_array,p_array1,p_array2,p_array1[2][7:4],$bits(p_array2[1]));
    $display("======================================================");
    
  end
    
endmodule

Output :

============ Packed Array 1D =================
p_array[6] : 0
p_array[5] : 1
p_array[4] : 1
p_array[3] : 1
p_array[2] : 1
p_array[1] : 1
p_array[0] : 1
============ Packed Array 2D =================
p_array1[3] : 13
p_array1[2] : 12
p_array1[1] : 11
p_array1[0] : 10
============ Packed Array 3D =================
p_array2[2] : 14, 
p_array2[2][3] : 0
p_array2[2] : 14, 
p_array2[2][2] : 0
p_array2[2] : 14, 
p_array2[2][1] : 0
p_array2[2] : 14, 
p_array2[2][0] : 14
p_array2[1] : 13, 
p_array2[1][3] : 0
p_array2[1] : 13, 
p_array2[1][2] : 0
p_array2[1] : 13, 
p_array2[1][1] : 0
p_array2[1] : 13, 
p_array2[1][0] : 13
p_array2[0] : 12, 
p_array2[0][3] : 0
p_array2[0] : 12, 
p_array2[0][2] : 0
p_array2[0] : 12, 
p_array2[0][1] : 0
p_array2[0] : 12, 
p_array2[0][0] : 12
============ Print all Packed Arrays =================
p_array :  63 
 p_array1 : d0c0b0a, 
 p_array2 : e0000000d0000000c 0, 32
p_array :  64 
 p_array1 : d0c0b0b, 
 p_array2 : e0000000d0000000d 0, 32
======================================================
