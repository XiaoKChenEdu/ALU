///// FOURBITALU_TB /////


module fourBitALU_TB ;

  reg          XIN_TB           ;
  reg  [ 3:0 ] A_TB, B_TB       ;
  reg  [ 2:0 ] S_TB             ;
  wire         Z_TB, V_TB, C_TB ;
  wire [ 3:0 ] F_TB             ;

  fourBitALU my_ALU( .XIN( XIN_TB ), .A( A_TB ), .B( B_TB ), .S( S_TB ), .Z( Z_TB ), .V( V_TB ), .C( C_TB ), .F( F_TB ) ) ;

  initial begin

    $monitor( "    F = %4b, Z = %1b, V = %1b, C = %1b", F_TB, Z_TB, V_TB, C_TB ) ;

    /// Testing Operator ///
    XIN_TB = 1'b0    ;
    A_TB   = 4'b0010 ;
    B_TB   = 4'b0001 ;

    #5 $display( "Testing Operator for A = 0010, B = 0001, XIN = 0") ;
       S_TB = 3'b000 ;
    #5 S_TB = 3'b001 ;
    #5 S_TB = 3'b010 ;
    #5 S_TB = 3'b011 ;
    #5 S_TB = 3'b100 ;
    #5 S_TB = 3'b101 ;
    #5 S_TB = 3'b110 ;
    #5 S_TB = 3'b111 ;
    /// Testing Operator  ///

    #5 $display() ;

    /// Testing Carry in & Carry Out ///
    #5 $display( "Testing Carry in & Carry Out for A = 0000, B = 0111, XIN = 1" ) ;
    XIN_TB = 1'b1    ;
    A_TB   = 4'b0000 ;
    B_TB   = 4'b0111 ;

    #5 S_TB = 3'b000 ;
    #5 S_TB = 3'b001 ;
    #5 $display( "    F = %4b, Z = %1b, V = %1b, C = %1b", F_TB, Z_TB, V_TB, C_TB ) ;
    #5 S_TB = 3'b010 ;
    /// Testing Carry in & Carry Out ///

    #5 $display() ;

    /// Testing Overflow ///
    #5 $display( "Testing Overflow for A = 1111, B = 1111, XIN = 0" ) ;
    XIN_TB = 1'b0    ;
    A_TB   = 4'b1111 ;
    B_TB   = 4'b1111 ;

    #5 S_TB = 3'b000 ;
    #5 S_TB = 3'b011 ;
    #5 S_TB = 3'b101 ;
    /// Testing Overflow ///

    #5 $display() ;

    /// Testing XOR & Less Than ///
    #5 $display( "Testing XOR & Less Than"       ) ;
    #5 $display( "  A = 1111, B = 1100, XIN = 0" ) ;
    XIN_TB = 1'b0    ;
    A_TB   = 4'b1111 ;
    B_TB   = 4'b1100 ;
    
    #5 S_TB   = 3'b110  ;
    #5 S_TB   = 3'b111  ;

    #5 $display( "  A = 1100, B = 1111, XIN = 0" ) ;
    XIN_TB = 1'b0    ;
    A_TB   = 4'b1100 ;
    B_TB   = 4'b1111 ;

    #5 S_TB   = 3'b110  ;
    #5 S_TB   = 3'b111  ;
    /// Testing XOR & Less Than ///

  end

endmodule


///// FOURBITALU /////