function err= myfunc_bat_C3(a)
xx=load('v_C_3C.mat');
V_exp=xx.v_C_3C(:,2);
C_exp=xx.v_C_3C(:,1);
C=3;
s=one_cycle_kokam_GA_new(a,C,C_exp(end),V_exp(1));
T=[0:50:10000];
for j=1:length(s)
    V_exp1 = interp1([1:length(V_exp)],V_exp,[1:0.1:length(V_exp)],'spline');
    C_exp1 = interp1([1:length(V_exp)],C_exp,[1:0.1:length(V_exp)],'spline');

    for i=1:s(j).z
        [c1 ind]=min(abs(s(j).Cs(1,i)-C_exp1));
        if(i==1)
            s(j).er(j,i)=abs(s(j).V(1,i)-V_exp1(ind))*10+(s(j).V(1,i)<0)*100;
        elseif(i==s(j).z)
            s(j).er(j,i)=abs(s(j).V(1,i)-V_exp1(ind))*10+(s(j).V(1,i)<0)*100;
        else
            s(j).er(j,i)=abs(s(j).V(1,i)-V_exp1(ind))+(s(j).V(1,i)<0)*100 ;
        end
    end
    for l=1:length(s(j).Rin)
        ee(l)=(sum(s(j).Rin(l)<0 || s(j).Rin(l)>0.02)).*(10^5)+(sum(s(j).Rin_2(l)<0 || s(j).Rin_2(l)>0.02))...
        .*(10^5)+(sum(s(j).Cin_2(l)<0 || s(j).Cin_2(l)>0.0002)).*(10^5);
    end
    if(s(j).z)
        [c2 ind1]=min(abs(s(j).er(j,:)));
        e1=sum(s(j).er(j,:)).^2+sum(ee);
        err(j)=e1;
    else
        err(j)=100000;
    end
    
end
end