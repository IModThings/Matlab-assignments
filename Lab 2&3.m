%% Question 1
%Vectors x and y are of equal length with integer values between [1, 10]
xy = round(1 + (10 - 1).*rand(randi([50 100], 1), 2));
x = xy(:,1);
y = xy(:,2);
l=length(y)
i = [1:l]';
z1 = [(-1).^i].*[((x.^3)+cos(y))./(1+(x.*y).*sqrt(1+log(x)))]

%% Question 2
odd = 1:2:9999;
even = 2:2:10000;
SeriesSum=sum(1./odd-1./even);


%% Question 3
%Generate an MxM matrix X. For part iv), X must have an even number of rows
%and columns.
M = randi([20 40], 1);
M = M + mod(M,2);
X = magic(M);

A=X(1:2:end-1,2:2:end-1)
B=X(2:end-1,2:end-1)

F=[42,21,7,1
  63,36,6,3
  12,15,8,2
  31,13,5,2]
  
diag(F,1)
C=[diag(X,1)',diag(X,-1)']

%% Question 4
load('data.mat');
plot(t,V)
title('Capacitor Voltage');
xlabel('time (ms)','FontSize',18);
ylabel('voltage (V)','FontSize',18);
axis([0,11,0,6]);
set(gca,'FontSize',14);

%% Question 5
fprintf('Problem Five=========================\n')
t_i = [2.003, 7, 0.45];
V_i = getValues(V,t,t_i)
  
%% Question 6
%Generate an MxNxP matrix Y with integer values between [-10, 10]
M = randi([5 10], 1);
N = randi([5 10], 1);
P = randi([20 30], 1);
Y = round(-10 + (10 - (-10)).*rand(M, N, P));
[M,N,P]=size(Y)
w=10:10:10*P;
w=reshape(w,1,1,P)
W=repmat(w,[M,N,1])
Y_scaled=Y.*W

%% Question 7
load('student_grades.mat')
L2=length(StudentGrades)
for ii=1:L2
  credithours=StudentGrades(ii).grades{:,2}
  grades=StudentGrades(ii).grades{:,3}
  cgpa=sum(grades)/sum(credithours);
  StudentGrades(ii).cgpa=cgpa;
  end

%% Save Outputs
load('rngSeed.mat')
save('outputs.mat', 'seriesSum', 'A', 'B', 'C', 'V_i', 'Y_scaled', 'StudentGrades')