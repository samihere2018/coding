function solMat = GramSchmidt_Alg(A)
[r, c] = size(A);
solMat = zeros(r,c);
y1 = A(:,1);
solMat(:,1) = (1/norm(y1))*y1;
sum_vec = zeros;
for j = 2:c
    for i = 1 : j-1
    yvec = A(:,j) - dot(A(:,j), solMat(:,i))*solMat(:,1);

