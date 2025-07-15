% Author: Sylvia Amihere, October 2024
function [A, b] = matrix_A(s1,s2,A_up,A_low,A_diag)

nDim = length(s1);

A = zeros(nDim,nDim);
xhat =  zeros(nDim,1);

for i = 1:1
    A(i,i) = A(i,i) + (A_diag * s2(i)) / s1(i);
    A(i,i+1) = A(i,i+1) + (-A_up * s2(i+1)) / s1(i);
end

for i = 2:nDim-1
    A(i,i-1) =  A(i,i-1) + (-s2(i-1) *A_low) / s1(i);
    A(i,i) = A(i,i) + (s2(i) * A_diag) / s1(i);
    A(i,i+1) = A(i,i+1) + (-s2(i+1) * A_up) / s1(i);
end

for i = nDim:nDim
    A(i,i-1) = A(i,i-1) + (-s2(i-1) * A_low) / s1(i);
    A(i,i) = A(i,i) + (s2(i-1) * A_diag) / s1(i);
end

for i = 1:nDim
    xhat(i) = (1 + (i-1)) + 0*j;
end
% xhat

b = A * xhat;

end

% n = 4;
% s1 = ones(n,1);
% s2 = ones(n,1);
% A_up = -1+2i;
% A_low = 3-4i;
% A_diag = 2+5i;
% % % x0 = zeros(n,1);
% % % z0 = x0;
% x01 = zeros(n,1);
% x02 = zeros(n,1);
% z0 = complex(x01,x02);
% x0 = z0;
% max_iter = 4;
% delta = 1e-5;
