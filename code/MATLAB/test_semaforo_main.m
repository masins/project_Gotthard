
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

for t = 1 : 1 : 500
%Crea auto
A = CreateForward(A);
C = CreateBackward(C);

%muovi auto
A = MoveForward(A);
B = MoveForward(B);
C = MoveBackward(C);
D = MoveBackward(D);
X = MoveForward(X);
X = MoveBackward(X);

%Svuota la line centrale in automatico
if X(1,10) == 1
    B = CreateForward(B);
    X(1,10) = 0;
elseif X(1,1)==-1
    D = CreateBackward(D);
    X(1,1)=0;
end

%funzione semaforo
[A,C,X,timer] = test_semaforo(A,C,X,timer,tg,tr);

%grafici
if D(1,1)==0
    TD(1,t)=0;
elseif D(1,1)==-1
    TD(1,t) = -1;
    D(1,1)=0;
end
if B(1,50)==0
    TB(1,t)=0;
elseif B(1,50)==1
    TB(1,t) = 1;
    B(1,50)=0;
end

end