function y = CreateForward(X)
if X(1,1)==0
    X(1,1)=1;
end
y=X;
end

function y = CreateBackward(X)
if X(1,length(X))==0
    X(1,length(X))=-1;
end
y=X;
end