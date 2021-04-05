function x = omega_dot(I,omega)
    I = diag(I);
    omega1_dot = -((I(3) - I(2))/(I(1)))*omega(2)*omega(3);
    omega2_dot = -((I(1) - I(3))/(I(2)))*omega(3)*omega(1);
    omega3_dot = -((I(2) - I(1))/(I(3)))*omega(1)*omega(2);
    x = [omega1_dot; omega2_dot; omega3_dot];
end