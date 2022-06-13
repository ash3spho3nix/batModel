clear
%_______________________________________________________
% I. Setup the GA
ff='myfunc_bat_C2'; % objective function
npar=33; % number of optimization variables
hi_r=10*ones(1,9);
hi_V=10*ones(1,9);
hi_c=5*ones(1,6);
hi_t=1*ones(1,4);
hi_c1=5*ones(1,5);
hi=[hi_V hi_r hi_c hi_t hi_c1];
% hi(16:17)=2*hi(16:17);
hi(9)=0.5;
lo=zeros(1,npar);
%lo(8:9)=-0.5*hi(8:9);
% lo(25:28)=-0.05*hi(25:28);

%_______________________________________________________
% II. Stopping criteria
clc
tic();
day=clock;
disp('_________________________________________');
disp('_____Genetic algorithm modified by_______');
disp('____________Vishal Sharma________________');
disp('_________________________________________');
disp(datestr(datenum(day(1),day(2),day(3),day(4),day(5),day(6)),0))
disp(['optimized function is ' ff])
maxit=500; % max number of iterations
mincost=-9999999; % minimum cost
%_______________________________________________________
% III. GA parameters
popsize=16; % set population size
mutrate=.15; % set mutation rate
selection=0.5; % fraction of population
% kept
nbits=16; % n4umber of bits in each
% parameter
Nt=nbits*npar; % total number of bits
% in a chormosome
keep=floor(selection*popsize); % #population members
% that survive
%_______________________________________________________
% Create the initial population
iga=0; % generation counter
% initialized
pop=round(rand(popsize,Nt)); % random population of
% 1s and 0s
par=gadecode(pop,lo,hi,nbits); % convert binary to
% % continuous values
% if(~exist('nums2.txt'))
%     
% else
%     fid=fopen('nums2.txt','r');
%     A = fscanf(fid,'%f');
%     fclose(fid);
%     a1=ones(1,nbits/4)'*A';
%     par(1:pop/4,:)=a1;
% end

cost=feval(ff,par); % calculates population
% cost using ff
[cost,ind]=sort(cost); % min cost in element 1
par=par(ind,:);pop=pop(ind,:); % sorts population with
% lowest cost first
minc(1)=min(cost); % minc contains min of
% population
meanc(1)=mean(cost); % meanc contains mean
% of population
%_______________________________________________________
% Iterate through generations
%h = waitbar(0,'Computing...');
while iga<maxit && cost(1)>0.001
    iga=iga+1; % increments generation counter
    %_______________________________________________________
    % Pair and mate
    M=ceil((popsize-keep)/2); % number of matings
    prob=flipud([1:keep]'/sum([1:keep]));% weights
    % chromosomes based
    % upon position in
    % list
    odds=[0 cumsum(prob(1:keep))']; % probability distribution function
    pick1=rand(1,M); % mate #1
    pick2=rand(1,M); % mate #2
    % ma and pa contain the indicies of the chromosomes
    % that will mate
    ic=1;
    while ic<=M
        for id=2:keep+1
            if pick1(ic)<=odds(id) & pick1(ic)>odds(id-1)
                ma(ic)=id-1;
            end % if
            if pick2(ic)<=odds(id) & pick2(ic)>odds(id-1)
                pa(ic)=id-1;
            end % if
        end % id
        ic=ic+1;
    end % while
    %_______________________________________________________
    % Performs mating using single point crossover
    ix=1:2:keep; % index of mate #1
    xp=ceil(rand(1,M)*(Nt-1)); % crossover point
    pop(keep+ix,:)=[pop(ma,1:xp) pop(pa,xp+1:Nt)];
    % first offspring
    pop(keep+ix+1,:)=[pop(pa,1:xp) pop(ma,xp+1:Nt)];
    % second offspring
    %_______________________________________________________
    % Mutate the population4
    nmut=ceil((popsize-1)*Nt*mutrate); % total number
    % of mutations
    mrow=ceil(rand(1,nmut)*(popsize-1))+1; % row to mutate
    mcol=ceil(rand(1,nmut)*Nt); % column to mutate
    for ii=1:nmut
        pop(mrow(ii),mcol(ii))=abs(pop(mrow(ii),mcol(ii))-1);
    end % ii
    %_______________________________________________________
    % The population is re-evaluated for cost
    par(2:popsize,:)=gadecode(pop(2:popsize,:),lo,hi,nbits);
    % decode
    cost(2:popsize)=feval(ff,par(2:popsize,:));
    %_______________________________________________________
    % Sort the costs and associated parameters
    [cost,ind]=sort(cost);
    par=par(ind,:); pop=pop(ind,:);
    %_______________________________________________________
    % Do statistics for a single nonaveraging run
    minc(iga+1)=min(cost);
    meanc(iga+1)=mean(cost);
    %_______________________________________________________
    % Stopping criteria
    if iga>maxit || cost(1)<mincost
        break
    end
    [iga cost(1)];
    if(mod(iga,10)==0)
        disp(['iteration : ' num2str(iga) ', cost : ' num2str(cost(1))]);
    end
end %iga
%_______________________________________________________
% Displays the output
% fid=fopen('exp_c1_new.txt','w');
% fprintf(fid,'%f \n',par(1,:));
% fclose(fid);


format short g
disp(['popsize = ' num2str(popsize) ' mutrate = ' num2str(mutrate)]);
disp(['Number of parameters = ' num2str(npar)]);
disp(['#generations=' num2str(iga) ' best cost=' num2str(cost(1))])
disp('best solution')
disp(num2str(par(1,:)))
disp('binary genetic algorithm')
disp(['each parameter represented by ' num2str(nbits) ' bits'])
figure(24)
iters=0:length(minc)-1;
plot(iters,minc,iters,meanc,'-.');
xlabel('generation');ylabel('cost');
text(0,minc(1),'best');text(1,minc(2),'population average')
disp('_________________________________________');
xx=load('v_C_2C.mat');
V_exp=xx.v_C_2C(:,2);
C_exp=xx.v_C_2C(:,1);
C=2;
s=one_cycle_kokam_GA_new(par(1,:),C,C_exp(end),V_exp(1));
figure(25);
plot(s.Cs,s.V,'g');
hold on;
plot(C_exp,V_exp,'r');
hold off;
legend('simulated','experimental');
xlabel('Capacity');
ylabel('Voltage');
toc();