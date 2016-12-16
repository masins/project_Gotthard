%
%INPUT: a line
%ERROR: positive- and negative-labeled car in the same line
%
function TestCrash(X)

testright = all(X>=0);
testleft = all(X<=0);

if (testright || testleft) == 0
    error('Error car in same line with opposit direction');   
end

end