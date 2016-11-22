%
% function moves a car one step forward on the LEFT iff it is possible
% if there is already another car nothing happens

function y = MoveForward(X)
    l = length(X);
    y=X;
    for i= l-1 : -1 : 1
        if X(1,i)==1 && X(1,1+i)==0
            y(1,1+i)=1;
            y(1,i)=0;
        end
    end
end