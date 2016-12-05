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

%initialise time
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
tg1 = 0;
tr1 = 40;
ttot1 = 2*tg1+2*tr1;

% SECOND traffic light parameters
timer2=0;
tg2 = 0;
tr2 = 70;
ttot2 = 2*tg2+2*tr2;

%number of repetitions of simulation
trep = 2600;
flux3D= zeros(trep,24);
flux3H= zeros(trep,24);

% set lines:
% set lenght
% initially void
% a block is 5 meters long
af=250;
ef=136;
ff=100;
cf=78;
bf=af;
df=af;
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




for st=1: 1 : trep
    
    % Simulation time parameters (DA CAMBIARE)
    simtime=86400;
    TH=zeros(1,simtime);
    TD=zeros(1,simtime);
    car_counterD = 0;
    car_counterH = 0;
    fluxD = zeros(1,24);
    fluxH = zeros(1,24);
    
    %time initialise
    m = 0;
    h = 0;
    d = 0;
    
    
    % FIRST traffic light parameters
    timer1=0;
    tg1 = 1*st;
    tr1 = 40;
    ttot1 = 2*tg1+2*tr1;
    
    % SECOND traffic light parameters
    timer2=0;
    tg2 = 1*st;
    tr2 = 70;
    ttot2 = 2*tg2+2*tr2;
    
    %reset corsie
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
        if (t>0) && (mod(t,60)==0)
            m = m+1;
        end
        % hour counter
        if (m>0) && (mod(m,60)==0)
            h = h+1;
            m = 0;
        end
        % day counter
        if (h>0) && (mod(h,24)==0)
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
        
        %each car moves 2 spaces forward if possible
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
        
        
        % new car enters A line each hour
        % with switch case
        
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
                error('Error. \nIncorrect value for variable h (hour) = %d: h must be between 0 and 23',h);
                
        end
        
        
        % new car enters B line each hour
        % with switch case
        
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
                error('Error. \nIncorrect value for variable h (hour) = %d: h must be between 0 and 23',h);
                
        end
        
        
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
            car_counterD = 0;
            car_counterH = 0;
        end
        
    end
    %{
    % PLOTS
    % fluxD represents the flux of cars through D
    figure
    subplot(2,1,1); % add first plot in 2 x 1 grid
    xD = 0:24;
    hb = area(xD,fluxD);
    hb(1).FaceColor = [0 .5 0];
    hb(1).LineWidth = 1;
    title('Flux of cars to Bellinzona');
    xlabel('hours');
    ylabel('number of cars');
    
    % fluxH represents the flux of cars through H
    subplot(2,1,2); % add second plot in 2 x 1 grid
    xH = 0:24;
    d = area(xH,fluxH);
    d(1).FaceColor = [0.7843 0.7843 0.0392];
    d(1).LineWidth = 1.5;
    title('Flux of cars to Goeschenen');
    xlabel('hours');
    ylabel('number of cars');
    
    figure
    % confront fluxes
    y = zeros(25,2);
    y(:,1) = fluxD(1,:);
    y(:,2) = fluxH(1,:);
    b = bar(y);
    b(1).FaceColor = [0 .5 0];
    b(1).LineWidth = 1.5;
    b(2).FaceColor = [0.7843 0.7843 0.0392];
    b(2).LineWidth = 1.5;
    legend('flux to Bellinzona','flux to Goeschenen');
    %}
    
    flux3D(st,:) = fluxD;
    
    flux3H(st,:) = fluxH;
    
    iteration=st
    
end
figure
subplot(2,1,1);
mesh(flux3D);
    xlabel('hours'),
    ylabel('number of iterations');
    zlabel('number of cars');
    title('Flux of cars to Bellinzona');


subplot(2,1,2);
mesh(flux3H);
    xlabel('hours'),
    ylabel('number of iterations');
    zlabel('number of cars');
    title('Flux of cars to Goeschenen');


%case per fare copia incolla
%{
        switch h
        case 0
        
        case 1
            
        case 2
            
        case 3
            
        case 4
            
        case 5
            
        case 6
            
        case 7
            
        case 8
            
        case 9
            
        case 10
            
        case 11
            
        case 12
            
        case 13
            
        case 14
            
        case 15
            
        case 16
            
        case 17
            
        case 18
            
        case 19
            
        case 20
            
        case 21
            
        case 22
            
        case 23
            
            otherwise
        end
%}