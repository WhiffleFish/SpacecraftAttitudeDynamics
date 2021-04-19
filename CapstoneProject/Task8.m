Tmax = 120;
I = LMO.inertia;
P = 2*max(diag(I))/Tmax;
K = P^2/min(diag(I));

%%
damping_ratios = zeta(P,K,I);
time_constants = tau(P,I);

%%
controller = Controller(K, P, LMO, @(craft,t) 's');
data = int.Integrate(LMO.X0(), controller, 500);
%%

data.plot("sigma")
X15 = data.Xt(15);
sigma15 = X15(1:3);
X100 = data.Xt(100);
sigma100 = X100(1:3);
X200 = data.Xt(200);
sigma200 = X200(1:3);
X400 = data.Xt(400);
sigma400 = X400(1:3);

%%

WritePlaintext([P,K], "Task8Plaintext/PK.txt")
WritePlaintext(sigma15,"Task8Plaintext/sigma15.txt")
WritePlaintext(sigma100,"Task8Plaintext/sigma100.txt")
WritePlaintext(sigma200,"Task8Plaintext/sigma200.txt")
WritePlaintext(sigma400,"Task8Plaintext/sigma400.txt")

%%
function z = zeta(P, K, I)
    z = [];
    for i = 1:3
        z = [z,P/sqrt(K*I(i,i))];
    end
end

function t = tau(P,I)
    t = [];
    for i = 1:3
        t = [t,2*I(i,i)/P];
    end
end