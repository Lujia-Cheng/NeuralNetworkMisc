function netstruct=initnet3(n1,n2,n3,uamp,vamp,rs)
rng(rs) ;
netstruct.wih=uamp*(rand(n2,n1)-0.5) ;
netstruct.hbias=uamp*(rand(1,n2)-0.5) ;
netstruct.whout=vamp*(rand(n3,n2)-0.5) ;
netstruct.obias=vamp*(rand(1,n3)-0.5);
end