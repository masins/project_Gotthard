%
%INPUT:     a line with only 0 and -1
%
%OUTPUT:    The same line with a car at the end with moving left (-1) if the
%           last place is free
%
%ERROR:     If the line contai numbers that are not 0 or -1

function y = CreateBackward(X)

for i = 1:1:length(X)
    if((X(1,i) ~= 0) && (X(1,i)~= -1))
        error('Error. \nThe move backward line have a wrong value at (1,%d)',i);
    end
end

if X(1,length(X))==0
    X(1,length(X))=-1;
end
y=X;
end