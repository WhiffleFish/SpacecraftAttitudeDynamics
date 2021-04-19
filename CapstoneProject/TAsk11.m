Tmax = 120;
I = LMO.inertia;
P = 2*max(diag(I))/Tmax;
K = P^2/min(diag(I));

%%
int = Integrator(1, LMO);
controller = Controller(K, P, LMO, @(craft,t) target_func(craft,t));
data = int.Integrate(LMO.X0(), controller, 6000);
%%

data.plot_c("sigma")
X300 = data.Xt(300);
sigma300 = X300(1:3);
X2100 = data.Xt(2100);
sigma2100 = X2100(1:3);
X3400 = data.Xt(3400);
sigma3400 = X3400(1:3);
X4400 = data.Xt(4400);
sigma4400 = X4400(1:3);
X5600 = data.Xt(5600);
sigma5600 = X5600(1:3);

%%

WritePlaintext(sigma300,"Task11Plaintext/sigma300.txt")
WritePlaintext(sigma2100,"Task11Plaintext/sigma2100.txt")
WritePlaintext(sigma3400,"Task11Plaintext/sigma3400.txt")
WritePlaintext(sigma4400,"Task11Plaintext/sigma4400.txt")
WritePlaintext(sigma5600,"Task11Plaintext/sigma5600.txt")

%%
function target = target_func(craft, t)
    LMOpos = craft.pos(t);
    GMOpos = craft.target_craft.pos(t);
    if LMOpos(2) > 0
        target = 's';
    else
        LMO_norm = norm(LMOpos,2);
        GMO_norm = norm(GMOpos,2);
        angle_diff = acos(dot(LMOpos,GMOpos)/(LMO_norm*GMO_norm));
        if rad2deg(angle_diff) < 35
            target = 'c';
        else
            target = 'n';
        end
    end
end