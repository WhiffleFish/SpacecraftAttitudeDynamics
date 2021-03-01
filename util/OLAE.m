function beta = OLAE(vBs,vNs,w)
%{
    vBs - Body frame vectors (3xN)
    vNs - Inertial frame vectors (3xN)
    w - measurement weight vector (Nx1)
%}
    assert(size(vBs,1) == size(vNs,1) && size(vNs,1) == 3, "Axis 1 of vBs and vNs must be of size 3")
    assert(size(vBs,2) == size(vNs,2) && size(vNs,2) == length(w), "Axis 2 of vBs and vNs must be of equal to both each other and length of w")
    n_meas = size(vBs,2);
    
    S = [];
    d = [];
    w_blocks = [];
    for i=1:n_meas
        si = vBs(:,i) + vNs(:,i);
        di = vBs(:,i) - vNs(:,i);
        
        S = [S;tilde(si)];
        d = [d;di];
        w_blocks = [w_blocks, {w(i)*eye(3)}];
    end
    W = blkdiag(w_blocks{:});
    
    qbar = inv(S'*W*S)*S'*W*d;
    
    beta = (1/(sqrt(1+dot(qbar,qbar))))*[1;qbar];
end