function NumOfStages3(lambda, dt)
% =========================================================================
% Description: computes the correct number of stages given a desired 
%             step size and dominant eigenvalue (real or complex)
% =========================================================================
x_val = real(lambda);
y_val = imag(lambda);
x_s = dt * x_val;
y_s = dt * y_val;

if (x_val>=0)
    s=2;
    betaS = (s+4)*(s-1)/3;
    alphaS = sqrt(1.5 * betaS); %if s==2, p = 1.5
    
else
    %beta = -4x^2 / ( 4x + y^2/(alpha^2/beta) )
    %given that beta must be positive, the denominator cannot be >=0
    if (abs(x_s) <= abs(y_s)^2.0 / (4.0 * 1.2434134152701))
        error("Beta must be positive, hence it denominator must be negative!")
    end
    s = 2;
    betaS = (s+4)*(s-1)/3;
    alphaS = sqrt(1.5 * betaS); %if s==2, p = 1.5
    ellispe_cond = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;

    while (ellispe_cond > 1)
        s = s + 2; %we want s even
        if (s==4)
            p = 0.666666862117036;
        elseif (s==6)
            p = 0.886356042378929;
        elseif (s==8)
            p =  1.00591707469166;
        elseif (s==10)
            p = 1.07555148548799;
         elseif (s==12)
            p = 1.11903250586559;
        elseif (s==14)
            p = 1.14779460500269;
        elseif (s==16)
            p = 1.16773175990816;
        elseif (s==18)
            p = 1.1820869742728;
        elseif (s==20)
            p = 1.19274615821016;
        elseif (s==22)
            p = 1.20087960041174;
        elseif (s==24)
            p = ----------------;
        elseif (s==26)
            p = ----------------;
        elseif (s==28)
            p = ----------------;
        elseif (s==30)
            p = ----------------;
        elseif (s==32)
            p = ----------------;
        elseif (s==34)
            p = ----------------;
        elseif (s==36)
            p = ----------------;
        elseif (s==38)
            p = ----------------;
        elseif (s==40)
            p = ----------------;
        elseif (s==42)
            p = ----------------;
        elseif (s==44)
            p = ----------------;
        elseif (s==46)
            p = ----------------;
        elseif (s==48)
            p = ----------------;
        elseif (s==50)
            p = ----------------;
        elseif (s==52)
            p = ----------------;
        elseif (s==54)
            p = ----------------;
        elseif (s==56)
            p = ----------------;
        elseif (s==58)
            p = ----------------;
        elseif (s==60)
            p = ----------------;
        elseif (s==62)
            p = ----------------;
        elseif (s==64)
            p = ----------------;
        elseif (s==66)
            p = ----------------;
        elseif (s==68)
            p = ----------------;
        elseif (s==70)
            p = ----------------;
        elseif (s==72)
            p = ----------------;
        elseif (s==74)
            p = ----------------;
        elseif (s==76)
            p = ----------------;
        elseif (s==78)
            p = ----------------;
        elseif (s==80)
            p = ----------------;
        elseif (s==82)
            p = ----------------;
        elseif (s==84)
            p = ----------------;
        elseif (s==86)
            p = ----------------;
        elseif (s==88)
            p = ----------------;
        elseif (s==90)
            p = ----------------;
        elseif (s==92)
            p = ----------------;
        elseif (s==94)
            p = ----------------;
        elseif (s==96)
            p = ----------------;
        elseif (s==98)
            p = ----------------;
        elseif (s==100)
            p = ----------------;
        elseif (s==102)
            p = ----------------;
        elseif (s==104)
            p = ----------------;
        elseif (s==106)
            p = ----------------;
        elseif (s==108)
            p = ----------------;
        elseif (s==110)
            p = ----------------;
        elseif (s==112)
            p = ----------------;
        elseif (s==114)
            p = ----------------;
        elseif (s==116)
            p = ----------------;
        elseif (s==118)
            p = ----------------;
        elseif (s==120)
            p = ----------------;
        elseif (s==122)
            p = ----------------;
        elseif (s==124)
            p = ----------------;
        elseif (s==126)
            p = ----------------;
        elseif (s==128)
            p = ----------------;
        elseif (s==130)
            p = ----------------;
        elseif (s==132)
            p = ----------------;
        elseif (s==134)
            p = ----------------;
        elseif (s==136)
            p = ----------------;
        elseif (s==138)
            p = ----------------;
        elseif (s==140)
            p = ----------------;
        elseif (s==142)
            p = ----------------;
        elseif (s==144)
            p = ----------------;
        elseif (s==146)
            p = ----------------;
        elseif (s==148)
            p = ----------------;
        elseif (s==150)
            p = ----------------;
        elseif (s==152)
            p = ----------------;
        elseif (s==154)
            p = ----------------;
        elseif (s==156)
            p = ----------------;
        elseif (s==158)
            p = ----------------;
        elseif (s==160)
            p = ----------------;
        elseif (s==162)
            p = ----------------;
        elseif (s==164)
            p = ----------------;
        elseif (s==166)
            p = ----------------;
        elseif (s==168)
            p = ----------------;
        elseif (s==170)
            p = ----------------;
        elseif (s==172)
            p = ----------------;
        elseif (s==174)
            p = ----------------;
        elseif (s==176)
            p = ----------------;
        elseif (s==178)
            p = ----------------;
        elseif (s==180)
            p = ----------------;
        elseif (s==182)
            p = ----------------;
        elseif (s==184)
            p = ----------------;
        elseif (s==186)
            p = ----------------;
        elseif (s==190)
            p = ----------------;
        elseif (s==192)
            p = ----------------;
        elseif (s==194)
            p = ----------------;
        elseif (s==196)
            p = ----------------;
        elseif (s==198)
            p = ----------------;
        elseif (s==170)
            p = ----------------;
        elseif (s==172)
            p = ----------------;
        elseif (s==174)
            p = ----------------;
        elseif (s==176)
            p = ----------------;
        elseif (s==178)
            p = ----------------;
        elseif (s==180)
            p = ----------------;
        elseif (s==182)
            p = ----------------;
        elseif (s==184)
            p = ----------------;
        elseif (s==186)
            p = ----------------;
        elseif (s==188)
            p = ----------------;
        elseif (s==190)
            p = ----------------;
        elseif (s==192)
            p = ----------------;
        elseif (s==194)
            p = ----------------;
        elseif (s==196)
            p = ----------------;
        elseif (s==198)
            p = ----------------;
        elseif (s==200)
            p = ----------------;
        elseif (s==202)
            p = ----------------;
        elseif (s==204)
            p = ----------------;
        elseif (s==206)
            p = ----------------;
        elseif (s==208)
            p = ----------------;
        elseif (s==210)
            p = ----------------;
        elseif (s==212)
            p = ----------------;
        elseif (s==214)
            p = ----------------;
        elseif (s==216)
            p = ----------------;
        elseif (s==218)
            p = ----------------;
        elseif (s==220)
            p = ----------------;
        elseif (s==222)
            p = ----------------;
        elseif (s==224)
            p = ----------------;
        elseif (s==226)
            p = ----------------;
        elseif (s==228)
            p = ----------------;
        elseif (s==230)
            p = ----------------;
        elseif (s==232)
            p = ----------------;
        elseif (s==234)
            p = ----------------;
        elseif (s==236)
            p = ----------------;
        elseif (s==238)
            p = ----------------;
        elseif (s==240)
            p = ----------------;
        elseif (s==242)
            p = ----------------;
        elseif (s==244)
            p = ----------------;
        elseif (s==246)
            p = ----------------;
        elseif (s==248)
            p = ----------------;
        elseif (s==250)
            p = ----------------;
        elseif (s>250 && mod(s,2)==0)
            p = ----------------;
        end
        betaS = (s+4)*(s-1)/3;
        alphaS = sqrt(p * betaS); 
        ellispe_cond = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s/ alphaS) ^ 2.0;
    end
end
s_final = s;
disp("Total number of stages: " + s_final);
RKG2_stabReg(s_final, alphaS);
hold on;
plot(dt*real(lambda), dt*imag(lambda), 'k*', 'MarkerSize', 12, 'LineWidth', 1.5)
hold on
dim = [0.145, 0.825, 0.3, 0.1];
str = {[ 'dt = ', num2str(dt) ]; [ 'lambda = ', num2str(lambda) ]; ['number of stages = ', num2str(s_final) ]};
annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', 'BackgroundColor', 'white', 'FontSize', 10);
hold off;
end


% -------------------------------------------------------------------------
function RKG2_stabReg(s, alpha_s)
% This function plots the stability region for the RKG2 scheme in 
% "Super-time-stepping schemes for parabolic equations with boundary " + ...
% conditions" by Skaras et.al (2021)
% s = number of stages which 
% The scheme is able to take super time steps in proportion to the number of
% stages squared.
% Author: Sylvia Amihere

if (s<=0)
    error('Number of stages must be a positive integer.');
end

% calculate the extent of the stability region
% z = -2/w1
zmax = -2 * (s + 4) * (s - 1) / 6;
xmin = zmax * 1.1;               
xmax = max(5, abs(zmax) * 0.05); 
ymax = abs(zmax) * 0.5;          
ymin = -ymax;

% compute the paramters in the stabilty region formula
w_1 = 6 / ( (s+4) * (s-1) );
b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;

N = 1000;
[X,Y] = meshgrid(linspace(xmin,xmax,N), linspace(ymin,ymax,N));
Z = X + 1i * Y;

% recurrence relation for RKG2 method
W = 1 + w_1 * Z;

C32_prev2 = ones(size(Z));
C32_prev1 = 2 * (3/2) * W;

if (s==1)
    C_s = C32_prev1;
else
    for k = 2:s
    C_current = (1/k) * (W .*(2*k + 1) .*C32_prev1 - (k + 1) .*C32_prev2);
    C32_prev2 = C32_prev1;
    C32_prev1 = C_current;
    end
    C_s = C_current;
end

% stability polynomial
R_s = a_s + b_s * C_s;

figure;
hold on; grid on;

% plot the stability region
% this draws the x and y axes showing the origin
xline(0, 'k-', "LineWidth", 1);
yline(0, 'k-', "LineWidth", 1);

contour(X, Y, abs(R_s), [1+eps 1+eps], 'b-', "LineWidth", 2); %note that |R(z)|<=1
axis([xmin xmax ymin ymax]);

%add the ellipse
beta_s = (s+4)*(s-1)/3;
t = linspace(0, 2*pi, 5000);
x_t = -beta_s/2 * cos(t) - beta_s/2;
y_t = alpha_s * sin(t) + 0;
plot(x_t, y_t, 'r--', "LineWidth", 1)


title(sprintf('RKG2 stability region with %d stages', s), 'FontSize', 12);
xlabel('real(z)', 'FontSize', 12);
ylabel('imag(z)', 'FontSize', 12);
hold off;

end

