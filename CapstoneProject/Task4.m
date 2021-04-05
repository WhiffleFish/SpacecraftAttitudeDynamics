init
%%

RnNDCM = LMO.RnNDCM(330)
omegaRN = InertialOmegaRnN(LMO, 330)

function omega = InertialOmegaRnN(craft,t)
    omega = craft.NHDCM(t)*[0;0;craft.theta_dot];
end