function netact=forw3(netwk,pats)
netact.stim=pats.smat;
netact.hid=layersigpn(netact.stim,netwk.wih,netwk.hbias) ;
netact.out=layersig01(netact.hid,netwk.whout,netwk.obias) ;
end