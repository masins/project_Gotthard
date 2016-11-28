%
% INPUT
% Leftline, Rightline: right and left line with cars waiting
% Centerline: line with cars passing in both directions
%
% OUTPUT
% nlt: new light time, corresponds to the time of the traffic light
% nLeftline, nRightline, nCenterline: new situazion of lines is returned

function [nlt, nLeftline, nRigthline, nCenterline] = TrafficLight (lt, Leftline, Rigthline, Centerline, ttot, greenleft, waitleft, greenright, waitright)

%initializing temporary variables
%
nlt = lt;
nLeftline = Leftline;
nRigthline = Rigthline;
nCenterline = Centerline;

%{
%check time and eventual presence of cars
%
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

%check if light is green on the LEFT
if abs(mod (lt, ttot))>0 && abs(mod (lt, ttot))<greenleft
    if WaitCarPresence(Leftline) == 1
        nLeftline(1,length(nLeftline))=0;
        nCenterline(1,1) =1;
    end
end

%check if light is green on the RIGHT
if(abs(mod(lt,ttot)) > abs((ttot - greenright - waitright)) &&  abs(mod(lt,ttot)) < (ttot - waitright))
    if Rigthline(1,1)==-1
        nRigthline(1,1)=0;
        nCenterline(1,length(nCenterline)) =-1;
    end
end

%if green light was on the left, check car presence on the right
%reset time
if mod(lt,ttot) == (greenleft + waitleft)
    if WaitCarPresence(Rigthline)== 0
        nlt = 0;
    end
end

%if green light was on the right, check car presence on the left
%reset time
if abs(mod(lt,ttot)) == greenleft
    if WaitCarPresence(nLeftline)== 0
        nlt = 0;
    end
end

%reset lt
if lt == ttot
    nlt=0;
end
%}

%if light in 0 state chek presence car in lefto or right line and eventuali
%set te time to make greeen in one of the direction
if(lt == 0)
    if (WaitCarPresence(Leftline) == 1)
        nlt=1;
    elseif ((nlt == 0) && (WaitCarPresence(Rigthline) == -1))
        nlt= greenleft + waitleft + 1;
    else
        nlt=lt;
    end
end

%green on the left or roght side let pass car if there are
if(lt > 0 && lt <= greenleft)
    if(WaitCarPresence(Leftline) == 1)
    nCenterline(1,1)=1;
    nLeftline(1, length(nLeftline)) = 0;
    end
elseif ( lt>(greenleft + waitleft) && lt<=(greenleft + waitleft+greenright))
    if(WaitCarPresence(Rigthline) == -1)
    nCenterline(1,length(nCenterline))= -1;
    nRigthline(1, 1) = 0;
    end
else
    nlt=lt;
end

%after finish the waiting(red light) hcek if back to base state
if(lt==(greenleft + waitleft))
    if(WaitCarPresence(Rigthline) == -1)
        nlt = lt+1;
    elseif(nlt == lt && WaitCarPresence(Leftline) == 1)
        nlt = 1;
    else
        nlt = 0;
    end
elseif(lt == ttot)
    if(WaitCarPresence(Leftline) == 1)
        nlt = 1;
    elseif(nlt == lt && WaitCarPresence(Rigthline) == -1)
        nlt = lt+1;
    else
        nlt = 0;
    end 
end

if lt~=0
    nlt = lt +1;
end
end

