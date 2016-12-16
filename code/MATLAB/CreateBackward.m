%
%INPUT:     a line with only <=0 vale, the negative car number, the queue of 
%           the line
%
%OUTPUT:    The same line with a new car (with its own number) at the 
%           beginning with moving left (<0) if the
%           last place is free (otherwise the car will be generated in the
%           queue)
%
%ERROR:     if the car number is positive || if there are positive cars in the
%           line


function y = CreateBackward(X,n,wl)

if n>=0
    error('Error. Crating a positive- or zero-labeled car moving backward is not possible');
else
    wl.push(n);
end

for i = 1:1:length(X)
    if X(1,i) > 0
        error('Error. \nThe line has a positive value at position (1,%d)',i);
    end
end

if X(1,length(X))==0 
            X(1,length(X))= wl.pop;

end
y=X;
end