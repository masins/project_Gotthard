%
%INPUT:     a line with only 0 and 1
%
%OUTPUT:    The same line with a car at the beginning with moving right (1) if the
%           first place is free
%
%ERROR:     If the line contai numbers that are not 0 or 1


function y = CreateForward(X,n)
if n<=0
    error('Error. Cratingo a negativ or 0 car forward');
end
    
for i = 1:1:length(X)
    if X(1,i) < 0
        error('Error. \nThe create Forward line have a wrong value at (1,%d)',i);
    end
end

if X(1,1)==0
    X(1,1)=n;
else
    error('Linea piena');
end
y=X;
end