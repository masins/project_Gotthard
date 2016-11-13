%test muovere elemento in vettore

%A is the line vere care move from left to right
%B is the line vere care move from right to left
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



for t=1:1:10000
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
    if (mod(t,220) < 60)
        if A(1,length(A))==1
            A(1,length(A))=0;
            C(1,1) =1;
        end
    end
    if(mod(t,220) >= 110 &&  mod(t,220) < 170)
        if B(1,1)==-1
            B(1,1)=0;
            C(1,length(C)) =-1;
        end
    end
    
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
        TE(1,t)=-1;
    end
    
    
end