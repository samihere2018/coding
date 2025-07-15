
A = [3 1 4 6 7; 2 -1 7 3 1; 10 6 2 1 -5; 4 -3 8 2 5; 0 -2 4 3 1]
if (abs(A(2,1))>=abs(A(1,1)))
    temp3 = A(1,1)/A(2,1);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = A(2,1)/A(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G1 = [c -s 0 0 0; s c 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
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
G2 = [c 0 -s 0 0 ; 0 1 0 0 0; s 0 c 0 0; 0 0 0 1 0; 0 0 0 0 1];
iter2 = G2*iter1

if (abs(iter2(4,1))>=abs(iter2(1,1)))
    temp3 = iter2(1,1)/iter2(4,1);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter2(4,1)/iter2(1,1);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G3 = [c 0 0 -s 0; 0 1 0 0 0; 0 0 1 0 0;s 0 0 c 0; 0 0 0 0 1];
iter3 = G3*iter2

if (abs(iter3(3,2))>=abs(iter3(2,2)))
    temp3 = iter3(2,2)/iter3(3,2);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter3(3,2)/iter3(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G4 = [1 0 0 0 0; 0 c -s 0 0; 0 s c 0 0; 0 0 0 1 0; 0 0 0 0 1];
iter4 = G4*iter3

if (abs(iter4(4,2))>=abs(iter4(2,2)))
    temp3 = iter4(2,2)/iter4(4,2);
    s = -1/sqrt(1+temp3^2)
    c = -s*temp3
else
    temp3 = iter4(4,2)/iter4(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G5 = [1 0 0 0 0; 0 c 0 -s 0; 0 0 1 0 0; 0 s 0 c 0; 0 0 0 0 1];
iter5 = G5*iter4

if (abs(iter5(5,2))>=abs(iter5(2,2)))
    temp3 = iter5(2,2)/iter5(5,2);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = iter5(5,2)/iter5(2,2);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G6 = [1 0 0 0 0; 0 c 0 0 -s; 0 0 1 0 0; 0 0 0 1 0; 0 s 0 0 c];
iter6 = G6*iter5

if (abs(iter6(4,3))>=abs(iter6(3,3)))
    temp3 = iter6(3,3)/iter6(4,3);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = iter6(4,3)/iter6(3,3);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G7 = [1 0 0 0 0; 0 1 0 0 0; 0 0 c -s 0; 0 0 s c 0; 0 0 0 0 1];
iter7 = G7*iter6

if (abs(iter7(5,3))>=abs(iter7(3,3)))
    temp3 = iter7(3,3)/iter7(5,3);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = iter7(5,3)/iter7(3,3);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G8 = [1 0 0 0 0; 0 1 0 0 0; 0 0 c 0 -s; 0 0 0 1 0; 0 0 s 0 c];
iter8 = G8*iter7

if (abs(iter8(5,4))>=abs(iter8(4,4)))
    temp3 = iter8(4,4)/iter8(5,4);
    s = -1/sqrt(1+temp3^2)
    c= -s*temp3
else
    temp3 = iter8(5,4)/iter8(4,4);
    c = 1/sqrt(1+temp3^2)
    s = -c*temp3
end
G9 = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 c -s; 0 0 0 s c];
iter9 = G9*iter8

b = [2; -4; 1; 4; 3];
xSol = A\b

