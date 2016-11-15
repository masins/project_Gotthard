%INPUT a Line
%OUTPUT if there is a car at hte end of the line htat is waiting to pass to
%the nwe line retun 1 for waiting rightr return -1 for waitingleft else
%return 0

function y = WaitCarPresence(Line)
 
y=0;

if Line(1,length(Line)) == 1
    y=1;
end

if Line(1,1) == -1
    y=-1;
end

end