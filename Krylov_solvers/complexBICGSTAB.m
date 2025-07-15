% Author: Sylvia Amihere, October 2024
% function [z_sol, rtildeN, num_iter] = complexBICGSTAB(z0,s1, s2, A_up, A_low, A_diag, delta, max_iter)
function [z_sol, rel_residual, num_iter] = complexBICGSTAB(z0,s1, s2, A_up, A_low, A_diag, max_iter, delta)

% Function to generate matrix and RHS vector b
[A, b] = matrix_A(s1,s2,A_up,A_low,A_diag);

% Allocate vectors
n = length(z0);
z_sol = zeros(n,1);
% omegaT = zeros(n,1);


%Initialize
rtilde0 = b - (A*z0);
% r_norm = dot(rtilde0,rtilde0)
% rho = r_norm;
stilde0 = rtilde0;
y0 = rtilde0;
deltaT0 = dot(y0,rtilde0);%transpose(conj(y0))*rtilde0;
phi0 = transpose(conj(y0))*A*stilde0/deltaT0;

% if (r_norm<=delta)
%     error("Algorithm failed");
% end

if (deltaT0 == 0)
    error("Algorithm failed! Initial Delta-tilde cannot be zero");
end

if (phi0 == 0)
    error("Algorithm failed! Initial Phi cannot be zero");
end

for k = 0:max_iter
    % k = 0; %counter
    % while ((rho > delta) && (k < max_iter))
    omegaN = 1.0/phi0;
    omegaT = rtilde0 - A*stilde0*omegaN;
    chiN = dot((A*omegaT),omegaT)/dot((A*omegaT),(A*omegaT));
    rtildeN = omegaT - A*omegaT*chiN;
    % fprintf("Relative residual is %f iteration \n", norm(rtildeN));
    % fprintf("Relative residual is %0.14f at %d iteration \n", norm(b - A*z_sol)/norm(b), k);

    z_sol = z_sol + stilde0*omegaN + omegaT*chiN;

    rel_residual = norm(b - A*z_sol)/norm(b);
    num_iter = k;

    % if (all(rtildeN)==0 || norm(rtildeN)<=delta || rel_residual<=delta)
    if (all(rtildeN)==0 || rel_residual<=delta)
        fprintf("Algorithm converged after %d iterations with relative residual %0.14e.  \n", k, rel_residual);
        % fprintf("Relative residual is %0.14f \n", norm(b - A*z_sol)/norm(b));
        % fprintf("Relative residual is %f iteration \n", norm(rtildeN));
        break;
    end
    % if (rho<=delta)
    %     fprintf("Algorithm converged at %d iteration \n", k);
    %     break;
    % end
    % rel_residual = norm(b - A*z_sol)/norm(b);
    % num_iter = k;

    deltaT = dot(y0,rtildeN); %transpose(conj(y0))*rtildeN; %dot(y0,rtildeN);
    % deltaT0

    if (deltaT == 0)
        error("Algorithm failed! Delta cannot be zero");
    end

    psiN = -omegaN*deltaT/(deltaT0*chiN);
    stildeN = rtildeN - (stilde0 - A*stilde0*chiN)*psiN;
    phiN = transpose(conj(y0))*A*stildeN/deltaT;

    if (phiN == 0)
        error("Algorithm failed! Phi cannot be zero");
    end

    phi0 = phiN;
    rtilde0 = rtildeN;
    stilde0 = stildeN;
    deltaT0 = deltaT;
    % k = k+1;

end

end





