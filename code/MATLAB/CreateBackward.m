%
%INPUT:     a line with only <=0 vale, the negativ car number, the queue of 
%           the line
%
%OUTPUT:    The same line with a new car (with is own number) at the 
%           beginning with moving left (<0) if the
%           last place is free otherwise the car will be generete in the
%           queue
%
%ERROR:     if the car number is positiv, if there are positiv car int the
%           line


function y = CreateBackward(X,n,wl)

if n>=0
    error('Error. Cratingo a positiv or 0 car Backward');
else
    wl.push(n);
end

for i = 1:1:length(X)
    if X(1,i) > 0
        error('Error. \nThe move backward line have a wrong value at (1,%d)',i);
    end
end

if X(1,length(X))==0 
            X(1,length(X))= wl.pop;
%else
%   errordlg('Linea piena CreateBackward');%   error('see dialog box');
end
y=X;
end