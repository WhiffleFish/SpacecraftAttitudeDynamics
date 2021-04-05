%% Devenport's q-Method

v1B = [0.8273; 0.5541; -0.0920];
v2B = [-0.8285; 0.5522; -0.0955];
v1B = normalize(v1B, 'norm');
v2B = normalize(v2B, 'norm');

v1N = [-0.1517; -0.9669; 0.2050];
v2N = [-0.8393; 0.4494; -0.3044];
v1N = normalize(v1N, 'norm');
v1N = normalize(v1N, 'norm');
v2N = normalize(v2N, 'norm');


vBs = [v1B, v2B];
vNs = [v1N, v2N];
beta = -Devenportq(vBs, vNs, [2,1])

C = EP2C(beta)


%% QUEST Method

beta = QUEST(vBs, vNs, [2,1])
C = EP2C(beta)

%% Optimal Linear Attitude Estimation (OLAE)

beta = OLAE(vBs, vNs, [2,1])
C = EP2C(beta)