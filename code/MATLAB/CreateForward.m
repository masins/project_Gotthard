%
%INPUT:     a line with only >=0 value, the positive car number, the queue of the
%           line
%
%OUTPUT:    The same line with a new car (with its own number) at the 
%           beginning with moving to the right (>0) if the
%           first place is free (otherwise the car will be generated in the
%           queue)
%
%ERROR:     if the car number is negative || if there are negative cars in the
%           line


function y = CreateForward(X,n, wl)
if n<=0
    error('Error. Creating a negative- or zero-labeled car moving forward is not possible');
else
    wl.push(n);
end
    
for i = 1:1:length(X)
    if X(1,i) < 0
        error('Error. \nThe line has a negative value at position (1,%d)',i);
    end
end

if X(1,1)==0
        X(1,1)=wl.pop();
end
y=X;
end