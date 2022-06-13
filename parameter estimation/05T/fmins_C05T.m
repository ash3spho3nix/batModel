xdata = C_exp; 
ydata = V_exp;
T=40;
[estimates, model] = fitcurve_C05T(xdata,ydata,par(1,:),T);
figure(11);
plot(C_exp, V_exp, '*')
hold on
[sse, FittedCurve] = model(estimates);
FittedCurve.C(end+1)=C_exp(end);
FittedCurve.V(end+1)=V_exp(end);

plot(FittedCurve.C,FittedCurve.V, 'r')
 
xlabel('xdata')
ylabel('f(estimates,xdata)')
title(['Fitting to function ', func2str(model)]);
legend('data', 'fit using func')
hold off