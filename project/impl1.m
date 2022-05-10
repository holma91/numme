%% Define Problem

params.alpha = 1.1;
params.beta = 0.4;
params.gamma = 0.4;
params.delta = 0.1;

f = @(t, x) LotkaVolterraModel(x, params);

x0 = [20; 5];

%% Solve the Diff. Eq.

t0 = 0;
tf = 10;
dt = 0.01;

[x, t] = RungeKutta4(f, x0, t0, tf, dt);

%% Plot Results

figure;
plot(t, x);
legend('Preys', 'Predators');
xlabel('Time (t)');
grid on;