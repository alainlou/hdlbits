module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = !(x^y);
endmodule

module top_module (input x, input y, output z);
    wire z0, z1, z2, z3, z4, z5;

    A IA1(x, y, z0);
    B IB1(x, y, z1);
    A IA2(x, y, z2);
    B IB2(x, y, z3);

    assign z4 = z0 || z1;
    assign z5 = z2 && z3;
    assign z = z4^z5;

endmodule
