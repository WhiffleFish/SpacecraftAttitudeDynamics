v1B = [0.8273; 0.5541; -0.0920];
v2B = [-0.8285; 0.5522; -0.0955];
v1B = v1B./norm(v1B,2);
v2B = v2B./norm(v2B,2);

v1N = [-0.1517; -0.9669; 0.2050];
v2N = [-0.8393; 0.4494; -0.3044];
v1N = v1N./norm(v1N,2);
v2N = v2N./norm(v2N,2);

t1B = v1B;
t2B = cross(v1B,v2B);
t2B = t2B./norm(t2B,2);
t3B = cross(t1B,t2B);

t1N = v1N;
t2N = cross(v1N,v2N);
t2N = t2N./norm(t2N,2);
t3N = cross(t1N,t2N);

BbarT = [t1B t2B t3B];
NT = [t1N t2N t3N];

BbarN = BbarT*NT';

%%
BbarN = [0.969846 0.17101 0.173648;
         -0.200706 0.96461 0.17101;
         -0.138258 -0.200706 0.969846];

BN = [0.963592 0.187303 0.190809;
    -0.223042 0.956645 0.187303;
    -0.147454 -0.223042 0.963592];

BbarB = BbarN*BN';

Q = C2PRV(BbarB)