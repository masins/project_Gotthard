% traffic light function
%
%
% INPUT: 
% L,R,C = left, right and center line
% t = timer
% tg = time green, parameter corresponds to duration of green light
% tr = time red, parameter corresponds to duration of red light
% wl = queue at the light, necessary for MoveForward(), must be empty
%
% OUTPUT:
% nL,nR,nC = new left, right and center line
% nt = new timer
%
%
function [nL,nR,nC,nt] = TrafficLight(L,R,C,t,tg,tr, ttot, wl)

nL = L;
nR = R;
nC = C;
nt = t;

% TIMER:
% t = 0 --> waiting state
% 0 < t <= tg --> green on the left
% tg < t <= tg+tr --> red on both sides
% tg+tr < t <= 2tg+tr --> green on the right
% 2tg+tr < t <= 2(tg+tr) --> red on both sides
%

% sensor on the left or on the right if nt = 0
% if there are cars waiting on the left --> light is green on the left
% elif there are no cars on the left and there are cars on the right -->
% light is green on the right
% else light is red on both sides
%
if(nt==0)
    if(WaitCarPresence(nL) == 1)
        nt = 1;
    elseif(WaitCarPresence(nR) == -1)
        nt = tg+tr+1;
    end
end

% sensor on the left or on the right if nt = tg+tr
% if there are cars waiting on the left --> light is green on the left
% elif there are no cars on the left and there are cars on the right -->
% light is green on the right
% else light is red on both sides
%
if(nt == tg+tr)
    if(WaitCarPresence(nR) == -1)
    elseif(WaitCarPresence(nR) == 1)
        nt=1;
    elseif(WaitCarPresence(nR) == 0)
        nt=0;
    else
        error('qualcosa non funziona nel sensore a timer = %d',nt);
    end
end

% traffic light is GREEN either on the left or on the right
if(mod(t,ttot) > 0 && mod(t,ttot) <= tg)
    if(nL(1,length(nL)) > 0) && (nC(1,1) == 0)
        nC = CreateForward(nC,nL(1, length(nL)),wl);
        nL(1, length(nL)) = 0;
    end
elseif((mod(t,ttot)>(tg+tr)) && (mod(t,ttot)<=(2*tg+tr)))
    if(nR(1,1) < 0) && (nC(1, length(nC)) ==0)
        nC = CreateBackward(nC,nR(1,1),wl);
        nR(1,1)=0;
    end
end

% increment timer if is in normal stateI t > 0 && t < ttot
% reset timer if t = 0 || t = ttot
% error if timer is out of range: t < 0 || t > ttot
%
if nt == ttot
    nt = 0;
elseif ((nt>0) && (nt < ttot))
    nt = nt+1;
elseif(nt==0)
    nt=0;
else
    error('Error. The timer takes wrong value \ntimer = %d',nt);
end

end