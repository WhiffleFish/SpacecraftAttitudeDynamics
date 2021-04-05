function B = MRP_B(s)
    B = (1-sum(s.^2))*eye(3) + 2*tilde(s) + 2*(s*s');
end