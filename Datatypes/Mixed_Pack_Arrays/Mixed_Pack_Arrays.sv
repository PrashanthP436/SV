// Mixed Pack array has dimensions on both sides of array declaration
// Order is from left to right and for a given side it starts from right.

// For ex : bit [3:0][7:0] mixed_pack [2:0][3:0] ;
// Evaluation starts from left to right meaning it will evaluate packed dimension and then unpacked dimension. In both these dimensions it will start from right to left meaning [7:0] -> [3:0] in packed and [3:0] -> [2:0] in unpacked.
// 1. It will create packed array of 32 bit(4, 8 bit sub vectors) vector 
// 2. It will create 4([3:0]) vertical packed arrays and finally 3([2:0]) sets of created arrays
// Below is the order of write/read accessing of mixed pack array
//bit [d][e][f] my_array [a][b][c];
//my_array[a];
//my_array[a][b];
//my_array[a][b][c];
//my_array[a][b][c][d];
//my_array[a][b][c][d][e];
//my_array[a][b][c][d][e][f];

module mixed_pack_array;
  
  bit [3:0][7:0] mixed_pack_array [2:0][3:0];
  
  initial begin
    
    foreach(mixed_pack_array[i,j,k]) begin
      mixed_pack_array[i][j][k] = $urandom();
    end
    
    $display("============== Mixed Pack Array ============================");
    
    foreach(mixed_pack_array[i,j,k]) begin
      $display("mixed_pack_array[%0d] : %0p \nmixed_pack_array[%0d][%0d] : %0h\nmixed_pack_array[%0d][%0d][%0d] : %0h ",i,mixed_pack_array[i],i,j,mixed_pack_array[i][j],i,j,k,mixed_pack_array[i][j][k]);
      $display("==========================================================");
    end
    
    $display("\n\nmixed_pack_array : %0p",mixed_pack_array);
  end 
endmodule

Output :

============== Mixed Pack Array ============================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][3] : 363c7de2
mixed_pack_array[2][3][3] : 36 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][3] : 363c7de2
mixed_pack_array[2][3][2] : 3c 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][3] : 363c7de2
mixed_pack_array[2][3][1] : 7d 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][3] : 363c7de2
mixed_pack_array[2][3][0] : e2 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][2] : bdf40f7
mixed_pack_array[2][2][3] : b 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][2] : bdf40f7
mixed_pack_array[2][2][2] : df 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][2] : bdf40f7
mixed_pack_array[2][2][1] : 40 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][2] : bdf40f7
mixed_pack_array[2][2][0] : f7 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][1] : a61bb5fa
mixed_pack_array[2][1][3] : a6 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][1] : a61bb5fa
mixed_pack_array[2][1][2] : 1b 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][1] : a61bb5fa
mixed_pack_array[2][1][1] : b5 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][1] : a61bb5fa
mixed_pack_array[2][1][0] : fa 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][0] : 4e157d72
mixed_pack_array[2][0][3] : 4e 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][0] : 4e157d72
mixed_pack_array[2][0][2] : 15 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][0] : 4e157d72
mixed_pack_array[2][0][1] : 7d 
==========================================================
mixed_pack_array[2] : '{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}  
mixed_pack_array[2][0] : 4e157d72
mixed_pack_array[2][0][0] : 72 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][3] : 9631c4aa
mixed_pack_array[1][3][3] : 96 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][3] : 9631c4aa
mixed_pack_array[1][3][2] : 31 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][3] : 9631c4aa
mixed_pack_array[1][3][1] : c4 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][3] : 9631c4aa
mixed_pack_array[1][3][0] : aa 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][2] : c4cf4ff4
mixed_pack_array[1][2][3] : c4 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][2] : c4cf4ff4
mixed_pack_array[1][2][2] : cf 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][2] : c4cf4ff4
mixed_pack_array[1][2][1] : 4f 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][2] : c4cf4ff4
mixed_pack_array[1][2][0] : f4 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][1] : 1788f12c
mixed_pack_array[1][1][3] : 17 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][1] : 1788f12c
mixed_pack_array[1][1][2] : 88 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][1] : 1788f12c
mixed_pack_array[1][1][1] : f1 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][1] : 1788f12c
mixed_pack_array[1][1][0] : 2c 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][0] : ce05cb8c
mixed_pack_array[1][0][3] : ce 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][0] : ce05cb8c
mixed_pack_array[1][0][2] : 5 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][0] : ce05cb8c
mixed_pack_array[1][0][1] : cb 
==========================================================
mixed_pack_array[1] : '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}  
mixed_pack_array[1][0] : ce05cb8c
mixed_pack_array[1][0][0] : 8c 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][3] : 1a37605f
mixed_pack_array[0][3][3] : 1a 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][3] : 1a37605f
mixed_pack_array[0][3][2] : 37 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][3] : 1a37605f
mixed_pack_array[0][3][1] : 60 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][3] : 1a37605f
mixed_pack_array[0][3][0] : 5f 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][2] : 7aa2f0c9
mixed_pack_array[0][2][3] : 7a 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][2] : 7aa2f0c9
mixed_pack_array[0][2][2] : a2 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][2] : 7aa2f0c9
mixed_pack_array[0][2][1] : f0 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][2] : 7aa2f0c9
mixed_pack_array[0][2][0] : c9 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][1] : dc413f12
mixed_pack_array[0][1][3] : dc 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][1] : dc413f12
mixed_pack_array[0][1][2] : 41 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][1] : dc413f12
mixed_pack_array[0][1][1] : 3f 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][1] : dc413f12
mixed_pack_array[0][1][0] : 12 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][0] : f4dfc5d7
mixed_pack_array[0][0][3] : f4 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][0] : f4dfc5d7
mixed_pack_array[0][0][2] : df 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][0] : f4dfc5d7
mixed_pack_array[0][0][1] : c5 
==========================================================
mixed_pack_array[0] : '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}  
mixed_pack_array[0][0] : f4dfc5d7
mixed_pack_array[0][0][0] : d7 
==========================================================


mixed_pack_array : '{'{'h363c7de2, 'hbdf40f7, 'ha61bb5fa, 'h4e157d72}, '{'h9631c4aa, 'hc4cf4ff4, 'h1788f12c, 'hce05cb8c}, '{'h1a37605f, 'h7aa2f0c9, 'hdc413f12, 'hf4dfc5d7}} 
           V C S   S i m u l a t i o n   R e p o r t 
