%===========================LAB 6====================================
%Problem 1
clear all
close all
figure(1)
t = [0:0.01:0.6];
y =  3*sin(2*pi*10*t);
plot(t,y)

figure(2)
t = [0:0.001:100];
y = 3*sin(2*pi*10*t);
plot(t,y)

%Problem 2.
clear
figure(3)
t = [-2.5:0.05:4];
y = (t.^4)-3.5.*(t.^3)-2.5.*(t.^2)+14.*t;
plot(t,y,'-r')
grid on
title('Problem 2 Plot')
xlabel('Time (seconds)')
ylabel('Y value')

%Problem 3.
clear all
figure()
t = [0:0.05:2];
y = exp(-5*t)
plot(t,y)
title('Problem 3 Plot')
xlabel('Time (seconds)')
ylabel('Y value')

%Problem 4.
clear all
figure()
t = [0:0.025:0.8];
f1 = exp(-8*t);
f2 = exp(-10*t);
f3 = exp(-12*t);
plot(t,f1,'-r',t,f2,'-b',t,f3,'-g')
axis([0, 0.8])
title('Problem 4 Plot')
xlabel('Time (seconds)')
ylabel('Function value')
legend('f1','f2','f3')

%Problem 5.
clear all
figure()
x = [-3*pi/2:0.05:3*pi/2];
f = tan(x)
plot(x,f)
axis([-3*pi/2 3*pi/2 -10 10])

%Problem 6.
clear all
figure()
subplot(1,2,1)
t = [-2/5:0.01:2/5];
f1 = 3*sin(2*pi*5*t);
plot(t,f1, 'color', 'black')
axis([-2/5 2/5 -7 7])

subplot(1,2,2)
t = [-1.5/1000:0.00005:1.5/1000];
f2 = 5*sin(2*pi*1000*t);
plot(t,f2, 'color', 'magenta', 'marker', 'D')
axis([-1.5/1000 1.5/1000 -7 7])

%==========================END================================