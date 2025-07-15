
A = [3 1 4 6; 2 -1 7 3; 0 6 2 1; 0 0 8 2; 0 0 0 3];
b = [2; -4; 1; 4; 3];
xSol = A\b;
[row,col] = size(A);
qRotators = zeros(2*col,1); %the values for Givens rotations at each iteration


if (abs(A(2,1))>=abs(A(1,1)))
    temp3 = A(1,1)/A(2,1);
    s = -1/sqrt(1+temp3^2);
    c = -s*temp3;
else
    temp3 = A(2,1)/A(1,1);
    c = 1/sqrt(1+temp3^2);
    s = -c*temp3;
end
qRotators(1,1) = c;
qRotators(2,1) = s;
G1 = [c -s 0 0 0; s c 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
iter1 = G1*A;


if (abs(iter1(3,2))>=abs(iter1(2,2)))
    temp3 = iter1(2,2)/iter1(3,2);
    s = -1/sqrt(1+temp3^2);
    c = -s*temp3;
else
    temp3 = iter1(3,2)/iter1(2,2);
    c = 1/sqrt(1+temp3^2);
    s = -c*temp3;
end
qRotators(3,1) = c;
qRotators(4,1) = s;
G2 = [1 0 0 0 0; 0 c -s 0 0; 0 s c 0 0; 0 0 0 1 0; 0 0 0 0 1];
iter2 = G2*iter1;


if (abs(iter2(4,3))>=abs(iter2(3,3)))
    temp3 = iter2(3,3)/iter2(4,3);
    s = -1/sqrt(1+temp3^2);
    c= -s*temp3;
else
    temp3 = iter2(4,3)/iter2(3,3);
    c = 1/sqrt(1+temp3^2);
    s = -c*temp3;
end
qRotators(5,1) = c;
qRotators(6,1) = s;
G3 = [1 0 0 0 0; 0 1 0 0 0; 0 0 c -s 0; 0 0 s c 0; 0 0 0 0 1];
iter3 = G3*iter2;

if (abs(iter3(5,4))>=abs(iter3(4,4)))
    temp3 = iter3(4,4)/iter3(5,4);
    s = -1/sqrt(1+temp3^2);
    c= -s*temp3;
else
    temp3 = iter3(5,4)/iter3(4,4);
    c = 1/sqrt(1+temp3^2);
    s = -c*temp3;
end
qRotators(7,1) = c;
qRotators(8,1) = s;
G4 = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 c -s; 0 0 0 s c];
iter4 = G4*iter3;

%%%
qRotators;

%%% Comparing iter3 and R, the numbers (ignore signs) should be the same.
[Q,R] = qr(A);

for k = 1:col
    q_ptr = 2*k-1;
    c = qRotators(q_ptr,1);
    s = qRotators(q_ptr+1,1);
    temp1 = b(k,1);
    temp2 = b(k+1,1);
    b(k,1) = c*temp1 - s*temp2;
    b(k+1,1) = s*temp1 + c*temp2;
end

for k = col:-1:1
    b(k,1) = b(k,1)/iter4(k,k);
    for i = 1:k-1
        b(i,1) = b(i,1) - b(k,1)*iter4(i,k);
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
% b(1:col)
% xSol(1:col)

