%
%INPUT:     a line with only 0 and 1
%
%OUTPUT:    The same line with a car at the beginning with moving right (1) if the
%           first place is free
%
%ERROR:     If the line contai numbers that are not 0 or 1


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