%=============================================
%Part 1
%=============================================
figure (1);
subplot(2,2,1);
t=-10:10;
y=t.^2-4.*t+3;
plot(t,y,'LineStyle','-','Color','r');
grid on;

subplot(2,2,2);
t1=0:0.1*pi:2*pi;
y1=cos(4*t1);
plot(t1,y1,'LineStyle','--','Color','black');

subplot(2,2,3);
t2=0:0.05:1;
y2=exp(-12.*t2);
plot(t2,y2,'LineStyle','--','Color','mag');
grid on;

subplot(2,2,4);
t3=0:0.05:2;
y3=sin(2*pi.*t3).*sin(2.*pi*20.*t3);
plot(t3,y3,'LineStyle','-','Color','b');

%=============================================
%Part 2
%=============================================
figure (2);
force=[0,1650,3400,5200,6850,7750,8150,8500,8750,9000];
stress=force./(pi*0.2^2)
length=[2,2.003,2.006,2.009,2.012,2.015,2.03,2.06,2.09,2.12];
strain=length-2./2

plot(strain,stress,'-ko');
xlabel('strain (in/in)');
ylabel('Applied Stress (lbf/in^2)');
title('Stress vs. Strain');
annotation ("arrow",[0.1343 0.2051],[0.80 0.735]);
%=============================================
%Part 3
%=============================================
figure (3);
g=9.81;
t=0:1:20;
y10=-1/2*g.*t.^2 +90*sind(10).*t;
y25=-1/2*g.*t.^2 +90*sind(25).*t;
y45=-1/2*g.*t.^2 +90*sind(45).*t;
y65=-1/2*g.*t.^2 +90*sind(65).*t;
y85=-1/2*g.*t.^2 +90*sind(85).*t;

plot(t,y10)
axis([0,20,0,500])
hold on
plot(t,y25)
plot(t,y45)
plot(t,y65)
plot(t,y85)

legend({'10','25','45','56','85'})
xlabel('time (s)')
ylabel('projectile height (m)')

printf('__END__')
