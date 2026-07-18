function RKG2_stabReg2(s)
% This function plots the stability region for the RKG2 scheme in 
% "Super-time-stepping schemes for parabolic equations with boundary " + ...
% conditions" by Skaras et.al (2021) together with the ellipse that should
% fit into it.
% s = number of stages 
% The scheme is able to take super time steps in proportion to the number of
% stages squared.
% Author: Sylvia Amihere

if (s<=2)
    error('Number of stages must be a positive integer greater than or equal to 2.');
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

%determine the alpha value using semi-latus rectum (p): ratio-type relationship 
%between major and minor axes (beta, alpha). In O'Sullivan's paper eqn 14
if (s==2)
    p = 1.5;
elseif (s==3)
    p = 0.500;
elseif (s==4)
    p = 0.67;
elseif (s==5)
    p = 0.726;
elseif (s==6)
    p = 0.89;
elseif (s==7)
    p = 0.834;
elseif (s==8)
    p = 1.005;
elseif (s==9)
    p = 0.892;
elseif (s==10)
    p = 1.076;
elseif (s==11)
    p = 0.926;
 elseif (s==12)
    p = 1.119;
elseif (s==13)
    p = 0.948;
elseif (s==14)
    p = 1.15;
elseif (s==15)
    p = 0.963;
elseif (s==16)
    p = 1.17;
elseif (s==17)
    p = 0.973;
elseif (s==18)
    p = 1.18;
elseif (s==19)
    p = 0.980;

%odd stages
elseif (s>=21 && s<39 && mod(s,2)~=0)
    p = 1.00;
elseif (s>=39 && s<65 && mod(s,2)~=0)
    p = 1.010;
elseif (s>=65 && s<77 && mod(s,2)~=0)
    p = 1.011;
elseif (s>=77 && s<89 && mod(s,2)~=0)
    p = 1.012;
elseif (s>=89 && s<140 && mod(s,2)~=0)
    p = 1.0126;
elseif (s>=140 && mod(s,2)~=0)
    p = 1.013;

%even stages
elseif (s>=20 && s<28 && mod(s,2)==0)
    p = 1.21;
elseif (s>=28 && s<36 && mod(s,2)==0)
    p = 1.22;
elseif (s>=36 && s<52 && mod(s,2)==0)
    p = 1.23;
elseif (s>=52 && s<88 && mod(s,2)==0)
    p = 1.240;
elseif (s>=88 && s<106 && mod(s,2)==0)
    p = 1.241;
elseif (s>=106 && s<142 && mod(s,2)==0)
    p = 1.242;
elseif (s>=142 && mod(s,2)==0)
    p = 1.243;
end

%add the ellipse
beta_s = (s+4)*(s-1)/3;
alpha_s = sqrt(p * beta_s);
t = linspace(0, 2*pi, 5000);
x_t = -beta_s/2 * cos(t) - beta_s/2;
y_t = alpha_s * sin(t) + 0;
plot(x_t, y_t, 'r--', "LineWidth", 1)


title(sprintf('RKG2 stability region with %d stages', s), 'FontSize', 12);
xlabel('real(z)', 'FontSize', 12);
ylabel('imag(z)', 'FontSize', 12);
hold off;

end
