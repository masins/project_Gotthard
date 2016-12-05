
function Y =  RandGen(R)
Y = zeros(24,3600);

for d=1 : 1 :3
    for h=1:1:24

        tot = 3600;
        N = R(d,h);
        M = tot - N;

        X = [zeros(1,M), ones(1,N)];

        X = X(randperm(tot));

        Y(24*(d-1)+h,:)=X;
    end
end


end