%Chapter 8: 2, 4, 7, 10, 14, 16

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
hour = data(:,1)
data = [data(:,2),data(:,3),data(:,4)];

[x,y]=find(data<65);
index = [x,y];



%Chapter 9: 6-8, 19
