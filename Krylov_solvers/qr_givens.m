% A = [6 5 0; 5 1 4; 0 4 3];
% c1 = 6/sqrt(6^2 + 5^2);
% s1 = -5/sqrt(6^2 + 5^2);
% G1 = [c1 -s1 0; s1 c1 0; 0 0 1];
% firstIter = G1*A;
% [Q,R] = qr(firstIter)
% c2 = firstIter(2,2)/sqrt(firstIter(2,2)^2 + firstIter(3,2)^2);
% s2 = -firstIter(3,2)/sqrt(firstIter(2,2)^2 + firstIter(3,2)^2);
% G2 = [1 0 0; 0 c2 -s2; 0 s2 c2];
% secondIter = G2*firstIter;


% A = [2 1 3; 1 4 -1; 0 2 5; 0 0 -3];
% c1 = 2/sqrt(2^2 + 1^2)
% s1 = -1/sqrt(2^2 + 1^2)
% G1 = [c1 -s1 0 0; s1 c1 0 0; 0 0 1 0; 0 0 0 1];
% firstIter = G1*A
% c2 = firstIter(2,2)/sqrt(firstIter(2,2)^2 + firstIter(3,2)^2);
% s2 = -firstIter(3,2)/sqrt(firstIter(2,2)^2 + firstIter(3,2)^2);
% G2 = [1 0 0 0; 0 c2 -s2 0; 0 s2 c2 0; 0 0 0 1];
% secondIter = G2*firstIter

% A = [0 -1 1; 4 2 0; 3 4 0]
% A = [2 -1 -2; -4 6 3; 0 -2 8]
A = [3 4 7; 5 6 8; 0 9 10];
if (abs(A(2,1))>=abs(A(1,1)))
    temp3 = A(1,1)/A(2,1);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = A(2,1)/A(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
% c1 = A(1,1)/sqrt(A(1,1)^2 + A(2,1)^2)
% s1 =  -A(2,1)/sqrt(A(1,1)^2 + A(2,1)^2)
G1 = [c -s 0; s c 0; 0 0 1];
firstIter = G1*A
% % [Q,R] = qr(firstIter)
if (abs(firstIter(3,1))>=abs(firstIter(1,1)))
    temp3 = firstIter(1,1)/firstIter(3,1);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = firstIter(3,1)/firstIter(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
% c2 = firstIter(1,1)/sqrt(firstIter(1,1)^2 + firstIter(3,1)^2)
% s2 = -firstIter(3,1)/sqrt(firstIter(1,1)^2 + firstIter(3,1)^2)
G2 = [c 0 -s; 0 1 0; s 0 c];
secondIter = G2*firstIter

% c3 = secondIter(2,2)/sqrt(secondIter(2,2)^2 + secondIter(3,2)^2)
% s3 = -secondIter(3,2)/sqrt(secondIter(2,2)^2 + secondIter(3,2)^2)

if (abs(secondIter(3,2))>=abs(secondIter(2,2)))
    temp3 = secondIter(2,2)/secondIter(3,2);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = secondIter(3,2)/secondIter(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G3 = [1 0 0; 0 c -s; 0 s c];
thirdIter = G3*secondIter

b = [2;1;4];
A = [3 4 7; 5 6 8; 0 9 10];
x_sol = A\b
