module likeALU(Out, InA, InB, select);
input[4:0] InA, InB;
input [1:0] select;
output[4:0] Out;

wire[4:0] result_xor, result_and, result_or,result_addition;
wire[4:0] out_and, out_or, out_xor, out_addition;
wire addition_cout, NOTselect0, NOTselect1, cIn;

assign cIn = 1'b0;

xorTest foo(result_xor,InA, InB);
andTest foo2(result_and, InA, InB);
orTest foo3(result_or, InA, InB);
_5bit_adder foo4(result_addition, addition_cout, InA,InB, cIn );

not n1( NOTselect0, select[0] );
not n2( NOTselect1, select[1] );

and res_and_1( out_and[0], NOTselect0, NOTselect1, result_and[0] );
and res_and_2( out_and[1], NOTselect0, NOTselect1, result_and[1] );
and res_and_3( out_and[2], NOTselect0, NOTselect1, result_and[2] );
and res_and_4( out_and[3], NOTselect0, NOTselect1, result_and[3] );
and res_and_5( out_and[4], NOTselect0, NOTselect1, result_and[4] );

and res_addition_1( out_addition[0], NOTselect1, select[0],  result_addition[0] );
and res_addition_2( out_addition[1], NOTselect1, select[0],  result_addition[1] );
and res_addition_3( out_addition[2], NOTselect1, select[0],  result_addition[2] );
and res_addition_4( out_addition[3], NOTselect1, select[0],  result_addition[3] );
and res_addition_5( out_addition[4], NOTselect1, select[0],  result_addition[4] );

and res_or_1( out_or[0], select[1], NOTselect0, result_or[0] );
and res_or_2( out_or[1], select[1], NOTselect0, result_or[1] );
and res_or_3( out_or[2], select[1], NOTselect0, result_or[2] );
and res_or_4( out_or[3], select[1], NOTselect0, result_or[3] );
and res_or_5( out_or[4], select[1], NOTselect0, result_or[4] );

and res_xor_1( out_xor[0], select[0], select[1], result_xor[0] );
and res_xor_2( out_xor[1], select[0], select[1], result_xor[1] );
and res_xor_3( out_xor[2], select[0], select[1], result_xor[2] );
and res_xor_4( out_xor[3], select[0], select[1], result_xor[3] );
and res_xor_5( out_xor[4], select[0], select[1], result_xor[4] );

assign Out =  out_and | out_addition | out_or | out_xor ;
endmodule
