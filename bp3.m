function finalnet=bp3(net0,patstr,niter,eta,nlev,rs)
rng(rs) ;
netk=net0;
for i=1:niter
    netk=cyc3(netk,patstr,eta,nlev) ;
end
finalnet=netk;