function y = MoveBackward(X)
    l = length(X);
    y=X;
     for i=2:1:l
        if X(1,i)==(-1) && X(1,i-1)==0
            y(1,i-1)=-1;
            y(1,i)=0;
        end
     end
end