%the time counter
function [nlt, nLeftline, nRigthline, nCenterline] = TrafficLight (lt, Leftline, Rigthline, Centerline, ttot, greenleft, waitleft, greenright, waitright)
%initialasing
nlt = lt;
nLeftline = Leftline;
nRigthline = Rigthline;
nCenterline = Centerline;

%check time and presence
if lt == 0
    if WaitCarPresence(Leftline) == 1
        nlt = 1;
    end
    if WaitCarPresence(Rigthline)==-1
        nlt = - ttot;
    end
end
if lt ~= 0
    nlt = 1+ lt;
end

%green light left
if mod (lt, ttot)>0 && mod (lt, ttot)<greenleft
    if WaitCarPresence(Leftline) == 1
        nLeftline(1,length(nLeftline))=0;
        nCenterline(1,1) =1;
    end
end

%green light right
if(mod(lt,ttot) > (ttot - greenright - waitright) &&  mod(lt,ttot) < (ttot - waitright))
    if Rigthline(1,1)==-1
        nRigthline(1,1)=0;
        nCenterline(1,length(nCenterline)) =-1;
    end
end

%after green ligth left check if rigth car are waiting if there aren't
%reset time
if mod(lt,ttot) == (greenleft + waitleft)
    if WaitCarPresence(Rigthline)== 0
        nlt = 0;
    end
end
%after green ligth rigth check if lest car are waiting if there aren't
%reset time
if mod(lt,ttot) == greenleft
    if WaitCarPresence(nLeftline)== 0
        nlt = 0;
    end
end

%reset lt
if lt == ttot
    nlt=0;
end

end

