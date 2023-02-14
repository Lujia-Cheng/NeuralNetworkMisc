function lout=nlayersig01(x,w,b,noise)
lsz=size(x) ;
lll=b'*ones(lsz(1),1)'+w*x'
% lll=b'+w*x' ;
%lout=sig01(lll)'+noise*(rand(lsz(1),1)-0.5) ;
lout=sig01(lll)';