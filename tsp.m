figure
nloc=6; %this is the number of cities in your TSP trial
inhib=5; %this is the magnitude of the inhibition in the network
loc=rand(2,nloc) %this line can be commented if you want to run the
% program with the SAME set of locations with a new random number for the
% constraint satisfaction routine

d=pdist(loc'); %calculates the distance between cities
dm=squareform(d) %this converts the list of distances to a matrix
scatter(loc(1,:),loc(2,:),300,'r','filled') %scatter plot of locations
hold on
hopwts=hopfieldwts(nloc,inhib,dm); %computes the 4D array(n by n by n by n)
apattern=iacn(zeros(nloc,nloc),.4*rand(nloc,nloc)-.2,hopwts,.05,20000)
%the line above runs the IAC process on the distance mtx

route=(apattern>.9); %creates a boolean mtx (0,1) (creates a LOGICAL var)
clist=[(1:nloc);loc]; %a set of ints as row 1, with loc coordinates below 
[s t] = totalroutev2(route,clist') %interprets the route mtx as a sequence
plot(loc(1,[s',s(1)]),loc(2,[s',s(1)]),'k','LineWidth',2) %plots the path