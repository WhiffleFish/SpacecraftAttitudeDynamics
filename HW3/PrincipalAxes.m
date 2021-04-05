sigmaDB = [0.1;0.2;0.3]
FB = MRP2C(sigmaDB);

Ib = [10, 1, -1;
       1, 5,  1;
      -1, 1,  8];

IF = FB*Ib*FB';
[V,K] = eigs(Ib)

normalize(V,'norm',1)
V1 = V(:,1);
V2 = V(:,2);
V3 = V(:,3);
