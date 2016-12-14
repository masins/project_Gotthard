%Emty the queue of a Backward linee
%INPUT: a line X, a queue wl
%       if the last spece of the line is free and the line is not emptyit
%       crearte a car moving backward in the line
%Outup: The new line

function y = EmtingQueueBackward(X,wl)

if (~(wl.isempty())) && (X(1,length(X))==0)
    X(1,length(X))= wl.pop();
    if X(1,length(X)) > 0
        error ('Crating positiv car in a backward line');
    end
end

y=X;

end