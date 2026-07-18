t0 = 0.0;
tf = 1.0;
n = 400;
t = linspace(t0, tf, n);

figure(1);
y1 = 1.0 + exp(-1e3*(t-0.5).^2);
plot(t,y1,'LineWidth', 2);

figure(2);
y2 = 1 - sin(4.0 * t).^4;
plot(t,y2,'LineWidth', 2);

figure(3); %this works: gives the computational gap
y3 = 1 + 0.5 * sin(200.0 * t) .* exp(-500.0 * (t - 0.5).^2);
plot(t,y3,'LineWidth', 2);

figure(4);
y4 = 1.0 + 0.5 * (exp(-5000.0*(t-0.3).^2) + 0.8 * exp(-5000.0*(t-0.7).^2));
plot(t,y4,'LineWidth', 2);

figure(5);
y5 = 1.0 - (sin(12.0 * t + 15 * (tanh(20 * (t - 0.5)) - tanh(20 * (0.0 - 0.5)))).^4);
plot(t,y5,'LineWidth', 2);

figure(6);
y6 = 1.0 + 0.5 * sin(1000 * pi * t) .* ( exp(-25000*(t-0.3).^2) + exp(-25000*(t-0.7).^2) );
plot(t,y6,'LineWidth', 2);

figure(7);%this works: gives the computational gap
y7 = 1.0 + 0.5 * sin(10 * pi * t ) .* sin(10.0 * exp(-500*(t-0.5).^2) );
plot(t,y7,'LineWidth', 2);

figure(8);
y8 = 1.0 + 1.0 * exp(-1.0 * (t - 0.5).^2/(2*0.05*0.05));
plot(t,y8,'LineWidth', 2);