%test random
tot = 3600;
N = 450;
M = tot - N;

T = [zeros(1,M), ones(1,N)]; 

T = T(randperm(tot));