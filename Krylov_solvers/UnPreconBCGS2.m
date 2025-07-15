% Author: Sylvia Amihere, October 2024
function [x_sol, r, num_iter] = UnPreconBCGS2(x0,s1, s2, A_up, A_low, A_diag, delta, max_iter)

% Function to generate matrix and RHS vector b
[A, b] = matrix_A(s1,s2,A_up,A_low,A_diag);

% Allocate vectors
n = length(x0);
x_sol = zeros(n,1);

%Initialize
rstar = b - (A * x0); %checked
beta_denom = dot(rstar,rstar); %checked
r_norm = sqrt(beta_denom); %checked
rho = r_norm;
r = rstar; %checked
p = rstar; %checked

%algorithm fails if r_norm<delta
if (r_norm<=delta)
    error("Algorithm failed");
end

%loop begins
% k = 0; %counter
% while ((rho > delta) && (k < max_iter))
for k = 1:max_iter
    Ap = A*p;
    alpha = dot(Ap, rstar); %original algorithm is dot(rstar, Ap)
    alpha = beta_denom / alpha;
    q = r - alpha*Ap;
    u = A*q;
    omega_denom = dot(u,u);
    if (omega_denom==0)
        % error("Omega_denom cannot be 0")
        omega_denom = 1;
    end
    omega = dot(u,q);
    omega = omega / omega_denom;

    % if (k == 0 && all(x0 == 0))
    %     x_sol = alpha*p + omega*q;
    % else
    x_sol = x_sol + alpha*p + omega*q;
    r = q - omega*u;
    % end

    rho = sqrt(dot(r,r));
    residula_norm = norm(b - A*x_sol)/norm(b);
    num_iter = k;

    % if (rho<=delta)
    if (rho<=delta || residula_norm<=delta)
        fprintf("Algorithm converged at %d iteration \n", k);
        break;
    end
    

    beta_num = dot(r, rstar); %original algorithm is dot(rstar, r)
    beta = (beta_num / beta_denom)*(alpha / omega);
    p = beta*p - alpha*(beta_num / beta_denom) + r;
    beta_denom = beta_num;
    % k = k + 1;
end


   















