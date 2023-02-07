function outm=mul4d2d(m4d,m2d)
newdim=prod(size(m2d));
m4d2=reshape(m4d,newdim,newdim) ;
m2d1=reshape(m2d,newdim,1);
penout=m4d2*m2d1 ;
outm=reshape(penout,size(m2d)) ;
end