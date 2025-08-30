// 1. UnPacked Arrays(Fixed Size Arrays) has dimensions after variable declaration
// 2. Unpacked arrays Does not evaluate to integral value. ex : byte a[5]; a = a+1 is illegal (a[2] = a[0] + 1 is legal as a[0] and a[2] are bytes)
// No error on Out Of Bound reads or writes. Reads return default datatype values

module unpacked_array;
  
  byte unpack_array  [7];   // logic unpack_array [6:0] -> C style declaration
  int  unpack_array1 [3:0] [7:0]; // 2D unpacked array
  reg [7:0] unpack_array2 [1:0] [3:0] [7:0]; // 3D unpack array. Order is left to right ([1:0] -> [3:0] -> [7:0]) during reads or writes
  
  initial begin
    unpack_array = '{default:'d12};
    unpack_array1 = '{'{default:'d45},'{default:'d11},'{default:'d34},'{default:'d67}};
    
    unpack_array2 = '{'{'{default:'d45},'{default:'d11},'{default:'d34},'{default:'d67}},
                      '{'{default:'d56},'{default:'d09},'{default:'d87},'{default:'d00}}};
    
    $display("=============== unpack_array 1D ====================");
    foreach(unpack_array[i]) begin
      $display("unpack_array[%0d] : %0b",i,unpack_array[i]);
    end
    
    $display("=============== unpack_array1 2D ====================");
    foreach(unpack_array1[i]) begin
      $display("unpack_array1[%0d] : %0p",i,unpack_array1[i]);
    end
    
    $display("=============== unpack_array2 3D ====================");
    foreach(unpack_array2[i,j]) begin
      $display("unpack_array2[%0d] : %p, \nunpack_array2[%0d][%0d] : %p",i,unpack_array2[i],i,j,unpack_array2[i][j]);                          
    end
    
    $display("=============== Print All Unpacked arrays =====================");
    $display("unpack_array : %p \n unpack_array1 : %0p, \n unpack_array2 : %0p",unpack_array,unpack_array1,unpack_array2);
    $display("===============================================================");
  end

endmodule

Output : 

=============== unpack_array 1D ====================
unpack_array[0] : 1100
unpack_array[1] : 1100
unpack_array[2] : 1100
unpack_array[3] : 1100
unpack_array[4] : 1100
unpack_array[5] : 1100
unpack_array[6] : 1100
=============== unpack_array1 2D ====================
unpack_array1[3] : '{45, 45, 45, 45, 45, 45, 45, 45} 
unpack_array1[2] : '{11, 11, 11, 11, 11, 11, 11, 11} 
unpack_array1[1] : '{34, 34, 34, 34, 34, 34, 34, 34} 
unpack_array1[0] : '{67, 67, 67, 67, 67, 67, 67, 67} 
=============== unpack_array2 3D ====================
unpack_array2[1] : '{'{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d}, '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb}, '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22}, '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43}} , 
unpack_array2[1][3] : '{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d} 
unpack_array2[1] : '{'{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d}, '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb}, '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22}, '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43}} , 
unpack_array2[1][2] : '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb} 
unpack_array2[1] : '{'{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d}, '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb}, '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22}, '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43}} , 
unpack_array2[1][1] : '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22} 
unpack_array2[1] : '{'{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d}, '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb}, '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22}, '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43}} , 
unpack_array2[1][0] : '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43} 
unpack_array2[0] : '{'{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38}, '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9}, '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0}} , 
unpack_array2[0][3] : '{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38} 
unpack_array2[0] : '{'{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38}, '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9}, '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0}} , 
unpack_array2[0][2] : '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9} 
unpack_array2[0] : '{'{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38}, '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9}, '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0}} , 
unpack_array2[0][1] : '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57} 
unpack_array2[0] : '{'{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38}, '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9}, '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0}} , 
unpack_array2[0][0] : '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0} 
=============== Print All Unpacked arrays =====================
unpack_array : '{12, 12, 12, 12, 12, 12, 12}  
 unpack_array1 : '{'{45, 45, 45, 45, 45, 45, 45, 45}, '{11, 11, 11, 11, 11, 11, 11, 11}, '{34, 34, 34, 34, 34, 34, 34, 34}, '{67, 67, 67, 67, 67, 67, 67, 67}} , 
 unpack_array2 : '{'{'{'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d, 'h2d}, '{'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb, 'hb}, '{'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22, 'h22}, '{'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43, 'h43}}, '{'{'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38, 'h38}, '{'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9, 'h9}, '{'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57, 'h57}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0}}} 
===============================================================
           V C S   S i m u l a t i o n   R e p o r t 
