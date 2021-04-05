function X = Integrate(f, X0, t)
    x = X0;
    X = X0;
    dt = t(2) - t(1);
    for i=t(2:end)
        x = IntStep(f,x,dt);
        X = [X,x];
    end
end