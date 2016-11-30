
A = zeros(1,50);
B = zeros(1,50);
C = zeros(1,50);
D = zeros(1,50);
X = zeros(1,10);
TD=zeros(1,400);
TB = zeros(1,400);
timer=1;
tg = 20;
tr = 20;
car_counterD = 0;
car_counterB = 0;
fluxD = zeros(1,24);
fluxB = zeros(1,24);
h=1;

for t = 1 : 1 : 86400
    
    % create car
    A = CreateForward(A);
    C = CreateBackward(C);
    
    % move car
    A = MoveForward(A);
    B = MoveForward(B);
    C = MoveBackward(C);
    D = MoveBackward(D);
    X = MoveForward(X);
    X = MoveBackward(X);
    
    % free center line if needed
    if X(1,10) == 1
        B = CreateForward(B);
        X(1,10) = 0;
    elseif X(1,1)==-1
        D = CreateBackward(D);
        X(1,1)=0;
    end
    
    % traffic light function
    [A,C,X,timer] = test_semaforo(A,C,X,timer,tg,tr);
    
    % graphs
    % TD is 1 if a car passes through D and 0 otherwise
    % TB is 1 if a car passes through B and 0 otherwise
    if D(1,1)==0
        TD(1,t)=0;
    elseif D(1,1)==-1
        TD(1,t) = -1;
        D(1,1)=0;
        car_counterD = car_counterD + 1;
    end
    if B(1,50)==0
        TB(1,t)=0;
    elseif B(1,50)==1
        TB(1,t) = 1;
        B(1,50)=0;
        car_counterB = car_counterB + 1;
    end
    
    % fluxD represents the number of cars passing through D in one hour
    % FluxB represents the number of cars passing through B in one hour
    if mod(t,3600) == 0 && h < 25
        fluxD(1,h)=car_counterD;
        fluxB(1,h)=car_counterB;
        h = h + 1;
        car_counterD = 0;
        car_counterB = 0;
    end
    
end