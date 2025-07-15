% use this to check if the soltion of a system is unique
syms x1 x2 x3 x4 x5 x6

eq1 = 4*x1 - sin(x2) - 1i*x3 - 1; %nonlinear,complex, unique
eq2 = 5*x2 - x1^2 - cos(x3) - 2i;
eq3 = 6*x3 - exp(-x1) - x2 - 3;
result = vpasolve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = x1 - x3*i + (x3-1);
% eq2 = x2 + 2*i*x3 + (x3-1)*(x1-i);
% eq3 = (x3-1)^2;
% eq4 = x4 - 2*x3 + (x3-1)*(x1-i)*(x2+2*i);
% eq5 = x5 - (x3+x1) + (x3-1)*(x1-i)*(x4-2);
% eq6 = x6 - (x4-x1) + (x3-1)*(x1-i)*(x4-2)*(x5-(1+i));
% result = vpasolve(eq1,eq2,eq3,eq4,eq5,eq6,x1,x2,x3,x4,x5,x6)
% result = solve(eq1,eq2,eq3,x1,x2,x3)
% result = vpasolve(eq1,eq2,eq3,x1,x2,x3)

% x1= -0.47625375787528865063317252624875;
%     x2= 2.1291252109056921150594080153905;
%     x3= -1.8787927948643328651251246420573;
% eq1 = x1^2 +  x2 + sin(x3) - 1.403 %nonlinear,complex, unique
% eq2 = x2^2 + x3 + cos(x1) - 3.5431
% eq3 = x3^2 + x1*x2 + tan(x1)-2
% result = solve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = 2*x1 - x2*x3 - 1 - 3i; %nonlinear, not unique
% eq2 = -x1 + 3*x2 - x3^2 - 1 + 4i;
% eq3 = -x1^2 - x2 + 4*x3 - 3 + 1i;
% result = solve(eq1,eq2,eq3,x1,x2,x3)

%
% eq1 = 3*x1 - cos(x3*(x2-1)) - 1/2; %nonlinear, not complex-valued, unique
% eq2 = x1^2 - 81*(x2-0.9)^2 + sin(x3) + 1.06;
% eq3 = exp(-x1*(x2-1)) + 20*x3 + (10*pi - 3)/3;
% result = solve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = x1^2 + x2 - (2+1i); %nonlinear, not unique
% eq2 = x2^2 + x3 - (2-2i);
% eq3 = x1 + x3^2 + (2+3i);
% % result = solve(eq1,eq2,eq3,x1,x2,x3)
% x1R = - 1.3347204269668261903538828826262;
% x1I = - 1.6699402623083763294738097660068;
% x2R = 1.527382053128913128060684620379;
% x2I = - 1.8392701928886137307913325635167;
% x3R = 1.4798398083871488066576595597078;
% x3I = 0.61853656694604582874820962103963;
% syms x1R x1I x2R x2I x3R x3I
% % % 
% eq1R = x1R^2 - x1I^2 + x2R + x3R - 2 ; %not unique
% eq1I = 1i*(2*x1R*x1I + x2I - x3I - 2);
% eq2R = x1R^2 + x1I^2 + x2R^2 - x2I^2 + x3R -5;
% eq2I = 1i*(2*x2R*x2I + x3I + 5);
% eq3R = x1R + x2R + x3R^2 - x3I^2 - 2;
% eq3I = 1i*(x1I-x2I+2*x3R*x3I-2);
% result = solve(eq1R,eq1I, eq2R,eq2I, eq3R,eq3I,x1R,x1I,x2R,x2I,x3R,x3I)

 % eq1R = sqrt(x1I^2-x2R-x3R+2.0)
 % eq1I = (1.0/(2.0*x1R))*(-x2I+x3I+2.0)
 % eq2R = sqrt(-(x1R^2) - (x1I^2) + x2I^2 -x3R + 5.0)
 % eq2I = (1.0/(2.0*x2R))*(-x3I-5.0)
 % eq3R = sqrt(-x1R-x2R+x3I+2.0)
 % eq3I = (1.0/(2.0*x3R))*(-x1I+x2I+2.0)

% eq1 = x1^2 + x2 + conj(x3) - (2+2i); %nonlinear, unique
% eq2 = x1*conj(x1) + x2^2 + x3 - (5-5i);
% eq3 = x1 + conj(x2) + x3^2 - (2+2i);
% result = vpasolve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = 4*x1 - sin(x2) - 1i*x3; %nonlinear,complex, unique
% eq2 = 5*x2 - x1^2 - cos(x3);
% eq3 = 6*x3 - exp(-x1) - x2 - 3;
% result = vpasolve(eq1,eq2,eq3,x1,x2,x3)



% eq1 = 4*x1 - x2 - 1i*x3 - 1; %linear,complex, unique
% eq2 = 5*x2 - x1 - x3 - 2i;
% eq3 = 6*x3 - x1 - x2 - 3;
% result = vpasolve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = 3*x1 - x2^2 - x3 - 1; %nonlinear, not unique
% eq2 = 3*x2 - x1^2 + x3^2 - 1i;
% eq3 = 3*x3 - x1*x2 - 2;
% result = solve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = 3*x1 -  x2 - x3 - (1+1i); %nonlinear, not unique
% eq2 = 3*x2 -  x1 -  x3 - (1-1i);
% eq3 = 3*x3 - x1-x2 - 2;
% result = solve(eq1,eq2,eq3,x1,x2,x3)

% eq1 = 6*x1 - 2*x2^2 - x3 - (1+1i); %nonlinear, not unique
% eq2 = 20*x2 - 5*x1^2 - 4*x3 - (1-1i);
% eq3 = 3*x3 - x1*x2 - 2;
% result = solve(eq1,eq2,eq3,x1,x2,x3)

% x1 = 0.28443101049564623195165005640626 + 0.27031686078053784493075885615066i;
% x2 = 0.16117132843380518414712630319204 + 0.42622240595675991157825031463513i;
% x3 = 0.64771494226506336822643156263549 + 0.037548771355881891823906126147366i;
% % 
% eq1 = 4*x1 - sin(x2) - 1i*x3 - 1 ;%nonlinear,complex, unique
% eq2 = 5*x2 - x1^2 - cos(x3) - 2i;
% eq3 = 6*x3 - exp(-x1) - x2 - 3;
% 
% x1R = 0.28443101049564623195165005640626
% x1I = 0.27031686078053784493075885615066
% 
% x2R = 0.16117132843380518414712630319204
% x2I = 0.42622240595675991157825031463513
% 
% x3R = 0.64771494226506336822643156263549
% x3I = 0.037548771355881891823906126147366
% syms x1R x1I x2R x2I x3R  x3I
% 
% 
% eq1R = 4*x1R - sin(x2R)*cosh(x2I) + x3I - 1;
% eq1I = 1i*(4*x1I - cos(x2R)*sinh(x2I) - x3R);
% eq2R = -(x1R)^2 + (x1I)^2 + 5*x2R - cos(x3R)*cosh(x3I);
% eq2I = 1i*(-2*x1R*x1I + 5*x2I + sin(x3R)*sinh(x3I) - 2);
% eq3R = -exp(-x1R)*cos(x1I) - x2R + 6*x3R - 3;
% eq3I = 1i*(exp(-x1R)*sin(x1I) - x2I + 6*x3I);
% 
% result = solve(eq1R,eq1I, eq2R, eq2I,eq3R ,eq3I, x1R,x2R,x3R, x1I, x2I, x3I)

