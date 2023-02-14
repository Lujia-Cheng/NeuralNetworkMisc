function lout=nlayersigpn(x,w,b,noise)
lsz=size(x) ;
% lll=b'*ones(lsz(1),1)'+w*x'
bb=repmat(b',1,lsz(1)) ;
lll=bb+w*x' ;
lout=sigpn(lll)'+noise*(rand(size(lll'))-0.5) ;