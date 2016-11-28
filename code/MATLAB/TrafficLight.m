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

    % lt = 0: light timer is in waiting mode state
    % check presence of a car in both directions
    % set time s.t. light is green in the right direction
    % if no car waits, nothing happens
    %
    
    
    
    %
    %
    % ttot = greenLeft + waitLeft + greenRight + waitRight
    
    % TIMER lt:
    % lt = 0              -- base mode, nothing happens
    % lt ? [1, greenLeft] -- green on LEFT side
    % lt ? [greenLeft+1, greenLeft+waitLeft] -- red for both directions
    % lt ? [greenLeft+waitLeft+1, ttot-waitRight] -- green on RIGHT side 
    % lt ? [greenLeft+waitLeft+greenRight+1, ttot] -- red for both
    
    
    if(lt == 0)

        if (WaitCarPresence(Leftline) == 1)
            nlt=1;
        elseif ((nlt == 0) && (WaitCarPresence(Rigthline) == -1))
            nlt= greenleft + waitleft + 1;
        % else non necessario, ? gi? stato detto 10 righe sopra e non ?
        % entrato n? nell'if n? nell'elseif
        else
            nlt=lt;
        end
    end

    % traffic light is GREEN
        % 
        % green light on the LEFT side
        %
    if(lt > 0 && lt <= greenleft)
        if(WaitCarPresence(Leftline) == 1)
        nCenterline(1,1)=1;
        nLeftline(1, length(nLeftline)) = 0;
        end
        %
        % green light on the RIGHT side
        %
    elseif ( lt>(greenleft + waitleft) && lt<=(greenleft + waitleft+greenright))
        if(WaitCarPresence(Rigthline) == -1)
        nCenterline(1,length(nCenterline))= -1;
        nRigthline(1, 1) = 0;
        end

        % entra in questo else solo quando ? rosso da entrambe le parti, non 
        % quando non ci sono macchine che aspettano
        % nlt in ogni caso non viene modificato nell'if e nell'elseif
    else
        nlt=lt;
    end

    % sensor function 
    % if light should be green on the the right but there is no car, it
    % remains green on the left
    % else it becomes green on the right
    %
    if(lt==(greenleft + waitleft))
        if(WaitCarPresence(Rigthline) == -1)
            nlt = lt+1;
        elseif(nlt == lt && WaitCarPresence(Leftline) == 1)
            nlt = 1;
        else
            nlt = 0;
        end
        
    %
    % if light should be green on the the left but there is no car, it
    % remains green on the right
    % else it becomes green on the left
    %
    elseif(lt == ttot)
        if(WaitCarPresence(Leftline) == 1)
            nlt = 1;
        elseif(nlt == lt && WaitCarPresence(Rigthline) == -1)
            nlt = lt+1;
        else
            nlt = 0;
        end 
    end

    % increment light timer
    %
    if lt~=0
        nlt = lt +1;
    end
end

