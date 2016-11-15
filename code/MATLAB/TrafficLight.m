%the time counter
function [nlt, nLeftline, nRigthline, nCenterline] = TrafficLight (lt, Leftline, Rigthline, Centerline)

nlt = 0;
nLeftline = Leftline;
nRigthline = Rigthline;
nCenterline = Centerline;

ttot = 220;

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
if mod (lt, ttot)>0 && mod (lt, ttot)<60
    if WaitCarPresence(Leftline) == 1
        nLeftline(1,length(nLeftline))=0;
        nCenterline(1,1) =1;
    end
end

%green light right
if(mod(lt,220) >= 110 &&  mod(lt,220) < 170)
    if Rigthline(1,1)==-1
        nRigthline(1,1)=0;
        nCenterline(1,length(nCenterline)) =-1;
    end
end


end

