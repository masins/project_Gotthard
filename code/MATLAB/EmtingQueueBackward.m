

function y = EmtingQueueBackward(X,wl)

if (~(wl.isempty())) && (X(1,length(X))==0)
    X(1,length(X))= wl.pop();
end

y=X;

end