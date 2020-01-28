%Chapter 4 problem 1
%===============================================================================
a = [15 ,3 ,22 ;3 ,8 ,5 ;14 ,3 ,82];
b = [1;5;6];
c = [12, 18, 5, 2];

d = a(:,end)

e = [b,d]

f = [b;d]

g = [a; c(1:3)]

h = [a(1,3), c(1,2), b(2,1)]

%problem 2
%===============================================================================
times = [0:2:24]';
THC1 = [84.3;86.4;85.2;87.1;83.5;84.8;85;85.3;85.3;85.2;82.3;84.7;83.6];
THC2 = [90;89.5;88.6;88.9;88.9;90.4;89.3;89.5;88.9;89.1;89.5;89.4;89.8];
THC3 = [86.7;87.6;88.3;85.3;80.3;82.4;83.4;85.4;86.3;85.3;89;87.3;87.2];
ThCouples = [times,THC1,THC2,THC3];

[THC1_max, row] = max(THC1);
fprintf('Thermocouple 1 has a maximum of %d which occurs at %d hours.\n',THC1_max,times(row))
[THC1_min, row] = min(THC1);
fprintf('Thermocouple 1 has a minimum of %d which occurs at %d hours.\n\n',THC1_min,times(row))

[THC2_max, row] = max(THC2);
fprintf('Thermocouple 2 has a maximum of %d which occurs at %d hours.\n',THC2_max,times(row))
[THC2_min, row] = min(THC2);
fprintf('Thermocouple 2 has a minimum of %d which occurs at %d hours.\n\n',THC2_min,times(row))

[THC3_max, row] = max(THC3);
fprintf('Thermocouple 3 has a maximum of %d which occurs at %d hours.\n',THC3_max,times(row))
[THC3_min, row] = min(THC3);
fprintf('Thermocouple 3 has a minimum of %d which occurs at %d hours.\n\n\n',THC3_min,times(row))

%problem 3
%===============================================================================
years = [1950:2012]';
ace = [243;137;87;104;113;199;54;84;121;77;88;205;36;118;170;84;145;122;35;158;34;97;28;43;61;73;81;25;62;91;147;93;29;17;71;88;36;34;103;135;91;34;75;39;32;228;166;40;182;177;116;106;65;175;225;248;79;72;145;51;165;126;133];
tropical_storms = [13;10;7;14;11;12;8;8;10;11;7;11;5;9;12;6;11;8;7;17;10;13;4;7;7;8;8;6;11;8;11;11;5;4;12;11;6;7;12;11;14;8;6;8;7;19;13;7;14;12;14;15;12;16;14;28;10;15;16;9;19;19;19];
hurricanes = [11;8;6;6;8;9;4;3;7;7;4;8;3;7;6;4;7;6;4;12;5;6;3;4;4;6;6;5;5;5;9;7;2;3;5;7;4;3;5;7;8;4;4;4;3;11;9;3;10;8;8;9;4;7;9;15;5;6;8;3;12;7;10];
major_hurricanes = [8;5;3;4;2;6;2;2;5;2;2;7;1;2;6;1;3;1;0;5;2;1;0;1;2;3;2;1;2;2;2;3;1;1;1;3;0;1;3;2;1;2;1;1;0;5;6;1;3;5;3;4;2;3;6;7;2;2;5;2;5;4;2];

ace_data = [years,ace,tropical_storms,hurricanes,major_hurricanes];

[ace_max, row] = max(ace);
fprintf('%d was the year with the highest ACE value (%d).\n',years(row),ace_max)

[TS_max, row] = max(tropical_storms);
fprintf('%d was the year with the most tropical storms (%d).\n',years(row),TS_max)

[H_max, row] = max(hurricanes);
fprintf('%d was the year with the most hurricanes (%d).\n',years(row),H_max)

[MH_max, row] = max(major_hurricanes);
fprintf('%d was the year with the most major hurricanes (%d).\n\n',years(row),MH_max)

%mean
value = mean(ace);
fprintf('The mean ACE value is: %d.\n',value)

value = mean(tropical_storms);
fprintf('The mean number of tropical storms is: %d.\n',value)

value = mean(hurricanes);
fprintf('The mean number of hurricanes is: %d.\n',value)

value = mean(major_hurricanes);
fprintf('The mean number of major hurricanes is: %d.\n\n',value)

%median
value = median(ace);
fprintf('The median ACE value is: %d.\n',value)

value = median(tropical_storms);
fprintf('The median number of tropical storms is: %d.\n',value)

value = median(hurricanes);
fprintf('The median number of hurricanes is: %d.\n',value)

value = median(major_hurricanes);
fprintf('The median number of major hurricanes is: %d.\n\n',value)

sortrows(ace_data, -2)

%problem 4
%===============================================================================
density = [13560, 1000];
pressure = [0:100]';
presPa = 1000.*pressure;
GC = 9.81;

height1 = presPa./(density(1).*GC);
height2 = presPa./(density(2).*GC);

height = [height1,height2]

%problem 5
%===============================================================================
temp = [100:10:1000]';
pressure = [100:10:1000]';
RC = 0.2870;

volume = (RC.*temp)./pressure
%problem 6
%===============================================================================
zeros(size(a))

zeros(size(b))

zeros(size(c))

%problem 7
%===============================================================================
default = magic(4)
AD_magic = [default(:,1), default(:,3), default(:,2), default(:,4)]

%rows
sum(AD_magic(1,:))
sum(AD_magic(2,:))
sum(AD_magic(3,:))
%columns
sum(AD_magic(:,1))
sum(AD_magic(:,2))
sum(AD_magic(:,3))
%diag
sum(diag(AD_magic))
sum(diag(flip(AD_magic)))