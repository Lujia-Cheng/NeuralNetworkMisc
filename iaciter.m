function newact=iaciter(extinp,oldact,cmat,lr)
% Interactive activation model
% extinp -- ext input to each node
% oldact -- prev activity matrix (courses,times)
% cmat is the constraint matrix
% newact is the activity after a single iteration
% lr is the learning rate  -- MUST BE < 1
del=mul4d2d(cmat,oldact) + extinp ; % netinputs to each hypothesis node
ldel = 2./exp(-del) - 1.0 ; % squashes input to [-1 +1]
newact = oldact + lr*(ldel>0).*(1-oldact) - lr*(ldel<0).*oldact ;
end