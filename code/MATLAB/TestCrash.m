
function TestCrash(X)
testright = all(X>=0);
testleft = all(X<=0);

if ~(xor(testright, testleft)
    error('Error car in same line with opposit direction');   
end

%{


% check that there are care in any direction
for i=1:1:length(X)
    if X(1,i) == 1
        testright = 1;
    elseif X(1,i) == -1
        testleft = 1;
    end
end

if (testright==1 && testleft==1)
    error('Error car in same line with opposit direction');
end;
%}
end