%test muovere elemento in vettore

%A is the line vere care move from left to right
%B is the line vere care move from right to left

%traffic light a parameters
lta=0;
greenlefta = 60;
waitlefta = 50;
greenrighta = 60;
waitrighta = 50;
lttota = greenlefta + waitlefta + greenrighta + waitrighta;


simtime=1000000;
TE=zeros(1,simtime);
TD=zeros(1,simtime);

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
    
    %every 3 second each car moves 1  space forward if it is possible
    if (mod(t,3) == 0)
        A = MoveForward(A);
        E = MoveForward(E);
        B = MoveBackward(B);
        D = MoveBackward(D);
        C = MoveForward(C);
        C = MoveBackward(C);
        
    end
    
    %a new car enter the A arry
    if mod(t,7)==0
        A = CreateForward(A);
    end
    
    %a new car enter the B arry
    if mod(t,8) == 0
        B = CreateBackward(B);
    end
    
    %traffic light
    [lta, A, B, C] = TrafficLight(lta, A, B, C, lttota, greenlefta, waitlefta, greenrighta, waitrighta);
    
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