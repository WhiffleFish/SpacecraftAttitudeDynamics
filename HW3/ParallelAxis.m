EA = deg2rad([-10;10;5]);
BN = Euler3212C(EA);

RcpN = [-0.5; 0.5; 0.25];
RcpB = BN*RcpN;


Ib = [10, 1, -1;
       1, 5,  1;
      -1, 1,  8];
;

IpB = Ib + 12.5*tilde(RcpB)*tilde(RcpB)'