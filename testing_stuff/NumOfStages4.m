function NumOfStages4(lambda, dt)
% function [step_size, s_final] = NumOfStages4(lambda, dt)
% =========================================================================
% Description: computes the correct number of stages given a desired 
%             step size and dominant eigenvalue (real or complex)
% =========================================================================
x_val = real(lambda);
y_val = imag(lambda);
x_s = dt * x_val;
y_s = dt * y_val;
original_dt = dt;

if (x_val>=0)
    s=2;%Prof Reynolds: we have to consider a better option for when real(lambda)>=0)
    betaS = (s+4)*(s-1)/3;
    alphaS = sqrt(1.5 * betaS); %if s==2, p = 1.5
    ellipse_num = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;

    % update RKG2 parameters with final s to compute absolute value of the stability polynomial 
    w_1 = 6 / ( (s+4) * (s-1) );
    b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
    a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;
 
else
    %beta = -4x^2 / ( 4x + y^2/(alpha^2/beta)). beta must be positive, hence its denominator cannot be >=0
    if (y_val ~=0 && dt >= (-4 * x_val * 1.243)/(y_val^2))
        disp("Beta must be positive (its denominator must be negative), hence dt will be reduced!")
        dt_limit = (-4 * x_val * 1.243)/(y_val^2); %dt cannot be more than or equal to this value
        dt = 0.9 * dt_limit; %using a safety factor of 10 to reduce dt
        x_s = dt * x_val;
        y_s = dt * y_val;
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
            p = 1.20721110854699;
        elseif (s==26)
            p = 1.21223436129572;
        elseif (s==28)
            p = 1.21629249416185;
        elseif (s==30)
            p = 1.21961291659623;
        elseif (s==32)
            p = 1.22237287716341;
        elseif (s==34)
            p = 1.22467271370713;
        elseif (s==36)
            p = 1.22661843903752;
        elseif (s==38)
            p =  1.22828372072296;
        elseif (s==40)
            p = 1.22971762392395;
        elseif (s==42)
            p = 1.23095376311019;
        elseif (s==44)
            p =  1.23204592185081;
        elseif (s==46)
            p = 1.23299673841393;
        elseif (s==48)
            p = 1.23381918806151;
        elseif (s==50)
            p =  1.2345655082005;
        elseif (s==52)
            p =1.23522350032188;
        elseif (s==54)
            p = 1.23582427074961;
        elseif (s==56)
            p =  1.23635038753495;
        elseif (s==58)
            p =  1.23683161957876;
        elseif (s==60)
            p = 1.23726004279213;
        elseif (s==62)
            p =  1.23768022566093;
        elseif (s==64)
            p = 1.23801177578055;
        elseif (s==66)
            p =  1.23833806508942;
        elseif (s==68)
            p =  1.23867539598647;
        elseif (s==70)
            p = 1.23889829834677;
        elseif (s==72)
            p = 1.23915210073551;
        elseif (s==74)
            p =  1.23938296749114;
        elseif (s==76)
            p = 1.2395985215177;
        elseif (s==78)
            p = 1.23985852403103;
        elseif (s==80)
            p = 1.23998179484846;
        elseif (s==82)
            p = 1.24015150213853;
        elseif (s==84)
            p = 1.24032114440415;
        elseif (s==86)
            p = 1.24046334724575;
        elseif (s==88)
            p = 1.24059315590939;
        elseif (s==90)
            p = 1.24076778216979;
        elseif (s==92)
            p = 1.24086922766824;
        elseif (s==94)
            p = 1.24099351174557;
        elseif (s==96)
            p = 1.24106743431147;
        elseif (s==98)
            p = 1.24122640841603;
        elseif (s==100)
            p = 1.24136531010333;
        elseif (s==102)
            p =  1.2414164845312;
        elseif (s==104)
            p = 1.24149603408724;
        elseif (s==106)
            p = 1.24160133361197;
        elseif (s==108)
            p = 1.24171988945459;
        elseif (s==110)
            p = 1.24170618040095;
        elseif (s==112)
            p = 1.24172622616025;
        elseif (s==114)
            p = 1.2418474629446;
        elseif (s==116)
            p = 1.2419228971378;
        elseif (s==118)
            p = 1.24191599818162;
        elseif (s==120)
            p = 1.24208742018258;
        elseif (s==122)
            p = 1.24202598660105;
        elseif (s==124)
            p = 1.24213664266389;
        elseif (s==126)
            p = 1.24219372996336;
        elseif (s==128)
            p = 1.24215832745555;
        elseif (s==130)
            p =  1.2422822060307;
        elseif (s==132)
            p = 1.24240796809872;
        elseif (s==134)
            p = 1.24232510493446;
        elseif (s==136)
            p = 1.24232122016402;
        elseif (s==138)
            p = 1.24236807573927;
        elseif (s==140)
            p = 1.24244175686881;
        elseif (s==142)
            p = 1.24252281635447;
        elseif (s==144)
            p = 1.24259639459708;
        elseif (s==146)
            p = 1.24265231205243;
        elseif (s==148)
            p =  1.24268513378723;
        elseif (s==150)
            p = 1.24269420319586;
        elseif (s==152)
            p = 1.24268364748267;
        elseif (s==154)
            p = 1.24266235207614;
        elseif (s==156)
            p = 1.24264390533284;
        elseif (s==158)
            p = 1.24264651563522;
        elseif (s==160)
            p = 1.24269289883793;
        elseif (s==162)
            p =  1.24281014196176;
        elseif (s==164)
            p =  1.2430295417404;
        elseif (s==166)
            p = 1.24286447587361;
        elseif (s==168)
            p = 1.24276413205367;
        elseif (s==170)
            p = 1.2428107766727;
        elseif (s==172)
            p = 1.24305087563145;
        elseif (s==174)
            p = 1.24294990197305;
        elseif (s==176)
            p = 1.24282841917145;
        elseif (s==178)
            p = 1.24298565202217;
        elseif (s==180)
            p = 1.24309177075329;
        elseif (s==182)
            p = 1.24287967437769;
        elseif (s==184)
            p = 1.24305948663443;
        elseif (s==186)
            p = 1.24308184575052;
        elseif (s==188)
            p = 1.2429288200245;
        elseif (s==190)
            p = 1.24330640525937;
        elseif (s==192)
            p =  1.24298406537601;
        elseif (s==194)
            p = 1.24310855450976;
        elseif (s==196)
            p = 1.24313626836571;
        elseif (s==198)
            p = 1.24303185141699;
        elseif (s==200)
            p = 1.24331366396832;
        elseif (s==202)
            p = 1.24301987290156;
        elseif (s==204)
            p = 1.24346254677709;
        elseif (s==206)
            p = 1.24303419055957;
        elseif (s==208)
            p = 1.24354793719767;
        elseif (s==210)
            p = 1.24305484184357;
        elseif (s==212)
            p = 1.24355401992934;
        elseif (s==214)
            p = 1.24308057659697;
        elseif (s==216)
            p = 1.24348434519018;
        elseif (s==218)
            p = 1.24312887454407;
        elseif (s==220)
            p = 1.24336178577456;
        elseif (s==222)
            p = 1.24323573095832;
        elseif (s==224)
            p =  1.24322825018524;
        elseif (s==226)
            p = 1.24345521947075;
        elseif (s==228)
            p =  1.24314416267193;
        elseif (s==230)
            p =  1.24373992344695;
        elseif (s==232)
            p = 1.24318772259035;
        elseif (s==234)
            p = 1.24337493939663;
        elseif (s==236)
            p = 1.24345396637401;
        elseif (s==238)
            p =  1.24318307444957;
        elseif (s==240)
            p =  1.24374529766776;
        elseif (s==242)
            p =  1.24328253664899;
        elseif (s==244)
            p =  1.24329417539986;
        elseif (s==246)
            p =  1.24380605171368;
        elseif (s==248)
            p = 1.2432331769067;
        elseif (s==250)
            p = 1.24341341527008;
        elseif (s>250 && mod(s,2)==0)
            p = 1.243;
        end
        betaS = (s+4)*(s-1)/3;
        alphaS = sqrt(p * betaS); 
        ellispe_cond = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s/ alphaS) ^ 2.0;
    end
    % update RKG2 parameters with final s to compute absolute value of the stability polynomial 
    w_1 = 6 / ( (s+4) * (s-1) );
    b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
    a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;
    ellipse_num = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;
end

% step_size = dt;
s_final = s;

% ------------------------------------------------------------------------------------
% Use lambda, final s and dt to compute the absolute value of the stability polynomial
z_pt = x_s + 1i * y_s;
w_pt = 1 + w_1 * z_pt;

C32_p2 = 1;
C32_p1 = 2 * (3/2) * w_pt;

for k = 2:s_final
Cc = (1/k) * (w_pt * (2*k + 1) * C32_p1 - (k + 1) * C32_p2);
C32_p2 = C32_p1;
C32_p1 = Cc;
end
absRs = abs(a_s + b_s * Cc);
% ------------------------------------------------------------------------------------

disp("stages = " + s_final + ", final step size = " + dt + ", |R_s(dt*lambda)| = " + absRs + ", ellipse-value = " + ellipse_num);
RKG2_stabReg(s_final, alphaS);
hold on;
plot(dt*real(lambda), dt*imag(lambda), 'k*', 'MarkerSize', 12, 'LineWidth', 1.5)
hold on;
dim = [0.145, 0.825, 0.3, 0.1];
if (dt~=original_dt)
    dt_label = [ 'dt (original) = ', num2str(original_dt), ',  dt (modified) = ', num2str(dt) ];
else
    dt_label = [ 'dt (original) = ', num2str(dt) ];
end
str = {dt_label; [ 'lambda = ', num2str(lambda) ]; ['number of stages = ', num2str(s_final) ]; ['|R_s(dt*lambda)| = ', num2str(absRs) ]; ['ellipse-value = ', num2str(ellipse_num) ]};
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
ymax = abs(zmax) * 1.0; %increase the value after abs(zmax) of you do not
% want any part of the stability region to be cut off
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

%add the region where the scheme will not work (where the denominator of
%beta is not negative). This region is independent of the number of stages
%and only dependent on p=1.243 because this is the value large stage values
%converge to.
p_max = 1.243; %the maximum value of p = alpha^2/beta, large stages converge to thsi value
yy = linspace(ymin, ymax, 400);
xx = -(yy.^2) / (4.0 * p_max);
fill([xx, xmax*ones(1, 400)], [yy, fliplr(yy)], [0.6 0.6 0.6], 'FaceAlpha', 0.3, 'EdgeColor', 'none');
plot(xx, yy, 'k:', 'LineWidth', 1.2);

title(sprintf('RKG2 stability region with %d stages', s), 'FontSize', 12);
xlabel('Re(z)', 'FontSize', 12);
ylabel('Im(z)', 'FontSize', 12);
hold off;

end


%%%% to check if another number of stages would have worked for a certain dt and lambda use the code below

% lambda = -100 + 2i;
% dt = 0.5;
% 
% s = 10; p_value =  1.07555148548799;
% betaS = (s+4)*(s-1)/3; alphaS = sqrt(p_value * betaS);
% w_1 = 6 / ( (s+4) * (s-1) );
% b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
% a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;
% z_pt = x_s + 1i * y_s;
% w_pt = 1 + w_1 * z_pt;
% C32_p2 = 1;
% C32_p1 = 2 * (3/2) * w_pt;
% for k = 2:s
% Cc = (1/k) * (w_pt * (2*k + 1) * C32_p1 - (k + 1) * C32_p2);
% C32_p2 = C32_p1;
% C32_p1 = Cc;
% end
% absRs = abs(a_s + b_s * Cc);
% ellipse_num = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;
% RKG2_stabReg(s, alphaS);
% hold on;
% plot(dt*real(lambda), dt*imag(lambda), 'k*', 'MarkerSize', 12, 'LineWidth', 1.5);
% hold on;
% dim = [0.145, 0.825, 0.3, 0.1];
% str = {[ 'dt = ', num2str(dt) ]; [ 'lambda = ', num2str(lambda) ]; ['number of stages = ', num2str(s) ]; ['|R_s(dt*lambda)| = ', num2str(absRs) ]; ['ellipse-value = ', num2str(ellipse_num) ]};
% annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', 'BackgroundColor', 'white', 'FontSize', 10);
% hold off;
% title(sprintf('s=%d: |R_s|=%.6f: ellipse-cond = %.6f', s, absRs, (x_s/(betaS/2)+1)^2+(y_s/alphaS)^2));
% 
% %s=11 stages
% s = 11; p_value =  0.926497818908938;
% betaS = (s+4)*(s-1)/3; alphaS = sqrt(p_value * betaS);
% w_1 = 6 / ( (s+4) * (s-1) );
% b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
% a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;
% z_pt = x_s + 1i * y_s;
% w_pt = 1 + w_1 * z_pt;
% C32_p2 = 1;
% C32_p1 = 2 * (3/2) * w_pt;
% for k = 2:s
% Cc = (1/k) * (w_pt * (2*k + 1) * C32_p1 - (k + 1) * C32_p2);
% C32_p2 = C32_p1;
% C32_p1 = Cc;
% end
% absRs = abs(a_s + b_s * Cc);
% ellipse_num = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;
% RKG2_stabReg(s, alphaS);
% hold on;
% plot(dt*real(lambda), dt*imag(lambda), 'k*', 'MarkerSize', 12, 'LineWidth', 1.5);
% hold on;
% dim = [0.145, 0.825, 0.3, 0.1];
% str = {[ 'dt = ', num2str(dt) ]; [ 'lambda = ', num2str(lambda) ]; ['number of stages = ', num2str(s) ]; ['|R_s(dt*lambda)| = ', num2str(absRs) ]; ['ellipse-value = ', num2str(ellipse_num) ]};
% annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', 'BackgroundColor', 'white', 'FontSize', 10);
% hold off;
% title(sprintf('s=%d: |R_s|=%.6f: ellipse-cond = %.6f', s, absRs, (x_s/(betaS/2)+1)^2+(y_s/alphaS)^2));
% 
% %s=12 stages
% s = 12; p_value =  1.11903250586559;
% betaS = (s+4)*(s-1)/3; alphaS = sqrt(p_value * betaS);
% w_1 = 6 / ( (s+4) * (s-1) );
% b_s = ( 4 * (s-1)* (s+4) ) / ( 3 * s * (s+1) * (s+2) * (s+3) );
% a_s = 1 - ( (s+1) * (s+2) / 2) * b_s;
% z_pt = x_s + 1i * y_s;
% w_pt = 1 + w_1 * z_pt;
% C32_p2 = 1;
% C32_p1 = 2 * (3/2) * w_pt;
% for k = 2:s
% Cc = (1/k) * (w_pt * (2*k + 1) * C32_p1 - (k + 1) * C32_p2);
% C32_p2 = C32_p1;
% C32_p1 = Cc;
% end
% absRs = abs(a_s + b_s * Cc);
% ellipse_num = (x_s/(betaS/2.0) + 1.0)^2.0 + (y_s / alphaS)^2.0;
% RKG2_stabReg(s, alphaS);
% hold on;
% plot(dt*real(lambda), dt*imag(lambda), 'k*', 'MarkerSize', 12, 'LineWidth', 1.5);
% hold on;
% dim = [0.145, 0.825, 0.3, 0.1];
% str = {[ 'dt = ', num2str(dt) ]; [ 'lambda = ', num2str(lambda) ]; ['number of stages = ', num2str(s) ]; ['|R_s(dt*lambda)| = ', num2str(absRs) ]; ['ellipse-value = ', num2str(ellipse_num) ]};
% annotation('textbox', dim, 'String', str, 'FitBoxToText', 'on', 'BackgroundColor', 'white', 'FontSize', 10);
% hold off;
% title(sprintf('s=%d: |R_s|=%.6f: ellipse-cond = %.6f', s, absRs, (x_s/(betaS/2)+1)^2+(y_s/alphaS)^2));
% 
% 
