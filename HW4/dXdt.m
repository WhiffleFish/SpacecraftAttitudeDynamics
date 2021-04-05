function dX = dXdt(X,I)
    do = omega_dot(I,X(4:6));
    ds = 0.25*MRP_B(X(1:3))*X(4:6);
    dX = [ds;do];
end