function s2 = MRPsubtract(s, s1)
% [FN(s)][BN(s1)]^T = [FB(s2)]
    %ns = norm(s,2);
    %ns1 = norm(s1,2);
    
    %s2 = ((1-ns^2)*s1 + (1-ns1^2)*s + 2*cross(s,s1)) ./ (1 + ns^2 * //ns1^2 + 2*dot(s1,s));
    s2 = MRPadd(s, -s1);
end