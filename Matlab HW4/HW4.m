%=========================Homework #4===================================
%problems 1, 3-6, 9, 11, 13, 16, 18, 25, 27,29, 31
clear all
close all
format short g
%=======================================================================

figure()
%Problem 1a
subplot(2,2,1)
x = [0:0.05:10];
y = exp(x);
plot(x,y);
title('y = e^x')
xlabel('X')
ylabel('Y')
%Problem 1b
subplot(2,2,2)
y = sin(x);
plot(x,y);
title('y = sin(x)')
xlabel('X')
ylabel('Y')
%Problem 1c
subplot(2,2,3)
a = 5;
b = 2;
c = 4;
y = a.*(x.^2)+b.*x+c;
plot(x,y);
title('y = ax^2+bx+c')
xlabel('X')
ylabel('Y')
%Problem 1d
subplot(2,2,4)
y = sqrt(x);
plot(x,y);
title('y = sqrt(x)')
xlabel('X')
ylabel('Y')

%=======================================================================
%Problem 3&4
figure()
x = [-pi:0.05:pi];
y1 = sin(x);
plot(x,y1, '--r')
hold on

y2 = sin(2*x);
plot(x,y2, '-b')

y3 = sin(3*x);
plot(x,y3, ':g')
hold off

%=======================================================================
%Problem 5
axis([-6,6])
legend('y1','y2','y3')
text(-5.75, 1.1, 'Various Sine Waves', 'FontSize', 16')
%=======================================================================
%Problem 6
function [horizontal,vertical] = get_distances(iV,t,theta)
  gc = 9.8;
  horizontal = t.*iV.*cos(theta);
  vertical = t.*iV.*sin(theta)-0.5.*gc.*t.^2;
endfunction
time = [0:0.05:20];
[h,v] = get_distances(100,pi/4,time);
figure()
plot(time,h)
figure()
plot(time,v)

%=======================================================================
%Problem 9
figure()
[h1,v1] = get_distances(100,pi/2,time);
plot(h1,v1,'--r')
hold on
[h2,v2] = get_distances(100,pi/4,time);
plot(h2,v2, '-g')
[h3,v3] = get_distances(100,pi/6,time);
plot(h3,v3,':m')
hold off
legend()

%=======================================================================
%Problem 11
figure()
force = [0, 2000, 4000, 6000, 7500, 8000, 8500, 9000, 9500, 10000];
length = [2, 2.0024, 2.0047, 2.007, 2.0094, 2.0128, 2.0183, 2.0308, 2.05, 2.075];
A = pi*(0.505/2).^2;
Olen = 2;
stress = force/A;
strain = (length - Olen)/Olen;
plot(strain, stress, 'color', 'black' , 'marker', 'o')
xlabel('Strain')
ylabel('Stress')
title('Strain vs Stress')
annotation("textarrow", [0.2,0.22], [0.85,0.71], "string", 'yield point')

%=======================================================================
%Problem 13
%{
um... well problem 1 didn't say not to use subplots and
because I dont like 15 different windows
I already used subplots in problem 1.
%}
%=======================================================================
%Problem 16
figure()
subplot(2,2,1)
x=[-pi:.01:pi]
y2=sin(4*x);
y1=sin(3*x);
polar(x,y1)
hold on
polar(x,y2)
hold off

subplot(2,2,2)
y3=1-sin(x)
polar(x, y3)

subplot(2,2,3)
theta=[pi/6:2/3*pi:4*pi];
r=ones(1,6);
polar(theta,r)
hold on
polar(-theta,r)
hold off

subplot(2,2,4)
theta=[0:pi/3:2*pi];
r=ones(1,7)
polar(theta, r);

%=======================================================================
%Problem 18
function transistors = moores_law(original_num, time)
  transistors = original_num*(2.^(time/2));
endfunction
function label_axis()
  xlabel('Year')
  ylabel('Transistor Number')
  grid on
endfunction
%a
t = [0:2:46];
year = [1965:2:2011];
trans = moores_law(30,t);
table = [year',trans']
%b
figure()
subplot(3,1,1)
plot(t,trans)
title('Rectangular')
label_axis()

subplot(3,1,2)
semilogx(t,trans)
title('X-Log')
label_axis()

subplot(3,1,3)
semilogy(t,trans)
title('Y-Log')
label_axis()

%Problem 25
figure()
x = randn(1,1000)*3.5+70;
hist(x)

%Problem 27
figure()
g = 9.8;
t = [0:0.05:20];
theta = pi/4;
Vo = 100;
Distance = t*Vo*sin(theta)-1/2*g*t.^2;
Velocity = Vo*sin(theta)-g*t;

plotyy(t, Distance, t, Velocity) %The equivalent of axisyy in Octave

%Problem 29
figure()
subplot(2,2,1) %I used 4 so everything is square
x = [0:pi/100:20*pi];
y = x.*sin(x);
z = x.*cos(x);

plot(x,y)

subplot(2,2,2)
polar(x,y)

subplot(2,2,3)
plot3(x,y,z)
xlabel('X'), ylabel('Y'), zlabel('Z')
title('Problem 29 3d plot')

%Problem 31
figure()
subplot(2,3,1)
x = [-5:0.5:5];
y = x;

X = meshgrid(x);
Y = meshgrid(y);
Z = sin(sqrt(X.^2+Y.^2));
mesh(Z)
subplot(2,3,2)
surf(Z)

subplot(2,3,3)
surf(Z)
shading interp

subplot(2,3,4)
surf(Z)
colormap(winter)
shading interp

subplot(2,3,5)
contour(Z)

subplot(2,3,6)
surfc(Z)
