
% A = [4 1 4; 2 -1 7; 0 6 2; 0 0 8];
% b = [2; -4; 1; 3];
A = [4+3i  1+2i  4-6i; 2-1i  -1+5i  7-3i; 0  6-4i  2+3i; 0  0  8+1i];
b = [2+1i; -4-1i; 1-5i; 3+2i];
xSol = A\b
[row,col] = size(A);
qRotators = zeros(2*col,1); %the values for Givens rotations at each iteration

%%% QR factorization using Givens Rotation
temp1 = A(1,1);
temp2 = A(2,1);
if (abs(temp2)>=abs(temp1))
    temp3 = (conj(temp1)*temp1)/(conj(temp2)*temp2);
    s = -1/((temp2/abs(temp2))*sqrt(1+temp3));
    c = -s*(conj(temp1)/conj(temp2));
else
    temp3 = (conj(temp2)*temp2)/(conj(temp1)*temp1);
    c = 1/((temp1/abs(temp1))*sqrt(1+temp3));
    s = -c*(conj(temp2)/conj(temp1));
end
qRotators(1,1) = c;
qRotators(2,1) = s;
G1 = [c -s 0 0 ; conj(s) conj(c) 0 0 ; 0 0 1 0 ; 0 0 0 1];
iter1 = G1*A;


temp1 = iter1(2,2);
temp2 = iter1(3,2);
if (abs(temp2)>=abs(temp1))
    temp3 = (conj(temp1)*temp1)/(conj(temp2)*temp2);
    s = -1/((temp2/abs(temp2))*sqrt(1+temp3));
    c = -s*(conj(temp1)/conj(temp2));
else
    temp3 = (conj(temp2)*temp2)/(conj(temp1)*temp1);
    c = 1/((temp1/abs(temp1))*sqrt(1+temp3));
    s = -c*(conj(temp2)/conj(temp1));
end
qRotators(3,1) = c;
qRotators(4,1) = s;
G2 = [1 0 0 0; 0 c -s 0; 0 conj(s) conj(c) 0; 0 0 0 1];
iter2 = G2*iter1;


temp1 = iter2(3,3);
temp2 = iter2(4,3);
if (abs(temp2)>=abs(temp1))
    temp3 = (conj(temp1)*temp1)/(conj(temp2)*temp2);
    s = -1/((temp2/abs(temp2))*sqrt(1+temp3));
    c = -s*(conj(temp1)/conj(temp2));
else
    temp3 = (conj(temp2)*temp2)/(conj(temp1)*temp1);
    c = 1/((temp1/abs(temp1))*sqrt(1+temp3));
    s = -c*(conj(temp2)/conj(temp1));
end
qRotators(5,1) = c;
qRotators(6,1) = s;
G3 = [1 0 0 0; 0 1 0 0; 0 0 c -s; 0 0 conj(s) conj(c)];
iter3 = G3*iter2;

%%%
qRotators


%%% Comparing iter3 and R, the numbers (ignore signs) should be the same.
[Q,R] = qr(A);

for k = 1:col
    q_ptr = 2*k-1;
    c = qRotators(q_ptr,1);
    s = qRotators(q_ptr+1,1);
    temp1 = b(k,1);
    temp2 = b(k+1,1);
    b(k,1) = c*temp1 - s*temp2;
    b(k+1,1) = conj(s)*temp1 + conj(c)*temp2;
end

for k = col:-1:1
    b(k,1) = b(k,1)/iter3(k,k);
    for i = 1:k-1
        b(i,1) = b(i,1) - b(k,1)*iter3(i,k);
    end
end

%%% Check solution: b and xSol should be the same
tol = 10^-14;
checkSol = 0;
for i = 1:col
    if (abs((b(i)-xSol(i)))>tol)
        checkSol = 1;
    end
end
if checkSol==0
    fprintf ("Test Passed!\n");
end
b(1:col)
xSol(1:col);




% %%%Solution x using Givens rotation
% bsol = zeros(row,1);
% q0c = 0.894427;
% q1s = -0.447214;
% temp1 = b(1);
% temp2 = b(2);
% b(1) = q0c*temp1 - q1s*temp2;
% b(2) = q1s*temp1 + q0c*temp2;
% 
% q2c = -0.218218;
% q3s = -0.975900;
% temp1 = b(2);
% temp2 = b(3);
% b(2) = q2c*temp1 - q3s*temp2;
% b(3) = q3s*temp1 + q2c*temp2;
% 
% q4c = -0.514558;
% q5s = -0.857455;
% temp1 = b(3);
% temp2 = b(4);
% b(3) = q4c*temp1 - q5s*temp2;
% b(4) = q5s*temp1 + q4c*temp2;
% b

% 
% b(3) = b(3)/9.329931;
% b(1) = b(1) - b(3)*6.708204;
% b(2) = b(2) - b(3)*0.975900;
% 
% b(2) = b(2)/6.148170;
% b(1) = b(1) - b(2)*0.447214;
% 
% b(1) = b(1)/4.472136;
% b





