
%Homework #2 Problems 1-5
%=============================================
%#1
figure(1);
E0=10^4.4;
mag=[3.5:0.1:9.2];

joules=(10.^(1.5.*mag)).*E0;
KJ = joules./1000;

plot(mag,KJ);

mag = 6.4;
joules=(10.^(1.5.*mag)).*E0;
fprintf('The energy released in a 6.4 magnitude earth quake is: %d joules.\n', joules);
axis([3.5,9.2,0,1.5*10.^15]);
ylabel('KJ of Energy');
xlabel('Magnitude');
title('Richter Scale');

%=============================================
%_2 a
gc = 9.81;
t=1.3794;
v=9.81.*t.^2;
fprintf('The instaneous velocity of the ball as it hits the ground is: %d m/sec.\n', v);

%_2 b
figure(2)
original_height = 16.763
i=1:7
bounce(i) = (0.65.^i).*original_height
plot(0,original_height,'o');
hold on;
plot(i,bounce,'o');
grid on;
xlabel('Bounce Index');
ylabel('Height (in meters)');
title('Bouncing Ball');

%=============================================
%_3
#I=V/R
A=[1,-1,-1; 2,8,0; 0,-8,4];
B=[0;10;6];
I=inv(A)*B

%=============================================
%_4
c_side=10;
SA_cube=6.*(c_side.^2);
cube_rad=c_side./2;
V_cube=c_side.^3;
fprintf('The cube with sides %d cm has a surface of %d cm squared and a volume of %d cm cubed.\n',c_side,SA_cube,V_cube);
sphere_rad_SA=1/2.*sqrt(SA_cube./pi);
sphere_rad_V=(3.*V_cube./(4*pi)).^(1/3);
fprintf('A sphere with the same surface area would have a radius %d cm and a sphere with the same volume would have a radius %d cm.\n',sphere_rad_SA,sphere_rad_V);

%=============================================
%_5 a
figure(3)
J_gc=24.79;
t=0:0.05:6;
y40=-1/2*J_gc.*t.^2 +200*sind(40).*t;
plot(t,y40);
xlabel('Time (in seconds)');
ylabel('Height (in meters)');
title('Jupiter Projectile Launch');

%_5 b
TOF=(2*(200*sind(40)))./J_gc;
fprintf('The projectile is in the air for %d seconds before impact',TOF);

%__END__
