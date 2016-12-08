

function y = EmtingQueueForward(X,wl)

if (~(wl.isempty())) && (X(1,1)==0)
    X(1,1)= wl.pop();
end

y=X;

end