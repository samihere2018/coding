figure
format shorte

data=load('sol.dat');

N=size(data,2);
x=linspace(0+1/N,1,N+1);
xx=x(2:end);

plot(xx,data)
xlabel('x');
ylabel('u');