function [estimates, model] = fitcurve_C5(C_exp, V_exp,cc)
% Call fminsearch with a random starting point.
start_point = cc;
model = @myfunc_bat1;
estimates = fminsearch(model, start_point);
% expfun accepts curve parameters as inputs, and outputs sse,
% the sum of squares error for A*exp(-lambda*xdata)-ydata,
% and the FittedCurve. FMINSEARCH only needs sse, but we want
% to plot the FittedCurve at the end.
    function [sse F]= myfunc_bat1(params)
%         xx=load('v_C_1C.mat');
%         V_exp=params;
%         C_exp=xx.v_C_1C(:,1);
        a=params;
        C=5;
        s=one_cycle_kokam_GA_new(a,C,C_exp(end),V_exp(1));
        T=[0:50:10000];
        for j=1:length(s)
            V_exp1 = interp1([1:length(V_exp)],V_exp,[1:0.1:length(V_exp)],'spline');
            C_exp1 = interp1([1:length(V_exp)],C_exp,[1:0.1:length(V_exp)],'spline');
            F.V=s(j).V;
            F.C=s(j).Cs;
            for i=1:s(j).z
                [c1 ind]=min(abs(s(j).Cs(1,i)-C_exp1));
                s(j).er(j,i)=abs(s(j).V(1,i)-V_exp1(ind))+(s(j).V(1,i)<0)*100;
            end
            for l=1:length(s(j).Rin)
                ee(l)=(sum(s(j).Rin(l)<0 || s(j).Rin(l)>0.02)).*(10^5)+(sum(s(j).Rin_2(l)<0 || s(j).Rin_2(l)>0.02))...
                    .*(10^5)+(sum(s(j).Cin_2(l)<0 || s(j).Cin_2(l)>0.0002)).*(10^5);
            end
            if(s(j).z)
                [c2 ind1]=min(abs(s(j).er(j,:)));
                e1=sum(s(j).er(j,:)).^2+sum(ee);
                sse(j)=e1;
            else
                sse(j)=100000;
            end
            
        end
    end
end