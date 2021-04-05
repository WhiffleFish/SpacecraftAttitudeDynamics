syms Phi
assume(Phi,'real')

syms e1 e2 e3
assume(e1, 'real')
assume(e2, 'real')
assume(e3, 'real')

assume(e1^2 + e2^2 + e3^2 == 1)
e_tilde = [0 -e3 e2; e3 0 -e1; -e2 e1 0];

s = simplify(expm(-Phi*e_tilde))