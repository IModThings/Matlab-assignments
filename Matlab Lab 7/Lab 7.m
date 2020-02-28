%Task 1
t = [0:1:23];
temp = [9.2,9.6,9.0,7.7,6.8,6.0,5.9,4.3,7.2,8.9,9.2,10.2,10.9,10.6,10.6,10.7,10.3,8.6,8.2,8.0,8.8,7.1,7.5,7.5];

time_even = t(1:2:end-1);
time_odd = t(2:2:end);

temp_even = temp(1:2:end-1);
temp_odd = temp(2:2:end);

P = polyfit(time_even,temp_even,1);
temp_int_odd = polyval(P,time_odd);
MSE = sum((temp_int_odd - temp_odd).^2)/length(temp_odd);

temp = zeros(1,24);
temp((0:2:22)+1) = temp_even;
temp((1:2:23)+1) = temp_odd;
temp_init = zeros(1,24);
temp_init((0:2:22)+1) = temp_even;
temp_init((1:2:23)+1) = temp_int_odd;

figure(1)
plot(0:23,temp,'-b',0:23,temp_init,'-r',0:23,polyval(P,0:23),'-g');
title('Lab 7 Task 1')
xlabel('Time')
ylabel('Temperature (C)')
legend('Time','Interpolated','Polynomial fit');
MSE

%{
dew_point = [8.1,7.7,7.1,5.7,5.6,5.1,5.0,3.9,5.7,6.4,6.7,7.1,8.5,8.9,8.5,8.8,8.3,7.2,6.7,6.6,7.6,5.9,6.5,6.6];
relative_hum = [93,88,88,87,92,94,94,97,90,84,84,81,85,89,87,88,87,91,90,91,92,92,93,94];
wind_dir = [8,7,9,6,1,10,9,35,36,36,28,30,29,26,26,28,24,18,14,14,15,10,10,8];
wind_speed = [9,8,9,8,5,8,3,8,9,3,3,17,16,9,16,12,7,10,11,12,13,8,4,7];
visibility = [16.1,24.1,24.1,24.1,24.1,24.1,24.1,19.3,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1,24.1];
pressure = [101.15,101.17,101.17,101.13,101.15,101.16,101.16,101.19,101.22,101.23,101.24,101.27,101.25,101.25,101.25,101.31,101.32,101.37,101.43,101.48,101.54,101.58,101.61,101.64];
%}
%Task 2
MSE = zeros(1,9);
for N = 1:9
  P = polyfit(time_even, temp_even, N);
  temp_int_odd = polyval(P,time_odd);
  MSE(N) = sum((temp_int_odd - temp_odd).^2)/length(temp_odd);
endfor
figure(2)
plot(1:9, MSE);
title('Interpolating temp at odd hours')
xlabel('Polynomial Degree')
ylabel('Interpolated MSE')
MSE

%Task 3
temp_int = zeros(1,24);
temp_int((0:2:22)+1) = temp_even;

temp_int((1:2:23)+1) = temp_even;
MSE = sum((temp_int-temp).^2)/length(temp_odd);
figure(3)
plot(0:23,temp,'-b',0:23,temp_int,'-r');
title('Hourly temp variation')
xlabel('Time')
ylabel('Temp (C)')
legend('True','Nearest neighbor interpolation')
MSE

%Task 4
temp_int = zeros(1,24);
temp_int((0:2:22)+1)=temp_even;

for i = [1:2:21]
  temp_int(i+1)=(temp_int(i)+temp_int(i+2))/2;
endfor
temp_int(23+1) = temp_int(22+1);
MSE = sum((temp_int - temp).^2)/length(temp_odd);
figure(4)
plot(0:23,temp,'-b',0:23,temp_int,'-r');
title('Hourly temp Variation')
xlabel('Time')
ylabel('Temperature (C)')
legend('True','Local linear interpolation');
MSE

%Task 5
temp_int_odd = spline(time_even, temp_even, time_odd);
temp_int_odd(12) = temp_even(12);
MSE = sum((temp_int_odd - temp_odd).^2)/length(temp_odd);

temp_int = zeros(1,24);
temp_int(1:2:23) = temp_even;
temp_int(2:2:24) = temp_int_odd;
figure(5)
plot(0:23,temp,'-b',0:23,temp_int,'-r')
title('Hourly temp variation')
ylabel('degrees (C)')
legend('True','Cubic spline interpolation')
MSE
