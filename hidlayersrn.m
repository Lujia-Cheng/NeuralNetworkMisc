function lout=hidlayersrn(pin,ctx,win,wctx,b,noise)
lll=b'+win(:,pin)+wctx*ctx';% FIXED %combine input from single input and ctx layer
lout=sigpn(lll)'+noise*(rand(size(lll))'-0.5);
end