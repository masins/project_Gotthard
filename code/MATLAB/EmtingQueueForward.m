%Emptying queue of a Forward line
%INPUT: a line X, a queue wl
%       if the first space/cell of the line is free and the line is not empty
%       then creates a car moving in the line (forward direction)
%OUTPUT: the new line

function y = EmtingQueueForward(X,wl)

if (~(wl.isempty())) && (X(1,1)==0)
    X(1,1)= wl.pop();
    if X(1,1) <0
        error ('Creating a car with negative label in a forward line is not possible');
    end
end

y=X;

end