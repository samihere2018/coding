%%%%%%%% QR decomposition using Gram Schmidt (A 3-by-3 matrix)
% 
% A = [1+2i 2+1i 3+2i; 
%      2+3i 3+4i 4+1i; 
%      3+1i 4+2i 1+3i];


A = [12 -51 4;
     6 167 -68;
     -4 24 -41 ];


%deltaf_(i-1)
df = A(:,3);

%-------- Computing the columns of Q --------%
%Q(:,0) - should be known before using QRAdd_MGS
Q1 = (1.0/norm(A(:,1)))*A(:,1);

%Q(:,1) - should be known before using QRAdd_MGS
q2 = A(:,2) - dot(Q1,A(:,2))*Q1;
Q2 = (1.0/norm(q2))*q2;

%Q(:,2) - what we expect from QRAdd_MGS (and the other variants)
q3 = A(:,3) - dot(Q1,A(:,3))*Q1 - dot(Q2,A(:,3))*Q2;
Q3 = (1.0/norm(q3))*q3;

%-------- Computing the non-zero entries of R --------%
%R(0,0) - should be known before using QRAdd_MGS
R11 = dot(Q1,A(:,1));

%R(0,1) - should be known before using QRAdd_MGS
R12 = dot(Q1,A(:,2));

%R(1,1) - should be known before using QRAdd_MGS
R22 = dot(Q2,A(:,2));

%R(0,2) - what we expect from QRAdd_MGS (and the other variants)
R13 = dot(Q1,A(:,3));

%R(1,2) - what we expect from QRAdd_MGS (and the other variants)
R23 = dot(Q2,A(:,3));

%R(2,2) - what we expect from QRAdd_MGS (and the other variants)
R33 = dot(Q3,A(:,3));

%check: columns of Q are othronormal

Q1Q2 = dot(Q1,Q2);%orthogonal
Q2Q3 = dot(Q2,Q3);
Q1Q3 = dot(Q1,Q3);

normQ1 = norm(Q1);%unit vectors
normQ2 = norm(Q2);
normQ3 = norm(Q3);
