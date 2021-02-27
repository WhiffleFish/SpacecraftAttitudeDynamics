function hist = MRPintegrate(s0,w,ts)
    s = reshape(s0,3,1);
    hist = zeros(length(ts), 3);
    hist(1,:) = s';
    for i = 1:length(ts)-1
        s = MRPIntStep(s,w,ts(i),ts(i+1)-ts(i));
        if norm(s,2) >= 1
            s = -s./(sum(s.^2)^2);
        end
        hist(i+1,:) = s';
    end
end

function sp = MRPIntStep(s, w, t, h)
    k1 = 0.25*MRP_B(s)*w(t);
    k2 = 0.25*MRP_B(s+h*(k1/2))*w(t+h/2);
    k3 = 0.25*MRP_B(s+h*(k2/2))*w(t+h/2);
    k4 = 0.25*MRP_B(s+h*k3)*w(t+h);
    
    sp = s + (1/6)*h*(k1 + 2*k2 + 2*k3 + k4);
end