%Emptying queue of a Backward line
%INPUT: a line X, a queue wl
%       if the last space/cell of the line is free and the line is not empty
%       then creates a car moving backward in the line
%OUTPUT: the new line

function y = EmtingQueueBackward(X,wl)

if (~(wl.isempty())) && (X(1,length(X))==0)
    X(1,length(X))= wl.pop();
    if X(1,length(X)) > 0
        error ('Creating car with positive label in a backward line is not possible');
    end
end

y=X;

end
