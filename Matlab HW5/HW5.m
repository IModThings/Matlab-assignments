%problems 6.3,6.7,6.13
ans2life=42; %I get an error if I start with a function

%Problem 6.3
function FV = future_value(Vo, I, n)
  FV = Vo*(1+I).^n;
endfunction
value = future_value(1000,0.05,120)

%problem 6.7
function height = height(time)
  if(time <= 0)
    fprintf("Error: time must be greater than zero")
    return
  else
    height = -9.8/2*time.^2+125*time+500;
  endif
endfunction

time = [0:0.5:30];
height = height(time);
plot(time,height)
[maximum_height, maximum_time] = max(height);
maximum_time = maximum_time/2 %because interval of 0.5

%Problem 6.13
myfunction = @(x) -x.^2-5*x-3+exp(x);
x = [-5, 5];
fplot(myfunction, x);
minvalue = fminbnd(myfunction, -5,5)

  


