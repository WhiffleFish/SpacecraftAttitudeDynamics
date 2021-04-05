function xp = IntStep(f, x, dt)
    if norm(x(1:3),2) >= 1
        x(1:3) = -x(1:3)./(sum(x(1:3).^2)^2);
    end
    xp = x + f(x)*dt;
end