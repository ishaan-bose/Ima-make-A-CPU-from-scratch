module half_adder (in1,in2,sum,carry);
   
   input in1, in2;
   output sum, carry;

   assign sum = in1 ^ in2; 
   assign carry = in1 & in2;
   
   
endmodule // half_adder

module full_adder (in1,in2,carryIn,sum,carryOut);

    input in1,in2,carryIn;
    output sum,carryOut;
    
    wire operandSum, operandCarry;
    wire finalSum, finalCarry;
    
    half_adder a(in1, in2, operandSum, operandCarry);
    half_adder b(operandSum, carryIn, finalSum, finalCarry);
    
    assign carryOut = finalCarry | operandCarry;

endmodule // full_adder