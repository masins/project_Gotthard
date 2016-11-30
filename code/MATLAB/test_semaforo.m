%INPUT: L: left line, R: right line, C: center line, t: timer, 
%tg: time green, ttr: time red
function [nL,nR,nC,nt] = test_semaforo(L,R,C,t,tg,tr)

nL = L;
nR = R;
nC = C;
nt = t;
ttot = 2*tg+2*tr;

%SEMAFORO IN SE
if(mod(t,ttot) > 0 && mod(t,ttot) <= tg)
    if(nL(1,50) == 1)
        nC = CreateForward(nC);
        nL(1, 50) = 0;
    end
elseif((mod(t,ttot)>(tg+tr)) && (mod(t,ttot)<=(2*tg+tr)))
    if(nR(1,1)==-1)
        nR(1,1)=0;
        nC = CreateBackward(nC);
    end
end

if nt == ttot
    nt = 1;
elseif nt < ttot
    nt = nt +1;
else
    error('Error. The timer takes wrong value \ntimer = %d',t);

end
