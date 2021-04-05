I = [
    125, 0, 0;
    0, 100, 0;
    0, 0,  75;
];

X01 = [0;0;0;1;0;0];
X02 = [0;0;0;0;1;0];
X03 = [0;0;0;0;0;1];
X04 = [0;0;0;1;0.1;0];
X05 = [0;0;0;0;1;0.1];
X06 = [0;0;0;0.1;0;1];

t = 0:0.001:50;

f = @(X) dXdt(X,I);

X1 = Integrate(f,X01,t);
X2 = Integrate(f,X02,t);
X3 = Integrate(f,X03,t);
X4 = Integrate(f,X04,t);
X5 = Integrate(f,X05,t);
X6 = Integrate(f,X06,t);

Xs = [{X1}, {X2}, {X3}, {X4}, {X5}, {X6}];

%%
for i = 0:5
    cur_x = cell2mat(Xs(i+1));
    subplot(6,2,2*i + 1)
    plot(t, cur_x(1:3,:), 'LineWidth',2)
    if i == 0
        legend("\sigma_1", "\sigma_2", "\sigma_3", 'FontSize', 14)
    end
    subplot(6,2,2*i + 2)
    plot(t, cur_x(4:6,:), '--', 'LineWidth',2)
    ylim([-1.0,1.05])
    if i == 0
        legend("\omega_1", "\omega_2", "\omega_3", 'FontSize', 14)
    end
end