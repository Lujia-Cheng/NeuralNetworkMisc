function hmtx=hopfieldwts(nc,mag,distances)
% nc = number of cities
% mag = magnitude of constraint (usually large)
% matrix is [target (city, position), source (target, position) ]
hmtx=zeros(nc,nc,nc,nc) ;
mdist=max(max(distances)) ;
nsd=10.0 ;
%revdist=10*(mdist-distances+1).*(mdist-distances+1)/(mdist*mdist) ;
%revdist=0.1+10*exp(-distances.*distances/(mdist*mdist/(nsd*nsd))) ;
%revdist=(mdist*mdist)./(0.1+distances.*distances) ;
revdist=min(mag/2,.01*exp(mdist./(10*eye(nc)+distances)))

for j=1:nc
    hmtx(j,:,j,:)=mag*(eye(nc)-1) ;
    hmtx(:,j,:,j)=mag*(eye(nc)-1) ;
end
for j=2:nc 
    for k=1:(j-1)
    % for each distance in the matrix distances
        for m1=1:nc
            m2=1+mod(m1,nc) ;
            hmtx(j,m1,k,m2) = revdist(j,k) ;
            hmtx(k,m1,j,m2) = revdist(j,k) ;
            hmtx(j,m2,k,m1) = revdist(j,k) ;
            hmtx(k,m2,j,m1) = revdist(j,k) ;
        end
    end
end
end