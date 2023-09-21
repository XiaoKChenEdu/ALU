///// FOURBITALU /////


module fourBitALU ( XIN, A, B ,S, Z, V, C, F ) ;

  input  wire         XIN     ;
  input  wire [ 3:0 ] A, B    ;
  input  wire [ 2:0 ] S       ;
  output wire         Z, V, C ;
  output wire [ 3:0 ] F       ;

  reg [ 7:0 ] temp_F             ;
  reg         overFlow, carryOut ;

  always @ ( S )
    begin

      carryOut = 1'b0 ;

      case ( S )

        3'b000   : 
          
          begin
          
            temp_F   = A + B + XIN ;
            carryOut = temp_F[ 4 ] ;

          end
        
        3'b001  : 
          
          begin

            temp_F   = ( B + XIN ) - A ;
            carryOut = temp_F[ 4 ]     ;

          end

        3'b010  : 

          begin
        
            temp_F   = ( A + XIN ) - B ;
            carryOut = temp_F[ 4 ]     ;

          end

        3'b011  : temp_F = 4'b0010 * A     ;
        3'b100  : temp_F = A / 4'b0010     ;
        3'b101  : temp_F = A * B           ;
        3'b110  : temp_F = A ^ B           ;
        3'b111  :
        
          begin

            if ( A < B ) begin

              temp_F = 8'b00001111 ;

            end else begin

              temp_F = 8'b00000000 ;

            end

          end

        default : temp_F = 8'b00000000     ;

      endcase

    end

    assign F = temp_F ;
    assign Z = ( temp_F == 8'b00000000 ) ? 1'b1 :
               1'b0 ;
    assign V = ( temp_F[ 4 ] == 1'b1 ) ? 1'b1 :
               ( temp_F[ 5 ] == 1'b1 ) ? 1'b1 :
               ( temp_F[ 6 ] == 1'b1 ) ? 1'b1 :
               ( temp_F[ 7 ] == 1'b1 ) ? 1'b1 :
               1'b0 ;
    assign C = carryOut ;


endmodule


///// FOURBITALU /////
