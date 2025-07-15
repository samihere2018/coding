% Author: Sylvia Amihere, October 2024
function [x_sol] = complexBICGSTAB2(x0,s1, s2, A_up, A_low, A_diag, max_iter, delta)

% Function to generate matrix and RHS vector b
[A, b] = matrix_A(s1,s2,A_up,A_low,A_diag);

% Allocate vectors
n = length(x0);
x_sol = zeros(n, 1);


%Initialize
r0 = b - (A * x0);
p0 = r0;
y0 = r0;
beta_denom = dot(y0, r0);%transpose(conj(y0))*r0;
v0 = A * p0;
phi0 = dot(y0, v0) / beta_denom; %transpose(conj(y0))*v0/rho0;


if (beta_denom == 0)
    error("Algorithm failed! Initial Delta-tilde cannot be zero");
end

if (phi0 == 0)
    error("Algorithm failed! Initial Phi cannot be zero");
end


%Begin loop
for k = 0 : max_iter

    alpha = 1.0 / phi0;
    s = r0 - alpha * v0;
    t = A * s;
    omega_denom = dot(t, t);
    omega = dot(t, s);
    omega = omega / omega_denom;
    r = s - omega * t;

    x_sol = x_sol + alpha * p0 + omega * s;

    rel_residual = norm(b - A * x_sol) / norm(b);

    if (norm(r)==0 || rel_residual<=delta)
        fprintf("Algorithm converged after %d iterations with relative residual = %0.14e. \n", k, rel_residual);
        break;
    end

    beta_num = dot(y0, r); %transpose(conj(y0))*r; %dot(y0,r);

    if (beta_num == 0)
        error("Algorithm failed! Delta cannot be zero");
    end

    beta = -(beta_num / beta_denom) * (alpha / omega);
    p = r - (p0 - omega * v0) * beta;
    v = A * p;
    phiN = dot(y0, v) / beta_num; %transpose(conj(y0))*v/rho;

    if (phiN == 0)
        error("Algorithm failed! Phi cannot be zero");
    end

    phi0 = phiN;
    r0 = r;
    p0 = p;
    beta_denom = beta_num;
    v0 = v;

end

end





