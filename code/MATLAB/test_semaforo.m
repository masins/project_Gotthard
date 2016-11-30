%INPUT: L: left line, R: right line, C: center line, t: timer, tg: time green, ttr: time red
function [nL,nR,nC,nt] = test_semaforo(L,R,C,t,tg,tr)
nL = L;
nR = R;
nC = C;
nt = t;
ttot = 2*tg+2*tr;

%Sensore a sinistra e a destra in caso t=0
if(nt==0)
    if(WaitCarPresence(nL) == 1)
        nt=1;
    elseif(WaitCarPresence(nR) == -1)
        nt= tg+tr+1;
    end
end

%sensore a sinistra e a destra in caso t= tg+tr
if(nt== tg+tr)
    if(WaitCarPresence(nR) == -1)
    elseif(WaitCarPresence(nR) == 1)
        nt=1;
    elseif(WaitCarPresence(nR) == 0)
        nt=0;
    else
        error('qualcosa non funziona nel sensore a timer = %d',nt);
    end
end

%SEMAFORO verde a sinistra o a destra
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

%fai avanzare o resetta timer
%Errore se timer prende valore non concesso
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
