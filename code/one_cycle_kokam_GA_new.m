function s=one_cycle_kokam_GA_new(a,C,Cend,Vend)
[r c]=size(a);
I=53*C;
T=25;
tt=5000;
% This corresponds to 1001 values. We form four more arrays,
% each also with 1001 elements, and all with initial values
% of zero. Dod(n) is used to store values of the depth of
% discharge, V(n) stores voltage values, CR(n)and CS(n)
% store values of the charge, in Amphours, removed from the
% battery and supplied by the battery.
CR=zeros(r,tt); % Charged removed from electrodes,
% corrected using Peukert coefficient.
DoD=zeros(r,tt); % Depth of discharge, start off fully
% charged.
V=zeros(r,tt); % Battery voltage at each time step
V_1=zeros(r,tt);
CS=zeros(r,tt); % Charge supplied by the battery in Ah
% We now set some constants for the experiment
NoCells=1; % 5 cell battery
Capacity=53; % This is the normal 1 h rated capacity of the
% battery
k=1.1042; % Peukert coefficient, not much greater than 1.
deltaT = 5; % Take 10 second time steps, OK for con I.
% Calculated values
%V_el(a,x,V1,n,I,deltaT)
[V11 Rin Rin_2 Cin_2]=V_el(a,0,C,V_1,1,I,deltaT,T);
s.Rin=Rin;s.Rin_2=Rin_2;s.Cin_2=Cin_2;
V_1(:,1)=V11;
Co=Cend/0.99;
PeuCap = ((Capacity/2)^k)*2; % See equation 2.12
% Starting voltage set outside loop
V(:,1) = open_circuit_voltage_LA12(a,0,C,NoCells,Vend,T) - V_1(:,1); % Equ 2.1
for n=2:tt
    CR(:,n) = CR(:,n-1) + (((I)* deltaT)/3600); % Equation 2.17
    DoD(:,n) = CR(:,n)/Co; % Equation 2.19
    for j=1:r
        if DoD(j,n)>1
            DoD(j,n)=1;
        end
    end
    [V11 Rin Rin_2 Cin_2]=V_el(a,DoD(:,n),C,V_1,n,I,deltaT,T);
    V_1(:,n)=V11;
    V(:,n)=open_circuit_voltage_LA12(a,DoD(:,n),C,NoCells,Vend,T)-V_1(:,n);
    % We will say that the battery is "dead" if the
    % depth of discharge exceeds 99%
    for j=1:r
        if DoD(j,n)>0.99
            V(j,n)=0;
        end
    end
    % We now calculate the real amphours given out by the
    % battery. This uses the actual current, NOT Peukert
    % corrected.
    for j=1:r
        if V(j,n)>0
            CS(j,n)=CS(j,n-1)+ ((I*deltaT)/3600); % Equation 2.18
        else
            CS(j,n)=CS(j,n-1);
        end
    end
end

for j=1:r
    V_del=[0 diff(V(j,:))/deltaT];
    kk=0;
    for i=1:length(V(j,:))
        if(kk<4)
            if(~(V_del(i)==0 && V(j,i)==0))
                V1(i)=V(j,i);
                CS1(i)=CS(j,i);
            else
                kk=kk+1;
            end
        end
    end
    s(j).V=V1;
    s(j).Cs=CS1;
    s(j).z=length(V1);
    
end
end