Tmax = 120;
I = LMO.inertia;
P = 2*max(diag(I))/Tmax;
K = P^2/min(diag(I));

%%
int = Integrator(1, LMO);
controller = Controller(K, P, LMO, @(craft,t) 'c');
data = int.Integrate(LMO.X0(), controller, 500);
%%

data.plot_c("sigma")
X15 = data.Xt(15);
sigma15 = X15(1:3);
X100 = data.Xt(100);
sigma100 = X100(1:3);
X200 = data.Xt(200);
sigma200 = X200(1:3);
X400 = data.Xt(400);
sigma400 = X400(1:3);

%%

WritePlaintext(sigma15,"Task10Plaintext/sigma15.txt")
WritePlaintext(sigma100,"Task10Plaintext/sigma100.txt")
WritePlaintext(sigma200,"Task10Plaintext/sigma200.txt")
WritePlaintext(sigma400,"Task10Plaintext/sigma400.txt")
