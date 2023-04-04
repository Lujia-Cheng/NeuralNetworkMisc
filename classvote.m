function [trin trclas allin allclas] = classvote(npts,rs)
% two dimensional classification artificial data generation
% d2d are input data
% clas is the target class (0 or 1)
% the output variables:
% trin:  2-D input for the training set
% trclas: classification for the output training set
% allin is 100x100 grid for testing ("exhaustive")
% allclas = the classification for the allin grid (exhaustive test)
% to generate training and test sets for bp3.m :
% [trn.smat trn.tmat tst.smat tst.tmat]=classvote(npts,rs)

rng(rs)
figure
dtx = 1.4*rand(1,npts)-.7;
dty = 1.4*rand(1,npts)-.7;
trin=[dtx',dty'];
thr = 0.252 ;

ctrs=[[-.5 .5];[-.5 -.5];[.5 -.5];[.5 .5]] ;
dk2=zeros(npts,4) ;

for k=1:4
    dk2(:,k)=sqrt((dtx-ctrs(k,1)).^2+(dty-ctrs(k,2)).^2) ;
end

trclas = (prod(dk2,2)<thr)+0 ;
kolr=[trclas,zeros(npts,1),1-trclas];
scatter(dtx,dty,100,kolr,'filled')
hold on
[xm ym]=meshgrid(linspace(-.7,.7,100));
dk2m=zeros(100,100,4);
for k=1:4
    dk2m(:,:,k)=sqrt((xm-ctrs(k,1)).^2+(ym-ctrs(k,2)).^2) ;
end
pfun=prod(dk2m,3);
contour(xm,ym,pfun,[thr,thr],'g-','LineWidth',3)
allclas=reshape(pfun<thr,10000,1);
allin(:,1)=reshape(xm,10000,1);
allin(:,2)=reshape(ym,10000,1);
end