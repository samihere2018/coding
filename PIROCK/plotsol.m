figure

format shorte

data=load('sol.dat');

ns=2;
j=1;
N=(size(data,2)-1)/ns;
solu=data(j,2:(N+1));
solv=data(j,(N+2):end);


errl2=norm([solu,solv])/sqrt(length([solu,solv]))
errinf=norm([solu,solv],'inf')

nn=sqrt(length(solu));
x=linspace(0,1-1/nn,nn);
y=linspace(0,1-1/nn,nn);
soluB=reshape(solu,nn,nn)';
solvB=reshape(solv,nn,nn)';

surf(repmat(x,nn,1),repmat(y',1,nn),soluB)
%shading faceted
xlabel('x_1')
ylabel('x_2')
zlabel('u')

figure
surf(repmat(x,nn,1),repmat(y',1,nn),solvB)
%shading faceted
xlabel('x_1')
ylabel('x_2')
zlabel('v')