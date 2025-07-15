
A = [4 1 4 6; 2 -1 7 3; 9 6 2 1; 0 -3 8 2]
if (abs(A(2,1))>=abs(A(1,1)))
    temp3 = A(1,1)/A(2,1);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = A(2,1)/A(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G1 = [c -s 0 0 ; s c 0 0 ; 0 0 1 0 ; 0 0 0 1];
iter1 = G1*A

if (abs(iter1(3,1))>=abs(iter1(1,1)))
    temp3 = iter1(1,1)/iter1(3,1);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter1(3,1)/iter1(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G2 = [c 0 -s 0; 0 1 0 0; s 0 c 0; 0 0 0 1];
iter2 = G2*iter1

if (abs(iter2(3,2))>=abs(iter2(2,2)))
    temp3 = iter2(2,2)/iter2(3,2);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter2(3,2)/iter2(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G3 = [1 0 0 0; 0 c -s 0; 0 s c 0; 0 0 0 1];
iter3 = G3*iter2

if (abs(iter3(4,2))>=abs(iter3(2,2)))
    temp3 = iter3(2,2)/iter3(4,2);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter3(4,2)/iter3(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G4 = [1 0 0 0 ; 0 c 0 -s; 0 0 1 0; 0 s 0 c];
iter4 = G4*iter3

if (abs(iter4(4,3))>=abs(iter4(3,3)))
    temp3 = iter4(3,3)/iter4(4,3);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = iter4(4,3)/iter4(3,3);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G5 = [1 0 0 0; 0 1 0 0; 0 0 c -s; 0 0 s c];
iter5 = G5*iter4

b = [2; -4; 1; 3];
xSol = A\b

