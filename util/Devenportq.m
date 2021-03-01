function beta = Devenportq(vBs,vNs,w)
%{
    vBs - Body frame vectors (3xN)
    vNs - Inertial frame vectors (3xN)
    w - measurement weight vector (Nx1)
%}
    assert(size(vBs,1) == size(vNs,1) && size(vNs,1) == 3, "Axis 1 of vBs and vNs must be of size 3")
    assert(size(vBs,2) == size(vNs,2) && size(vNs,2) == length(w), "Axis 2 of vBs and vNs must be of equal to both each other and length of w")
    n_meas = size(vBs,2);
    
    B = zeros(3,3);
    for i = 1:n_meas
        B = B + w(i)*(vBs(:,i)*vNs(:,i)');
    end
    
    S = B + B';
    sigma = trace(B);
    Z = [B(2,3)-B(3,2); B(3,1)-B(1,3); B(1,2)-B(2,1)];
    
    K = cell2mat([{sigma}, {Z'}; {Z}, {S - sigma*eye(3)}]);
    
    [evecs, evals] = eigs(K);
    evals = diag(evals);
    [~,I] = max(evals);
    
    beta = evecs(:,I);
end