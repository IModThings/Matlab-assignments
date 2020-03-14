%Chapter 8: 2, 4, 7, 10, 14, 16

clear
%Problem 2
t = [0:2:100];
height = 2.13*(t.^2)-0.0013*(t.^4)+0.000034*(t.^4.751);
flight = find(height > 0)

maximum = max(flight)
max_time = t(maximum)

plot(t,height)

axis([0,max_time])
title('Problem 2')
xlabel('height')
ylabel('time')

%Problem 4
gym1 = [9.821, 9.923, 9.624, 9.432, 9.534, 9.203];
gym2 = [9.7, 9.925, 9.83, 9.987, 9.354, 9.879];

x=find(gym1>gym2);
first_gym=length(x)
y=find(gym2>gym1);
second_gym=length(y)

first_gym_avg = mean(gym1)
second_gym_avg = mean(gym1)

%Problem 7
data = csvread('temp.dat');
hour = data(:,1);
data(:,1) = [];

[x,y]=find(data>85);
index = [x,y]


[x,y]=find(data<65);
index = [x,y]


maximum = max(data(:))
[x,y] = find(data==maximum);
index = [x,y]


%Problem 10
%data wont copy right and was not available online

%Problem 14
temp = input('Enter temp in fahrenheit: ');
if temp >= 80
  disp('Wear shorts')
elseif temp<80 & temp>60
  disp('its a beautiful day')
elseif(temp < 60)
  disp('Wear a coat')
endif

%Chapter 9: 6-8, 19
clear
%Problem 6&7
choice = input('Problem 6,7, or 8?: ')
switch(choice)
  case 6
    clear
    num1 = input('Enter first number: ');
    num2 = input('Enter second number: ');
    count = input('Enter required count: ');
    
    sequence(1) = num1;
    sequence(2) = num2;
    for i=3:count
      sequence(i) = sequence(i-2) + sequence(i-1);
    endfor
    sequence
  case 7
    clear
    num1 = input('Enter first number: ');
    num2 = input('Enter second number: ');
    count = input('Enter required count: ');
    
    sequence(1) = num1;
    sequence(2) = num2;
    while i<=count
      sequence(i) = sequence(i-2) + sequence(i-1);
      i = i+1;
    endwhile
    sequence
  case 8
    clear
    num1 = input('Enter first number: ');
    num2 = input('Enter second number: ');
    
    sequence(1) = num1;
    sequence(2) = num2;
    sequence(3) = num1+num2;
    i = 3;
    while abs(sequence(i)/sequence(i-1)-sequence(i-1)/sequence(i-2))>0.001
      i=i+1;
      sequence(i)=sequence(i-2)+sequence(i-1);
    endwhile
    sequence
endswitch

%probem 19
%sides=input('Input the number of sides: ')
figure()

for i=1:4
  subplot(2,2,i)
  polygon(i+2)
endfor
function polygon(sides)
  radians = (2*pi)./sides;
  r = ones(1, sides+1);
  theta = 0:radians:2*pi;
  polar(theta, r)
end

%__END__