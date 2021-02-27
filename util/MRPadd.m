function s = MRPadd(s2, s1)
% [FN(s)] = [FB(s2)][BN(s1)]
    ns1 = norm(s1,2);
    ns2 = norm(s2,2);
    
    s = ((1-ns1^2)*s2 + (1-ns2^2)*s1 - 2*cross(s2,s1)) ./ (1 + ns1^2 * ns2^2 - 2*dot(s1,s2));
end