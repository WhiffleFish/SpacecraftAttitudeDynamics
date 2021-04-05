RcNDCM = LMO.RcNDCM(GMO,330); % Output Correct

omegaRcN = LMO.omegaRcN(GMO, 330);

formatSpec = '%10.12f \n';
fprintf(formatSpec,omegaRcN(1),omegaRcN(2),omegaRcN(3))
