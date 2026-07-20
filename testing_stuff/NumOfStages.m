function s_final = NumOfStages(lambda, dt)
%Description: computes the correct number of stages given the initial
%             number of stages, desired step size and dominant eigenvalue (real or complex)
%Input: s_initial = initial number of stages (no to be supplied by the user, the user
%                   just supplies the desired step size and the dominant eigenvalue)
%Output: s_final = correct number of stages
s = NumOfStages_intial(lambda, dt);
disp("Initial stages: " + s);
s_initial = 0;
counter = 0;
while(s~=s_initial)
    counter = counter + 1;
    s_initial = s;
    [p, alpha] = optimal_alpha(s_initial);
    s = NumOfStages_intial(lambda, dt, p);
end
s_final = s;
RKG2_stabReg(s_final, alpha);
disp("Convergence reached after " + counter + " iterations with <strong>" + s_final + "</strong> stages. " )
end

function s_initial = NumOfStages_intial(lambda, dt, p)
%Description: Computes the number of stages given a desired step size and the dominant eigenvalue (complex or real)
%Input: lambda = complex-valued dominant eigenvalue (it coule be real)
%        dt = desired step size
%        p is optional but any value provided overrides the default
%        p = (alpha^2)/beta; alpha = minor axis of ellipse, beta = major axis of ellipse
%Output: s = number of stages
if nargin < 3
    p = 1.243; %use the default if not provided
end

x_val = real(lambda);
y_val = imag(lambda);
x_s = dt * x_val;
y_s = dt * y_val;

beta_val = (-4.0 * (x_s ^ 2)) / (4.0 * x_s + ((y_s ^ 2)/p));
s_initial = ceil(0.5 * (-3.0 + sqrt(25.0 + 12.0 * beta_val)));
end


function [p, alpha] = optimal_alpha(n)
alpha_s_1_n = zeros(n,3);
for i = 2:n
    %i goes from 2 because we want 2 stages or more
    beta_s = (i+4)*(i-1)/3; %value of beta
    alpha_s_1_n(i, 1) = int32(i);%stage number
    alpha_s_1_n(i, 2) = bisection(i); %corresponding optimal alpha 
    alpha_s_1_n(i, 3) = alpha_s_1_n(i, 2)^2/beta_s;%corresponding relationship between alpah and beta; alpha/beta & beta /alpha don't converge anywhere
    %this relationship: (minor axis)^2/major axis is semi lactus rectum used in O'Sullivan's equation 14 but I dont understand. 
    %However, it seems to give some alternating values for stages. See my rough handwritten notes on this whole RKG2 ellipse in stability region ideas.
end
% RKG2_stabReg(n, alpha_s_1_n(n,2));
p = alpha_s_1_n(n, 3);
alpha = alpha_s_1_n(n, 2);
% disp("For " + n + " stages: " + " alpha = " + alpha_s_1_n(n, 2) + ", p = " + alpha_s_1_n(n, 3))
% RKG2_stabReg(n, alpha_s_1_n(n,2)); %plot the stability region with ellipse (using optimal alpha and beta) of n-stages
% hold on;
% figure;
% plot(alpha_s_1_n(:,1),alpha_s_1_n(:,2),'r--', 'LineWidth',2)
% xlabel('stages', 'FontSize', 12);
% ylabel('optimal alpha', 'FontSize', 12);
end


function [alpha_s] = bisection(s)
%==========================================================================
% This program takes the number of stages to help determine the optimal
% alpha for each number of stages.
% Author: Sylvia Amihere 
%==========================================================================
beta_s = (s+4)*(s-1)/3;
low_alpha = 0; %ensures the ellipse always fits because there is not height for the ellipse, besides that's the second component for the centre of the ellipse
high_alpha = beta_s; %use beta as the starting value for your alpha
while (ellipse_alpha(s, high_alpha)==1)
    high_alpha = 2.0 * high_alpha; %doubles until ellipse is out of stability region
end

%bisection section to determine the optimal alpha that makes the ellipse
%fit in the stability region for s-stages
while( abs(high_alpha - low_alpha) > 1e-8)
    mid_alpha = (low_alpha + high_alpha)/2.0;
    if (ellipse_alpha(s, mid_alpha) == 1)
        low_alpha = mid_alpha;
    else
         high_alpha = mid_alpha;
    end
end
alpha_s = low_alpha;
end


function fit = ellipse_alpha(s, alpha_s)
%==========================================================================
% This program takes the number of stages and a value of alpha to determine
% if a some (x,y) values satisfy Skaras' stability polynomial.
% If all the values do then that is the alpha we need together with the beta
% to draw the ellipse (O'Sullivan's ellipse) that will fit inside. 
% Skara's stbaility region.
% Author: Sylvia Amihere 
%==========================================================================
if (s<=1)
    error('Number of stages must be a postive integer greater than 1.');
end
% bad_xt = [];
% bad_yt = [];
% s = 5;
% alpha_s = 3;
beta_s = (s+4)*(s-1)/3;
n = 5000; %pick a lot of points so we do not leave any loopholes
t = linspace(0, 2*pi, n); %for parametrizing the ellipse. we need to know the (x,y) values that lie on the ellipse

% compute the parameters in the stabilty region formula (Skaras' paper)
w_1 = 6 / ( (s+4) * (s-1) );
b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;

x_t = -beta_s/2 * cos(t) - beta_s/2; %parametrize the ellipse
y_t = alpha_s * sin(t) + 0;
z = x_t + 1i * y_t;%now we know the (x,y) values that lie on the ellipse, so let's check if they lie in the stbaility region. 
%if not then we have to change alpha

% recurrence relation for RKG2 method (Skaras)
W = 1 + w_1 * z;

C32_prev2 = ones(size(z));
C32_prev1 = 2 * (3/2) * W;

for k = 2:s
    C_current = (1/k) * (W .*(2*k + 1) .*C32_prev1 - (k + 1) .*C32_prev2);
    C32_prev2 = C32_prev1;
    C32_prev1 = C_current;
end
C_s = C_current;

% stability polynomial
R_s = a_s + b_s * C_s;

%check if the stability condition is satisfied
unstable_idx = find(abs(R_s) > 1+1e-9);
if isempty(unstable_idx)
    % disp("stable at all points")
    fit = 1;
else
    % disp("at least one point is unstable")
    % % first_bad_idx = unstable_idx(1);
    % bad_xt = x_t(first_bad_idx); %spit out the x and y values that lie outside the stabiltiy region using this alpha value
    % bad_yt = y_t(first_bad_idx);
    fit = -1;
end
end


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







