
function TestCrash(X)
testright = 0;
testleft = 0;

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

end