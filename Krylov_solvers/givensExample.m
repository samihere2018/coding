H2 = [3 4; 5 6];

if (abs(H2(2,1))>=abs(H2(1,1)))
    temp3 = H2(1,1)/H2(2,1);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = H2(2,1)/H2(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G1 = [c -s; s c];
firstIter = G1*H2

H3 = [3 4 7; 5 6 8; 0 9 10];
H3_col3 = G1*H3(1:2,3);
H3(1:2,3) = H3_col3;
H3(1,1:2) = firstIter(1,1:2);
H3(2,1:2) = firstIter(2,1:2);
H3_new = H3


if (abs(H3_new(3,2))>=abs(H3_new(2,2)))
    temp3 = H3_new(2,2)/H3_new(3,2);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = H3_new(3,2)/H3_new(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G2 = [1 0 0; 0 c -s; 0 s c];
% H3_final = G2(2:3,2:3)*H3_new(2:3,:);
H3_final = G2*H3

b = [2;1;4];
A = [3 4 7; 5 6 8; 0 9 10];
x_sol = A\b
