function E_oc=open_circuit_voltage_LA12(a,x,C,N,Vend,T)
% Find the open circuit voltage of a lead acid
% battery at any value of depth of discharge
% The depth of discharge value must be between
% 0 (fully charged) and 1.0 (flat).
if x<0
error('Depth of discharge <0');
end
if x > 1
error('Depth of discharge >1')
end
% See equation >2.10 in text.
E_oc = (Vend+a(:,9)-((a(:,1).*x-a(:,2).*(x.^2)+(1*a(:,3)).*(x.^3)-1*a(:,4).*(x.^4)...
    +1*a(:,5).*(x.^5)-1*a(:,6).*(x.^6)+1*a(:,7).*(x.^7)).*(1+0.01*a(:,8)*C+0.001*a(:,30)*(C^2)+0.0001*a(:,29)*C^3).*((a(:,25)*((T/25)-1).^2)+1)))*N;

% 
% E_oc = (Vend+a(:,9)-((1+a(:,1).*x-a(:,2).*(x.^2)+(1*a(:,3)).*(x.^3)-1*a(:,4).*(x.^4)...
%     +1*a(:,5).*(x.^5)-1*a(:,6).*(x.^6)+1*a(:,7).*(x.^7)).*(1+0.01*a(:,8)*C+0.001*a(:,30)*(C^2)+0.0001*a(:,29)*C^3).*((a(:,25)*((T/25)-1).^2)+(a(:,34)*((T/25)-1).^3)+1)))*N;
% 
