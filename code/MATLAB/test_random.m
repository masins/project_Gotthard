%test random

%prova plot

figure
subplot(2,1,1);
area (TxH);

subplot(2,1,2);
area (TxD);
%}


%provo conteggio tempo di passaggio del passo
%for fino al num,numero totali di auto che passano
%{
TxH = zeros(1, max(TH));
for i=2 : 1 : max (TH)
    TxH(1,i) = (find(TH==i,1) - find(MR1==i,1));
end
%}


%{
tot = 3600;
N = 450;
M = tot - N;

T = [zeros(1,M), ones(1,N)]; 

T = T(randperm(tot));
%}