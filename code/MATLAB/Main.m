%
%A: line from left to right first side
%B: line from right to left first side
%C: double line first side
%D: free line from right to left first side
%E: line from left to right second side
%G: line from right to left second side
%F: double line second side
%H: free line from left to right second side
%
% ---------------_____________-------------------____________--------------
%    <<Line D<<                    <<Line B<<                  <<Line G<<
% --------------- <<Line C>>  ------------------- <<Line F>> --------------
%    >>LIne A>>  _____________     >>Line E>>    ____________ >>Line H>>            
% ---------------             ------------------             --------------
%       

% FIRST traffic light parameters
lt1=0;
greenleft1 = 60;
waitleft1 = 50;
greenright1 = 60;
waitright1 = 50;
lttot1 = greenleft1 + waitleft1 + greenright1 + waitright1;

% Simulation time parameters
simtime=1000000;
TE=zeros(1,simtime);
TD=zeros(1,simtime);

% set lines:
% set lenght
% initally void
%
af=15;
bf=15;
cf=15;
df=15;
ef=15;
A=zeros(1,af);
B=zeros(1,bf);
C=zeros(1,cf);
D=zeros(1,df);
E=zeros(1,ef);



for t=1:1:simtime
    %move the car to the new section after finish c
    if C(1,length(C))==1
        C(1,length(C))= 0;
        E(1,1)=1;
    end
    
    if C(1,1)==-1
        C(1,1)= 0;
        D(1,length(D))=-1;
    end
    
    %every 3 second each car moves 1 space forward iff possible
    if (mod(t,3) == 0)
        A = MoveForward(A);
        E = MoveForward(E);
        B = MoveBackward(B);
        D = MoveBackward(D);
        C = MoveForward(C);
        C = MoveBackward(C);
        
    end
    
    %new car enters A line
    if mod(t,7)==0
        A = CreateForward(A);
    end
    
    %new car enters B line
    if mod(t,8) == 0
        B = CreateBackward(B);
    end
    
    %traffic light
    [lt1, A, B, C] = TrafficLight(lt1, A, B, C, lttot1, greenleft1, waitleft1, greenright1, waitright1);
    
    %empting D and plotting what is going out
    if D(1,1) == 0
        TD(1,t)=0;
    end
    if D(1,1)==-1
        D(1,1)=0;
        TD(1,t)=-1;
    end
    
    %empting D and plotting what is going out
    if E(1,length(E)) == 0
        TE(1,t)=0;
    end
    if E(1,length(E))==1
        E(1,length(E))=0;
        TE(1,t)=1;
    end
    
    
end