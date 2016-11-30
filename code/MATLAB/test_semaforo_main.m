
B = zeros(1,50);
A = zeros(1,50);
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

numr1 = xlsread('Copia_di_Dati2015Gottardo(2830).xlsx',2,'F14:AC14');
d0r1=round(numr1);


%{
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
%}

for t=1:1:89400
    
    
     %houar cunter
    if (t>0) && (mod(t,3600)==0)
        h = h+1;
    end
    if h == 24
        h=0;
    end
    
    switch h
        case 0
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
            
        case 1
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 2
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 3
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 4
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 5
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 6
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 7
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 8
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 9
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 10
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 11
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 12
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 13
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 14
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 15
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 16
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 17
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 18
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 19
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 20
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 21
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 22
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        case 23
            if mod(t,d0r1(1,h+1)) == 0
                B = CreateBackward(B);
            end
        otherwise
            error('Error. \nIn the create in line A the variable hour (h) take value %d',h);
            
    end
end
    
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