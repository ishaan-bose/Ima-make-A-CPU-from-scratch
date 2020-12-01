module half_adder (in1,
                    in2,
                    sum,
                    carry);
   
   input in1, in2;
   output sum, carry;

   assign sum = in1 ^ in2;
   assign carry = in1 && in2;
   
   
endmodule // half_adder

module full_adder (in1,
                    in2,
                    carryIn,
                    sum,
                    carryOut);

    input in1,in2,carryIn;
    output sum,carryOut;
    
    wire InputSum, InputCarry;
    wire finalSum, finalCarry;
    
    half_adder a(in1, in2, InputSum, InputCarry);
    half_adder b(InputSum, carryIn, finalSum, finalCarry);
    
    assign carryOut = finalCarry || InputCarry;
    assign sum = finalSum;

endmodule // full_adder








// testbench
module testbench;

    reg A, B, Cin;
    wire S, Cout;

    full_adder a(A, B, Cin ,S, Cout);

initial begin
    
    A = 0; B = 0; Cin = 0;

    #10;
    A = 0;
    B = 0;
    Cin = 0;
    
    #10
    A = 0;
    B = 0;
    Cin = 1;

    #10
    A = 0;
    B = 1;
    Cin = 0;

    #10
    A = 0;
    B = 1;
    Cin = 1;

    #10;
    A = 1;
    B = 0;
    Cin = 0;
    
    #10
    A = 1;
    B = 0;
    Cin = 1;

    #10
    A = 1;
    B = 1;
    Cin = 0;

    #10
    A = 1;
    B = 1;
    Cin = 1;
    
end

initial begin
    $monitor("A = %d, B = %d, Cin = %d ,S = %d, Cout = %d", A, B, Cin, S, Cout);
end

endmodule // testbench