function lout=layersig01(x,w,b)
lsz=size(x) ;
lll=b'*ones(lsz(1),1)'+w*x' ;
lout=sig01(lll)';