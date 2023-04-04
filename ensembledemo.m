% This script is a demonstration of the power of a committee of neural
% network classifiers.  
% In this demo, all classifiers have the same number of hidden units 
% All classifiers are trained for the same number of iterations
% The only difference is the random number seed that determines the initial
% weights and the order of pattern presentations

niterations=40000; % number of training iterations for each neural network 
nhu=10;% number of hidden units
nclass=99; % number of classifiers
initrange = 5; % specifies range of network random initial weights
ensemout=[] ;
for ii=1:nclass
    n0(ii)=initnet3(2,nhu,1,initrange,initrange,123*ii);
    nf(ii)=bp3(n0(ii),trn,niterations,.05,0);
    acttst(ii)=forw3(nf(ii),tst);
    misclass(ii)=sum(abs(tst.tmat-(acttst(ii).out>.5)));
    ensemout=[ensemout,acttst(ii).out>.5];
end
vote=sum(ensemout,2)>nclass/2;
meshvote=reshape(vote,100,100);
ensemmiss=sum(abs(tst.tmat-vote))
sum(misclass)/nclass 
hold on
[xg yg]=meshgrid(linspace(-.7,.7,100));
contour(xg,yg,meshvote,[.5 .5],'k','LineWidth',2)
figure
boxplot(misclass)
hold on
plot([.9 1.1],[ensemmiss ensemmiss],'g','LineWidth',3)