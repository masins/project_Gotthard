%
% function moves a car one step forward on the LEFT iff it is possible
% if there is already another car nothing happens

function y = MoveBackward(X)
l = length(X);
y=X;

TestCrash(X)        

for i=2:1:l
    if y(1,i)==(-1) && y(1,i-1)==0
        y(1,i-1)=-1;
        y(1,i)=0;
    end
end
end