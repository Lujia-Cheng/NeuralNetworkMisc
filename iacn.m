function finalact=iacn(extin,initact,conmat,dt,niter)
finalact=initact;
for k=1:niter
    finalact=iaciter(extin,finalact,conmat,dt);
end
end