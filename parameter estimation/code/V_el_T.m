function [Vo Rin Rin_2 Cin_2]=V_el_T(a,b,x,C,V1,n,I,deltaT,T)
Rin = ((a(10)+a(11).*x+10*a(12).*(x.^2)).*(1+0.01*a(19)*C+0.001*a(20)*(C^2)+0.0001*a(31)*(C^3))...
    .*(0.01*b(:,1)*((T/25)-1)+0.01*b(:,2)*((T/25)-1).^2+0.01*b(:,3)*((T/25)-1).^3+0.01*b(:,4)*((T/25)-1).^4+1))/10000; % Internal resistance, eq 2.9
Rin_2=((a(13)+(10*a(14).*x)+10*a(15).*(x.^2)).*(1+0.01*a(21)*C+0.001*a(22)*(C^2)+0.0001*a(32)*(C^3))...
    .*(0.01*b(:,5)*((T/25)-1)+0.01*b(:,6)*((T/25)-1).^2+0.01*b(:,7)*((T/25)-1).^3+0.01*b(:,8)*((T/25)-1).^4+1))/10000;
Cin_2=((a(16)+(10*a(17).*x)+10*a(18).*(x.^2)).*(1+0.01*a(23)*C+0.001*a(24)*(C^2)+0.0001*a(33)*(C^3))...
    .*(0.01*b(:,9)*((T/25)-1)+0.01*b(:,10)*((T/25)-1).^2+0.001*b(:,11)*((T/25)-1).^3+0.001*b(:,12)*((T/25)-1).^4+1))/10000000;
if(n==1)
    Vo=I*Rin_2.*(1-exp(-deltaT./(Cin_2.*Rin_2)))+I*Rin;
else
    Vo=(V1(:,n-1)-I*Rin_2).*(exp(-deltaT./(Cin_2.*Rin_2)))+I*Rin_2+I*Rin;
end
end


% Rin = (((a(:,10)+(10*a(:,11).*x)+100*a(:,12).*(x.^2))+(a(:,13)*C+a(:,14)*(C^2))).*(a(:,28).*exp(a(:,29)*abs(T-25)-a(:,30)*(T-25))))/1000; % Internal resistance, eq 2.9
% Rin_2=(((a(:,15)+(a(:,16).*x)+100*a(:,17).*(x.^2))+(a(:,18)*C+a(:,19)*(C^2))).*(a(:,25).*exp(a(:,26)*abs(T-25)-a(:,27)*(T-25))))/1000;
% Cin_2=((10*a(:,20)+(a(:,21).*x)+10*a(:,22).*(x.^2))+(a(:,23)*C+a(:,24)*(C^2)))/1000000;
