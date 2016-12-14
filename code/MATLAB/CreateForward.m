%
%INPUT:     a line with only >=0 vale, the car number, the queue of the
%line
%
%OUTPUT:    The same line with a new car (with is own number) at the 
%           beginning with moving right (>0) if the
%           first place is free otherwise the car will be generete in the
%           queue
%
%ERROR:     if the car number is negativ, if there are negativ car int the
%           line


function y = CreateForward(X,n, wl)
if n<=0
    error('Error. Creatingo a negativ or 0 car forward');
else
    wl.push(n);
end
    
for i = 1:1:length(X)
    if X(1,i) < 0
        error('Error. \nThe create Forward line have a negative value (1,%d)',i);
    end
end

if X(1,1)==0
        X(1,1)=wl.pop();
%else
%    errordlg('Linea piena Create Forward');
end
y=X;
end