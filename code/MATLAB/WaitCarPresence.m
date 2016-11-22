%INPUT: a Line
%
%OUTPUT: 
% return 0 iff there is no car waiting
% return 1 iff there is a car waiting on the RIGHT
% return -1 iff there is a car waiting on the LEFT
%
% a car waits in the last position before the traffic light

function y = WaitCarPresence(Line)
 
y=0;

if Line(1,length(Line)) == 1
    y=1;
end

if Line(1,1) == -1
    y=-1;
end

end