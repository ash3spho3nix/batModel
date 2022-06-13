% y = 1+0.3*x^2
% y = B*X
% X=[1 x x*2];
clc
clear
x=[2:100];
y=zeros(1,length(x));

for i =1:length(x)
    y(i)=10-0.5*(cos(i));
end
% %y = 10+0.2x^2-2*x^3 + 0.1*sin(x) 
% y = B*X
% z = (10+0.2x^2 + 0.1*sin(x))(1+2*t+0.4*t^2+10*exp(t))
% z= (A*X)(C*T)


X=[ones(length(x),1) x' (x.^2)'  (x.^3)' (sin(x))' (cos(x))' log(x)' (exp(x))' (1./log(x))']; % (exp(kT/alpha)-1)
B=(inv(X'*X))*(X');
B1=B*y'