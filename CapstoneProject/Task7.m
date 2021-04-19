dt = 1;
int = Integrator(dt, LMO);
controller1 = Controller(0,0, LMO, @(craft,t) [0;0;0]);
controller2 = Controller(0,0, LMO, @(craft,t) [0.01;-0.01;0.02]);

% data = int.Integrate(LMO.X0(), @(X,I) int.nom_u(X,I), 500);
% data2 = int.Integrate(LMO.X0(), @(X,I) [0.01;-0.01;0.02], 500);

data = int.Integrate(LMO.X0(), controller1, 500);
data2 = int.Integrate(LMO.X0(), controller2, 500);

%%
% data.plot("omega")

X500 = data.Xt(500);
w500 = X500(4:6);
H500 = LMO.inertia*w500; % Momentum (Part 1)

T500 = 0.5*w500'*LMO.inertia*w500; % Energy (Part 2)

s500 = X500(1:3); % Attitude (Part 3)

NB = MRP2C(s500)';
nH500 = NB*H500; % inertial Momentum (Part 4)

X100 = data2.Xt(100);
s100 = X100(1:3); % Attitude (Part 5)

%%

% WritePlaintext(H500,"Task7Plaintext/H500.txt")
% WritePlaintext(T500,"Task7Plaintext/T500.txt")
% WritePlaintext(s500,"Task7Plaintext/sigma500.txt")
% WritePlaintext(nH500, "Task7Plaintext/nH500.txt")
% WritePlaintext(s100, "Task7Plaintext/sigma100.txt")