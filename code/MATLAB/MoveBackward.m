%
% function moves a car one step forward on the LEFT iff it is possible
% if there is already another car nothing happens

function y = MoveBackward(X)
y=X;
l = length(y);
TestCrash(y)        


for i=2:1:l
    if y(1,i)<0 && y(1,i-1)==0
        y(1,i-1)=y(1,i);
        y(1,i)=0;
    end
end
%{
for i=2:1:l
    if y(1,i)==(-1) && y(1,i-1)==0
        y(1,i-1)=-1;
        y(1,i)=0;
        
    elseif y(1,i)==(-2) && y(1,i-1)==0
        y(1,i-1)=-2;
        y(1,i)=0;
    end
end
%}
end