%Emty the queue of a Forward linee
%INPUT: a line X, a queue wl
%       if the first spece of the line is free and the line is not emptyit
%       crearte a car moving Forward in the line
%Outup: The new line

function y = EmtingQueueForward(X,wl)

if (~(wl.isempty())) && (X(1,1)==0)
    X(1,1)= wl.pop();
    if X(1,1) <0
        error ('Crating negativ car in a forward line');
    end
end

y=X;

end