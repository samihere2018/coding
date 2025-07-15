% % use this to check if the soltion of a system is unique
% syms x1 x2 x3 x4
% 
% eq1 = 4*x1 - sin(x2) - 1i*x3; %nonlinear,complex, unique
% eq2 = 5*x2 - x1^2 - cos(x3);
% eq3 = 6*x3 - exp(-x1) - x2 - 3;
% result = vpasolve(eq1,eq2,eq3,x1,x2,x3)

% eq3 = (x3-1)^2;
% eq1 = x1 - x3*i + (x3-1);
% eq2 = x2 + 2*i*x3 + (x3-1)*(x1-i);
% eq4 = x4 - 2*x3 + (x3-1)*(x1-i)*(x2+2*i);
% result = vpasolve(eq1,eq2,eq3,eq4,x1,x2,x3,x4)

% x1 = 1i;
% x2 = -2i;
% x3 = 1;
% x4 = 2;
% 
% eq3 = (x3-1)^2
% eq1 = x1 - x3*1i + (x3-1)
% eq2 = x2 + 2*1i*x3 + (x3-1)*(x1-1i)
% eq4 = x4 - 2*x3 + (x3-1)*(x1-1i)*(x2+2*1i)
% 
% q3 = 1
% q1 = x3*1i - (x3-1)
% q2 = - 2*1i*x3 - (x3-1)*(x1-1i)
% q4 = 2*x3 - (x3-1)*(x1-1i)*(x2+2*1i)
% 
% eq1 = x1^2 + sin(x2) + cos(x3) - (1 + sin(2) + cos(1i));
% eq2 = x2^3 + x1 + sin(x4) - (4+1+sin(2i));
% eq3 = x3^2 + exp(x1) - (1i^2 + exp(1));
% eq4 = x4^2 + cos(x1) - ((2i)^2+cos(1));
% result = vpasolve(eq1,eq2,eq3,eq4,x1,x2,x3,x4)

% eq1 = x1^2 + x3;
% eq2 = x3 + 1i*x1*x4 + x1*conj(x1);
% eq3 = x2 + 2i*x3;
% eq4 = x4 - x3^2 - 1;
% result = vpasolve(eq1,eq2,eq3,eq4,x1,x2,x3,x4)


% x1 = 1;
% x2 = 2;
% x3 = 1i;
% x4 = 2i;
% 
% % x1=1.7145778244017930257339025031103 - 0.44139838663282747619517128585971i
% % x2= 2.9257221288403056870518496510987 + 1.2056199124320976009348779164336i
% % x3=1.2475769276085365276860144883872 + 0.030825245012031017461867074832923i
% % x4=- 0.12385069175369832984146755131905 - 1.8214179990051771512933294860616i
% % % % % 
% eq1 = x1^2 + sin(x2) + cos(x3) - (1 + sin(2) + cos(1i))
% eq2 = x2^2 + x1 + sin(x4) - (4+1+sin(2i))
% eq3 = x3^2 + exp(x1) - (1i^2 + exp(1))
% eq4 = x4^2 + cos(x1) - ((2i)^2+cos(1))



syms x1 x2 y1 y2 z1 z2
eq1 = 4*x1 - sin(y1)*cos(y2) - z1 -1;
eq2 = 4*x2 - sin(y2)*cos(y1) - z2;
eq3 = -x1^2 - 2*x1*x2 + 5*y1 - cos(z1)*cos(z2) - 2;
eq4 = -x2^2 + 5*y2 + sin(z1)*sin(z2);
eq5 = -exp(-(x1+x2)) - y1 + 6*z1;
eq6 = -y2 + 6*z2 - 3;
result = vpasolve(eq1,eq2,eq3,eq4,eq5, eq6, x1,x2,y1, y2, z1, z2)