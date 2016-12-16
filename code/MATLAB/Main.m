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
%Goeschenen                                                      Airolo
% ---------------_____________-------------------____________--------------
%    <<Line D<<                    <<Line G<<                  <<Line B<<
% --------------- <<Line C>>  ------------------- <<Line F>> --------------
%    >>Line A>>  _____________     >>Line E>>    ____________  >>Line H>>
% ---------------             ------------------             --------------
%                  light n. 1                     light n. 2

% add path to use queue class
addpath('../datastrcuture/');
%
% time initialisation
m = 0;      %minutes
h = 0;      %hours
d = 0;      %days

%
% data from file excel
% number of cars per hour in direction Bellinzona
numr1 = xlsread('Copia_di_Dati2015Gottardo(2830).xlsx',2,'F45:AC47');
R1=round(numr1);
%
% number of cars per hour in direction Goeschenen
numr2 = xlsread('Copia_di_Dati2015Gottardo(2830).xlsx',3,'F45:AC47');
R2=round(numr1);
%
% Random matrix for creating cars (see RandGen function)
MR1 = RandGen(R1);
MR2 = RandGen (R2);
% initialising car number:
% positive number = moving from left to right
% negative number = moving from right to left
%
nr1 = 1;
nr2 = -1;
%
% initialising wait queue
wr1 = CQueue();
wr2 = CQueue();


% FIRST traffic light parameters
timer1=0;
tg1 = 300;
tr1 = 40;
ttot1 = 2*tg1+2*tr1;
wl1 = CQueue();

% SECOND traffic light parameters
timer2=0;
tg2 = 40;
tr2 = 70;
ttot2 = 2*tg2+2*tr2;
wl2 = CQueue();

% Simulation time parameters 
nd= 1;                  % number of days
simtime=86400 * nd - 1; % -1 so the simulation terminates at 23h 59m 59s of the day set

% parameter initialisation for acquiring data
%
TH=zeros(1,simtime);
TD=zeros(1,simtime);
car_counterD = 0;
car_counterH = 0;
lxD=24*nd;
lxH=24*nd;
fluxD = zeros(1,lxD);
fluxH = zeros(1,lxH);


% set lines:
% set length
% initially void
% a space/cell is 5 meter
%
af=100;
bf=af;
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
    if (C(1,length(C))>0) && (E(1,1) == 0)
        E(1,1)=C(1,length(C));
        C(1,length(C))= 0;
    end
    
    %move car to the new section after finish F --> H
    if (F(1,length(F))>0) && (H(1,1) == 0)
        H(1,1)=F(1,length(F));
        F(1,length(F))= 0;
    end
    
    %move car to the new section after finish C --> D
    if (C(1,1)<0) && (D(1,length(D))== 0)
        D(1,length(D))=C(1,1);
        C(1,1)= 0;
    end
    
    %move car to the new section after finish F --> G
    if (F(1,1)<0) && (G(1,length(G))== 0)
        G(1,length(G))=F(1,1);
        F(1,1)= 0;
    end
    
    % each car moves 2 cells to the right (or to the left) if possible
    % estimated velocity 10 m/s (data from ASTRA)
    %
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
    
    %emptying the queue
    A = EmtingQueueForward(A,wr1);
    
    % new car enters A line according to the random matrix
    if MR1(1, 86400*(d)+h*3600+mod(t,3600)+1) == 1
        nr1 = nr1 + 1;
        A = CreateForward(A,nr1, wr1);
        MR1(1, 86400*(d)+h*3600+mod(t,3600)+1)= nr1;
        
    elseif MR1(1, 86400*(d)+h*3600+mod(t,3600)+1) == 0
        
    else
        error('Error. \nProblem encountered creating car in line A at time %d',t);
    end
    
    %emptying the queue
    B = EmtingQueueBackward(B,wr2);
    
    % new car enters B line according to the random matrix
    if MR2(1,86400*(d)+h*3600+mod(t,3600)+1) == 1
        nr2 = nr2 - 1;
        B = CreateBackward(B,nr2,wr2);
        MR2(1,86400*(d)+h*3600+mod(t,3600)+1) = nr2;
        
    elseif MR2(1, 86400*(d)+h*3600+mod(t,3600)+1) == 0
        
    else
        error('Error. \nProblem encountered creating car in line B at time %d',t);
    end
    
    
    
    %traffic lights
    [A, G, C, timer1] = TrafficLight(A, G, C, timer1, tg1, tr1, ttot1, wl1);
    [E, B, F, timer2] = TrafficLight(E, B, F, timer2, tg2, tr2, ttot2, wl2);
    % Check that there is no car
    if ~(wl1.isempty() && wl2.isempty)
        error('Traffic light Queues are filled');
    end
    %emptying D and plotting
    if D(1,1) == 0
        TD(1,t)=0;
    elseif D(1,1)< 0
        TD(1,t)=D(1,1);
        D(1,1)=0;
        car_counterD = car_counterD + 1;
    end
    
    %empting H and plotting
    if H(1,length(H)) == 0
        TH(1,t)=0;
    elseif H(1,length(H)) > 0
        TH(1,t)=H(1,length(H));
        H(1,length(H)) = 0;
        car_counterH = car_counterH +1;
    end
    
    %plotting fluxes
    if mod(t,3600) == 0 && h < 24
        fluxD(1,d*24+h+1)=car_counterD;
        fluxH(1,d*24+h+1)=car_counterH;
        car_counterD = 0;
        car_counterH = 0;
    end
    
end

%array with time needed to pass through Gotthard pass for each car(first car has
%number 2)
%direction Bellinzona
TxH = zeros(1, max(TH));
for i=2 : 1 : max (TH)
    TxH(1,i) = (find(TH==i,1) - find(MR1==i,1));
end
%direction Goeschenen
TxD = zeros(1, abs(min(TD)));
for i=-2 : -1 : min (TD)
    TxD(1,abs(i)) = (find(TD==i,1) - find(MR2==i,1));
end

% PLOTS
% fluxD represents the flux of cars through D
figure
subplot(2,1,1); % add first plot in 2 x 1 grid

xD = 0:lxD -1;
hp = area(xD,fluxD);
hp(1).FaceColor = [0 .5 0];
hp(1).LineWidth = 1;
title('Flux of cars to Goeschenen');
xlabel('hours');
ylabel('number of cars');

% fluxH represents the flux of cars through H
subplot(2,1,2);% add second plot in 2 x 1 grid
xH = 0:lxH-1;
dp = area(xH,fluxH);
dp(1).FaceColor = [0.7843 0.7843 0.0392];
dp(1).LineWidth = 1.5;
title('Flux of cars to Airolo');
xlabel('hours');
ylabel('number of cars');

figure

% confront fluxes
y = zeros(lxD,2);
y(:,1) = fluxD(1,:);
y(:,2) = fluxH(1,:);
b = bar(y);
b(1).FaceColor = [0 .7 0];
b(1).LineWidth = 0.1;
b(2).FaceColor = [.8 0 0];
b(2).LineWidth = 0.1;

h_legend=legend('flux to Goeschenen','flux to Airolo','location','northwest');
title('Flux','fontsize',16);
xlabel('Hours','fontsize',16);
ylabel('Number of cars','fontsize',16);
set(h_legend,'fontsize',16);
set(gca,'fontsize',16);



% plot: time needed to pass through
figure
subplot(2,1,1);
area (TxH);
title('Airolo Direction','fontsize',16);
xlabel('Car Label','fontsize',16);
ylabel('travel time [s]','fontsize',16);
set(gca,'fontsize',16);

subplot(2,1,2);
area (TxD);
title('Goeschenen Direction','fontsize',16);
xlabel('Car Label * (-1)','fontsize',16);
ylabel('travel time [s]','fontsize',16);
set(gca,'fontsize',16);
