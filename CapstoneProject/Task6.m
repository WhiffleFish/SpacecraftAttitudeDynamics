[sigma_BRs, Bomega_BRs] = refError(0, LMO.init_att, LMO.init_rot, @(t) LMO.RsNDCM(t), LMO.omegaRsN(0));

[sigma_BRn, Bomega_BRn] = refError(0, LMO.init_att, LMO.init_rot, @(t) LMO.RnNDCM(t), LMO.omegaRnN(0));

[sigma_BRc, Bomega_BRc] = refError(0, LMO.init_att, LMO.init_rot, @(t) LMO.RcNDCM(GMO, t), LMO.omegaRcN(GMO, 0));

WritePlaintext(sigma_BRs, "Task6Plaintext/sigma_Brs")
WritePlaintext(Bomega_BRs, "Task6Plaintext/Bomega_Brs")

WritePlaintext(sigma_BRn, "Task6Plaintext/sigma_Brn")
WritePlaintext(Bomega_BRn, "Task6Plaintext/Bomega_Brn")

WritePlaintext(sigma_BRc, "Task6Plaintext/sigma_Brc")
WritePlaintext(Bomega_BRc, "Task6Plaintext/Bomega_Brc")

function [sigma_BR, Bomega_BR] = refError(t, sigma_BN, Bomega_BN, RN, Nomega_RN)
    BN = MRP2C(sigma_BN);
    BR = BN*RN(t)';
    sigma_BR = C2MRP(BR);
    
    Bomega_BR = Bomega_BN - BN*Nomega_RN;
end