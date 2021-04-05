RnNDCM = LMO.RnNDCM(330);
FDomegaRN = FDInertialOmegaRnN(LMO, 330, 1)
omegaRNtrue = InertialOmegaRnN(LMO,330)

% formatSpec = '%10.12f \n';
% fprintf(formatSpec,omegaRNtrue(1),omegaRNtrue(2),omegaRNtrue(3))

errors = [];
dts = [100000,10000, 1000, 100, 10, 1, 0.1, 0.01, 0.001];
for dt = dts
    errors = [errors, norm(FDInertialOmegaRnN(LMO, 330, dt) - omegaRNtrue,2)];
end

% semilogx(dts, errors)
function omega = FDInertialOmegaRnN(craft, t, dt)
    C = craft.RnNDCM(t);
    C_dot = (craft.RnNDCM(t+dt) - craft.RnNDCM(t-dt))/(2*dt);
    omega_tilde = -C_dot*transpose(C);
    omega = vecfromtilde(omega_tilde);
end

%% OMEGA TILDE IS IN H FRAME COMPONENTS !!!!!!!!!!!!

function omega = InertialOmegaRnN(craft,t)
    omega = craft.NHDCM(t)*[0;0;craft.theta_dot];
end