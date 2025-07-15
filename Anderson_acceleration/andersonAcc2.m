%%%%%%%% QR decomposition using Gram Schmidt (A 5-by-5 matrix)

A = [1+2i 2+1i 3+2i 1-4i 4+5i; 
     2+3i 3+4i 4+1i 5+2i 6+3i; 
     3+1i 4+2i 1+3i 3-4i 2-1i;
     2-3i 1-2i 4+3i 1-3i 2+5i;
     6+1i 3+5i 5-1i 1+1i 3-5i];

%deltaf_(i-1)
df = A(:,5);

%-------- Computing the columns of Q --------%
%Q(:,0) - should be known before using QRAdd_MGS
Q1 = (1.0/norm(A(:,1)))*A(:,1);

%Q(:,1) - should be known before using QRAdd_MGS
q2 = A(:,2) - dot(Q1,A(:,2))*Q1;
Q2 = (1.0/norm(q2))*q2;

%Q(:,2) -  should be known before using QRAdd_MGS
q3 = A(:,3) - dot(Q1,A(:,3))*Q1 - dot(Q2,A(:,3))*Q2;
Q3 = (1.0/norm(q3))*q3;

%Q(:,3) -  should be known before using QRAdd_MGS
q4 = A(:,4) - dot(Q1,A(:,4))*Q1 - dot(Q2,A(:,4))*Q2 - dot(Q3,A(:,4))*Q3;
Q4 = (1.0/norm(q4))*q4;

%Q(:,4) - what we expect from QRAdd_MGS (and the other variants)
q5 = A(:,5) - dot(Q1,A(:,5))*Q1 - dot(Q2,A(:,5))*Q2 - dot(Q3,A(:,5))*Q3 - dot(Q4,A(:,5))*Q4;
Q5 = (1.0/norm(q5))*q5;


%~~~~~~~~~~~~~~~ check: columns of Q are othronormal ~~~~~~~~~~~~~~~~~~~~~
Q1Q2 = dot(Q1,Q2);%orthogonal
Q1Q3 = dot(Q1,Q3);
Q1Q4 = dot(Q1,Q4);
Q1Q5 = dot(Q1,Q5);

Q2Q3 = dot(Q2,Q3);
Q2Q4 = dot(Q2,Q4);
Q2Q5 = dot(Q2,Q5);

Q3Q4 = dot(Q3,Q4);
Q3Q5 = dot(Q3,Q5);

Q4Q5 = dot(Q4,Q5);

normQ1 = norm(Q1);%unit vectors
normQ2 = norm(Q2);
normQ3 = norm(Q3);
normQ4 = norm(Q4);
normQ5 = norm(Q5);



%%%%%% -------- Computing the non-zero entries of R --------%
% ~~~~~~ first row
%R(0,0) - should be known before using QRAdd_MGS
R11 = dot(Q1,A(:,1));

%R(0,1) - should be known before using QRAdd_MGS
R12 = dot(Q1,A(:,2));

%R(0,2) - should be known before using QRAdd_MGS
R13 = dot(Q1,A(:,3));

%R(0,3) - should be known before using QRAdd_MGS
R14 = dot(Q1,A(:,4));

%R(0,4) - what we expect from QRAdd_MGS (and the other variants)
R15 = dot(Q1,A(:,5))


% ~~~~~~ second row
%R(1,1) - should be known before using QRAdd_MGS
R22 = dot(Q2,A(:,2));

%R(1,2) - should be known before using QRAdd_MGS
R23 = dot(Q2,A(:,3));

%R(1,3) - should be known before using QRAdd_MGS
R24 = dot(Q2,A(:,4));

%R(1,4) - what we expect from QRAdd_MGS (and the other variants)
R25 = dot(Q2,A(:,5))


% ~~~~~ third row
%R(2,2) - should be known before using QRAdd_MGS
R33 = dot(Q3,A(:,3));

%R(2,3) - should be known before using QRAdd_MGS
R34 = dot(Q3,A(:,4));

%R(2,4) - what we expect from QRAdd_MGS (and the other variants)
R35 = dot(Q3,A(:,5))


% ~~~~ fourth row
%R(3,3) - should be known before using QRAdd_MGS
R44 = dot(Q4,A(:,4));

%R(3,4) - should be known before using QRAdd_MGS
R45 = dot(Q4,A(:,5))

% ~~~~ fifth row
%R(4,4) - what we expect from QRAdd_MGS (and the other variants)
R55 = dot(Q5,A(:,5))
 






