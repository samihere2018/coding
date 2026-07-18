function[sylvia, s, alpha_s, bad_xt, bad_yt, fit] = ellipseRKG(s, alpha_s)
%==========================================================================
% This program takes the number of stages and a value of alpha to determine
% if a some (x,y) value satisfies Skara's stability polynomial.
% If it does then that is the alpha we need together with the beta
% to draw the ellipse (O'Sullivan's ellipse) that will fit inside 
% Skara's stbaility region.
% Author: Sylvia Amihere 
%==========================================================================
if (s<=1)
    error('Number of stages must be a postive integer greater than 1.');
end
bad_xt = [];
bad_yt = [];
% s = 5;
% alpha_s = 3;
n = 5000;
beta_s = (s+4)*(s-1)/3;
t = linspace(0, 2*pi, n);

% compute the parameters in the stabilty region formula
w_1 = 6 / ( (s+4) * (s-1) );
b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;

x_t = -beta_s/2 * cos(t) - beta_s/2;
y_t = alpha_s * sin(t) + 0;
z = x_t + 1i * y_t;

% recurrence relation for RKG2 method
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
    disp("stable at all points")
    fit = 1;
    sylvia = max(abs(R_s)) - 1  
else
    disp("at least one point is unstable")
    first_bad_idx = unstable_idx(1);
    bad_xt = x_t(first_bad_idx);
    bad_yt = y_t(first_bad_idx);
    fit = -1;
    sylvia = max(abs(R_s)) - 1  
end
end

