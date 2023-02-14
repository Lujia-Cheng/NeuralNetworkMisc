function lout=layersigpn(x,w,b)
lsz=size(x) ;
lll=b'*ones(lsz(1),1)'+w*x' ;
lout=sigpn(lll)';
end