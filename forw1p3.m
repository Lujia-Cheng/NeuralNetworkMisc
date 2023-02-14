function netact=forw1p3(netwk,pats,patno,nois)
netact.stim=pats.smat(patno,:);
netact.hid=nlayersigpn(netact.stim,netwk.wih,netwk.hbias,nois) ;
netact.out=layersig01(netact.hid,netwk.whout,netwk.obias) ;