%Homework #1 Problems 2.4, 2.6, 2.7, 2.9, 2.11, 2.15, 2.17
%=============================================
%2.4 a
radius = 5;
A_circ=pi.*(radius.^2);
fprintf('The area of a circle with radius %d units is %d units squared.\n',radius,A_circ);

%b
radius = 10;
SA_sph=4*pi.*(radius.^2);
fprintf('The surface area of a sphere with radius %d ft is %d ft squared.\n',radius,SA_sph);

%c
radius = 2;
V_sph=4/3*pi.*(radius.^3);
fprintf('The volume of a sphere with radius %d ft is %d ft cubed.\n\n\n',radius,V_sph);

%=============================================
%2.6 a
shaft_dia = 1;
shaft_rad = shaft_dia./2;
height = 15;
sph_rad = 10;

V_shaft=(pi.*(shaft_rad.^2)).*height;
V_BB=4/3*pi.*(sph_rad.^3);
V_full=V_shaft+(2.*V_BB);

fprintf('The volume of the barbell is %d cm cubed.\n',V_full);

%b
SA_shaft = (pi.*shaft_dia).*height;
SA_BB = 4*pi.*(sph_rad.^2);
SA_BB = SA_BB-2.*(pi.*shaft_rad.^2);%this done to remove the part between the cylinder and spheres
SA_full = SA_shaft+ (2.*SA_BB);

fprintf('The surface area of the barbell is %d cm squared.\n\n\n',SA_full);

%=============================================
%2.7
P = 220;
n = 2;
V = 1;
a = 5.536;
b = 0.03049;
R = 0.08314472;
ID_temp = (P.*V)./(n.*R);
JDW_temp = ([P+(a.*n.^2)./(V.^2)].*[V-n.*b])./(n.*R);
fprintf('The temperature of the gas as calculated with the ideal gas law is %d degrees celsius. Calculated with the Diderik van der Waals method the temperature is %d degrees celsius.\n\n\n',ID_temp,JDW_temp);

%=============================================
%2.9 a
C=1e-6;
L=100*(1e-3);
R=800;
x = [(R./(2.*L)).^2]-[1./(L.*C)];
S_plus = [(-R)./(2.*L)] +sqrt(x);
S_minus = [(-R)./(2.*L)]-sqrt(x);
fprintf('the values s for a resistance of %d ohms is [ %d , %d ].\n\n\n',R,S_plus,S_minus);
plot(S_plus, S_minus);

%b
R=[100:10:1000];
x = [(R./(2.*L)).^2]-[1./(L.*C)];
S_plus = [-R./(2.*L)] +sqrt(x);
S_minus = [-R./(2.*L)]-sqrt(x);
plot(R,S_plus);
hold on
plot(R,S_minus);

%=============================================
%2.11
mpg=[36,32,44,26,50,33]
CO2 = 19.4.*(12000./mpg)

%=============================================
%2.15
fprintf('\n\nProblem 2.15\n');
r = [(1.59.*[10.^(-8)]), (1.68.*[10.^(-8)]), (2.44.*[10.^(-8)]), (2.82.*[10.^(-8)]), (1.*[10.^(-7)])]
dia = 0.001;
len = 2.00;
I = 120;
A = pi.*[(dia./2).^2];
P = (I.^2).*r.*(len/A)

%=============================================
%2.17
uni_GC = 6.673*[10^(-11)];
m1 = 6*10^24;
m2 = 7.4*10^22;
r = 3.9*10^8;
G_force = uni_GC.*[(m1.*m2)./(r.^2)];
fprintf('\n\nThe force exerted by the earth on the moon is %d.\n',G_force);

