function newstruct=cyc3(nstruct,pstruct,dt,noi)
newstruct=nstruct;
szs=size(pstruct.smat);
patk=ceil(szs(1)*rand());
activity=forw1p3(nstruct,pstruct,patk,noi);
odelt=(pstruct.tmat(patk,:)-activity.out); %output deltas
hdelt=0.5*(nstruct.whout'*odelt').*(1+activity.hid').*(1-activity.hid');%hid deltas
%adjust weights and biases
newstruct.whout=newstruct.whout+dt*odelt'*activity.hid;
newstruct.obias=newstruct.obias+dt*odelt ;
newstruct.wih=newstruct.wih+dt*hdelt*activity.stim;
newstruct.hbias=newstruct.hbias+dt*hdelt' ;
end