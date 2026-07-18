function RKG2_stabReg(s, alpha_s)
% This function plots the stability region for the RKG2 scheme in 
% "Super-time-stepping schemes for parabolic equations with boundary " + ...
% conditions" by Skaras et.al (2021)
% s = number of stages which 
% The scheme is able to take super time steps in proportion to the number of
% stages squared.
% Author: Sylvia Amihere

if (s<=0)
    error('Number of stages must be a positive integer.');
end

% calculate the extent of the stability region
% z = -2/w1
zmax = -2 * (s + 4) * (s - 1) / 6;
xmin = zmax * 1.1;               
xmax = max(5, abs(zmax) * 0.05); 
ymax = abs(zmax) * 0.5;          
ymin = -ymax;

% compute the paramters in the stabilty region formula
w_1 = 6 / ( (s+4) * (s-1) );
b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;

N = 1000;
[X,Y] = meshgrid(linspace(xmin,xmax,N), linspace(ymin,ymax,N));
Z = X + 1i * Y;

% recurrence relation for RKG2 method
W = 1 + w_1 * Z;

C32_prev2 = ones(size(Z));
C32_prev1 = 2 * (3/2) * W;

if (s==1)
    C_s = C32_prev1;
else
    for k = 2:s
    C_current = (1/k) * (W .*(2*k + 1) .*C32_prev1 - (k + 1) .*C32_prev2);
    C32_prev2 = C32_prev1;
    C32_prev1 = C_current;
    end
    C_s = C_current;
end

% stability polynomial
R_s = a_s + b_s * C_s;

figure;
hold on; grid on;

% plot the stability region
% this draws the x and y axes showing the origin
xline(0, 'k-', "LineWidth", 1);
yline(0, 'k-', "LineWidth", 1);

contour(X, Y, abs(R_s), [1+eps 1+eps], 'b-', "LineWidth", 2); %note that |R(z)|<=1
axis([xmin xmax ymin ymax]);

%add the ellipse
beta_s = (s+4)*(s-1)/3;
t = linspace(0, 2*pi, 5000);
x_t = -beta_s/2 * cos(t) - beta_s/2;
y_t = alpha_s * sin(t) + 0;
plot(x_t, y_t, 'r--', "LineWidth", 1)


title(sprintf('RKG2 stability region with %d stages', s), 'FontSize', 12);
xlabel('real(z)', 'FontSize', 12);
ylabel('imag(z)', 'FontSize', 12);
hold off;

end
