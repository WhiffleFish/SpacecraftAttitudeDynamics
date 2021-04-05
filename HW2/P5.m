syms a0 a1 a2 a3
syms b0 b1 b2 b3
syms c0 c1 c2 c3

FB = [a0^2 + a1^2 - a2^2-a3^2, 2*(a1*a2+a0*a3), 2*(a1*a3-a0*a2);
      2*(a1*a2-a0*a3), a0^2 - a1^2 + a2^2 - a3^2, 2*(a2*a3+a0*a1);
      2*(a1*a3+a0*a2), 2*(a2*a3-a0*a1), a0^2 - a1^2 - a2^2 + a3^2];
  
BN = [b0^2 + b1^2 - b2^2 - b3^2, 2*(b1*b2+b0*b3), 2*(b1*b3-b0*b2);
      2*(b1*b2-b0*b3), b0^2 - b1^2 + b2^2 - b3^2, 2*(b2*b3+b0*b1);
      2*(b1*b3+b0*b2), 2*(b2*b3-b0*b1), b0^2 - b1^2 - b2^2 + b3^2];

 C = [c0^2 + c1^2 - c2^2 - c3^2, 2*(c1*c2+c0*c3), 2*(c1*c3-c0*c2);
      2*(c1*c2-c0*c3), c0^2 - c1^2 + c2^2 - c3^2, 2*(c2*c3+c0*c1);
      2*(c1*c3+c0*c2), 2*(c2*c3-c0*c1), c0^2 - c1^2 - c2^2 + c3^2];

FN = FB*BN;

S = solve(FN == C, [c0,c1,c2,c3])