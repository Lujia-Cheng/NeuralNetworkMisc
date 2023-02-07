function [seq tr]=totalroutev2(hopact,pla)
% hopact is an activation pattern of a TSP (as in Hopfield & Tank)
% pla is a matrix listing xy coordinates Col 1 = UID Col 2,3 = xy 
nc=size(hopact,1) ;
for di=1:nc
  for dj=1:nc
    distmat(di,dj)=sqrt((pla(di,2)-pla(dj,2))^2+(pla(di,3)-pla(dj,3))^2);
  end
end
dmatch=prod(prod(double(size(hopact)==size(distmat)))) ;
binhmat=(hopact>0.1) ;
test1=(sum(sum(binhmat))==nc) ;
test2=prod(prod(abs(double((binhmat^nc-eye(size(hopact))<.1)))))<1 ;
if (dmatch~=1) tr = 'hopfield matrix dimensions must equal distance matrix dimensions' ;
%else if (test2) tr = 'hopfield matrix does not correspond to a route';
    else seq=binhmat'*(1:nc)' ;
        tr=0 ;
        for k=1:nc
            tr=tr+distmat(seq(k),seq(1+mod(k,nc))) ;
        end
    end
end
%end