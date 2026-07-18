function alpha_s_1_n = optimal_alpha(n)
alpha_s_1_n = zeros(n,2);
for i = 2:n
    %i goes from 2 because we want 2 stages or more
    alpha_s_1_n(i, 1) = i;
    alpha_s_1_n(i, 2) = bisection(i);
end
plot(alpha_s_1_n(:,1),alpha_s_1_n(:,2),'r--', 'LineWidth',2)
xlabel('stages', 'FontSize', 12);
ylabel('optimal alpha', 'FontSize', 12);
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
%fit in the stability region
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

