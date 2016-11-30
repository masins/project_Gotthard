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
%    <<Line D<<                    <<Line G<<                  <<Line B<<
% --------------- <<Line C>>  ------------------- <<Line F>> --------------
%    >>Line A>>  _____________     >>Line E>>    ____________  >>Line H>>            
% ---------------             ------------------             --------------
%

%time initialise
m = 0;
h = 0;
d = 0;

%data from excel file
numr1 = xlsread('Copia_di_Dati2015Gottardo(2830).xlsx',2,'F45:AC47');
R1=round(numr1);

numr2 = xlsread('Copia_di_Dati2015Gottardo(2830).xlsx',3,'F45:AC47');
R2=round(numr1);

% FIRST traffic light parameters
timer1=0;
tg1 = 30;
tr1 = 40;
ttot1 = 2*tg1+2*tr1;

% SECOND traffic light parameters
timer2=0;
tg2 = 30;
tr2 = 70;
ttot2 = 2*tg2+2*tr2;

% Simulation time parameters (DA CAMBIARE)
simtime=86400;
TH=zeros(1,simtime);
TD=zeros(1,simtime);
car_counterD = 0;
car_counterH = 0;
fluxD = zeros(1,25);
fluxH = zeros(1,25);


% set lines:
% set lenght
% initially void
% a space is 5 meter
af=250;
bf=250;
cf=78;
df=af;
ef=136;
ff=100;
gf=ef;
hf=bf;
A=zeros(1,af);
B=zeros(1,bf);
C=zeros(1,cf);
D=zeros(1,df);
E=zeros(1,ef);
F=zeros(1,ff);
G=zeros(1,gf);
H=zeros(1,hf);



for t=1:1:simtime
    
    % minute counter
    if (t>0) && (mod(t,59)==0)
        m = m+1;
    end
    %houar cunter
    if (m>0) && (mod(m,59)==0)
        h = h+1;
        m = 0;
    end
    % day counter
    if (h>0) && (mod(h,23)==0)
        d = d+1;
        h=0;
    end
    
    
    %move car to the new section after finish C --> E
    if C(1,length(C))==1
        C(1,length(C))= 0;
        E(1,1)=1;
    end
    %move car to the new section after finish F --> H
    if F(1,length(F))==1
        F(1,length(F))= 0;
        H(1,1)=1;
    end
    
    %move car to the new section after finish C --> D
    if C(1,1)==-1
        C(1,1)= 0;
        D(1,length(D))=-1;
    end
    %move car to the new section after finish F --> G
    if F(1,1)==-1
        F(1,1)= 0;
        G(1,length(G))=-1;
    end
    
    %each car moves 2 space forward if possible 
    %FIRST SIDE
    A = MoveForward(A);
    A = MoveForward(A);
    E = MoveForward(E);
    E = MoveForward(E);
    G = MoveBackward(G);
    G = MoveBackward(G);
    D = MoveBackward(D);
    D = MoveBackward(D);
    C = MoveForward(C);
    C = MoveForward(C);
    C = MoveBackward(C);
    C = MoveBackward(C);
    H = MoveForward(H);
    H = MoveForward(H);
    B = MoveBackward(B);
    B = MoveBackward(B);
    F = MoveForward(F);
    F = MoveForward(F);
    F = MoveBackward(F);
    F = MoveBackward(F);
    
    
    %new car enters A line each houar
    
    
    %00:00 - 00:59
    if h<1
        if mod(t,1200) == 0
            A = CreateForward(A);
        end
    %01:00
    elseif 1<= h && h < 2
        if mod(t,3600) == 0
            A = CreateForward(A);
        end
    %02:00 - 04:59
    elseif 2<= h && h<5
        if mod(t,3600) == 0
            A = CreateForward(A);
        end
    %05:00 - 05:59
    elseif 5<= h && h<6
        if mod(t,720) == 0
            A = CreateForward(A);
        end
    %06:00 - 06:59
    elseif 6<= h && h<7
        if mod(t,180) == 0
            A = CreateForward(A);
        end
    %07:00 - 07:59
    elseif 7<= h && h<8
        if mod(t,88) == 0
            A = CreateForward(A);
        end
    %08:00 - 08:59
    elseif 8<= h && h<9
        if mod(t,45) == 0
            A = CreateForward(A);
        end
    %09:00 - 09:59
    elseif 9<= h && h<10
        if mod(t,24) == 0
            A = CreateForward(A);
        end
    %10:00 - 10:59
    elseif 10<= h && h<11
        if mod(t,15) == 0
            A = CreateForward(A);
        end
    %11:00 - 11:59
    elseif 11<= h && h<12
        if mod(t,9) == 0
            A = CreateForward(A);
        end
    %12:00 - 12:59
    elseif 12<= h && h<13
        if mod(t,10) == 0
            A = CreateForward(A);
        end
    %13:00 - 13:59
    elseif 13<= h && h<14
        if mod(t,7) == 0
            A = CreateForward(A);
        end
    %14:00 - 17:59
    elseif 14<= h && h<18
        if mod(t,8) == 0
            A = CreateForward(A);
        end       
    %18:00 - 18:59
    elseif 18<= h && h<19
        if mod(t,12) == 0
            A = CreateForward(A);
        end
    %19:00 - 20:59
    elseif 19<= h && h<21
        if mod(t,23) == 0
            A = CreateForward(A);
        end
    %21:00 - 21:59
    elseif 21<= h && h<22
        if mod(t,29) == 0
            A = CreateForward(A);
        end
    %22:00 - 22:59
    elseif 22<= h && h<23
        if mod(t,54) == 0
            A = CreateForward(A);
        end
    %23:00 - 23:59
    elseif 23<= h && h<24
        if mod(t,60) == 0
            A = CreateForward(A);
        end
    else
        error('Error. \nIn the create in line A the variable hour (h) take value %d',h);
    end
    %}   
    %con case switch
    %{
    switch h
        case 0
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
            
        case 1
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 2
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 3
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 4
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 5
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 6
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 7
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 8
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 9
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 10
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 11
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 12
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 13
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 14
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 15
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 16
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 17
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 18
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 19
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 20
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 21
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 22
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        case 23
            if mod(t,R1(d+1,h+1)) == 0
                A = CreateForward(A);
            end
        otherwise
            error('Error. \nIn the create in line A the variable hour (h) take value %d',h);
            
    end
    %}
    
    %new car enters B line each houar
    %
    %00:00 - 00:59
    if h<1
        if mod(t,900) == 0
            B = CreateBackward(B);
        end
        %01:00 - 04:59
    elseif 1<= h && h < 5
        if mod(t,3600) == 0
            B = CreateBackward(B);
        end
        %05:00 - 05:59
    elseif 5<= h && h<6
        if mod(t,1800) == 0
            B = CreateBackward(B);
        end
        %06:00 - 06:59
    elseif 6<= h && h<7
        if mod(t,514) == 0
            B = CreateBackward(B);
        end
        %07:00 - 07:59
    elseif 7<= h && h<8
        if mod(t,150) == 0
            B = CreateBackward(B);
        end
        %08:00 - 08:59
    elseif 8<= h && h<9
        if mod(t,106) == 0
            B = CreateBackward(B);
        end
        %09:00 - 09:59
    elseif 9<= h && h<10
        if mod(t,77) == 0
            B = CreateBackward(B);
        end
        %10:00 - 10:59
    elseif 10<= h && h<11
        if mod(t,43) == 0
            B = CreateBackward(B);
        end
        %11:00 - 11:59
    elseif 11<= h && h<12
        if mod(t,21) == 0
            B = CreateBackward(B);
        end
        %12:00 - 12:59
    elseif 12<= h && h<13
        if mod(t,10) == 0
            B = CreateBackward(B);
        end
        %13:00 - 13:59
    elseif 13<= h && h<14
        if mod(t,8) == 0
            B = CreateBackward(B);
        end
        %14:00 - 16:59
    elseif 14<= h && h<17
        if mod(t,7) == 0
            B = CreateBackward(B);
        end
        %17:00 - 17:59
    elseif 17<= h && h<18
        if mod(t,9) == 0
            B = CreateBackward(B);
        end
        %18:00 - 18:59
    elseif 18<= h && h<19
        if mod(t,11) == 0
            B = CreateBackward(B);
        end
        %19:00 - 19:59
    elseif 19<= h && h<20
        if mod(t,15) == 0
            B = CreateBackward(B);
        end
        %20:00 - 20:59
    elseif 20<= h && h<21
        if mod(t,19) == 0
            B = CreateBackward(B);
        end
        %21:00 - 21:59
    elseif 21<= h && h<22
        if mod(t,30) == 0
            B = CreateBackward(B);
        end
        %22:00 - 22:59
    elseif 22<= h && h<23
        if mod(t,41) == 0
            B = CreateBackward(B);
        end
        %23:00 - 23:59
    elseif 23<= h && h<24
        if mod(t,80) == 0
            B = CreateBackward(B);
        end
    else
        error('Error. \nIn the create in line B the variable hour (h) take value %d',h);
    end
    %}
    %con case switch
    %{
        switch h
        case 0
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
            
        case 1
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 2
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 3
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 4
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 5
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 6
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 7
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 8
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 9
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 10
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 11
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 12
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 13
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 14
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 15
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 16
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 17
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 18
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 19
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 20
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 21
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 22
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 23
            if mod(t,R2(d+1,h+1)) == 0
                B = CreateBackward(B);
            end
        otherwise
            error('Error. \nIn the create in line A the variable hour (h) take value %d',h);
            
    end
    %}
    
    
    %traffic light
    [A, G, C, timer1] = TrafficLight(A, G, C, timer1, tg1, tr1, ttot1);
    [E, B, F, timer2] = TrafficLight(E, B, F, timer2, tg2, tr2, ttot2);
        
    %empting D and plotting what is going out
    if D(1,1) == 0
        TD(1,t)=0;
    elseif D(1,1)==-1
        D(1,1)=0;
        TD(1,t)=-1;
        car_counterD = car_counterD + 1;
    end
    
    %empting H and plotting what is going out
    if H(1,length(H)) == 0
        TH(1,t)=0;
    elseif H(1,length(H)) == 1
        H(1,length(H)) = 0;
        TH(1,t)=1;
        car_counterH = car_counterH +1;
    end
    
    %Plotting things
    if mod(t,3600) == 0 && h < 26
        fluxD(1,h+1)=car_counterD;
        fluxH(1,h+1)=car_counterH;
        h = h + 1;
        car_counterD = 0;
        car_counterH = 0;
    end
       
end
figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
area(fluxD)
title('fluxD')

subplot(2,1,2)       % add second plot in 2 x 1 grid
area(fluxH)       
title('fluxH')