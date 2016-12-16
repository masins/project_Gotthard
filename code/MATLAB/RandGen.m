%
%encodes random generation of cars for every hour
%INPUT: A matrix with the number of cars for each hour (colon) and each
%       day (row)
%
%OUTPUT: A vector with 0 and 1 randomly distributed 
%corresponding to cars entering the Gotthard pass in an hour 

function Y =  RandGen(R)
Y = zeros(24*3,3600);

for d=0 : 1 :2
    for h=1:1:24
        
        %selection spot with the number of car
        tot = 3600;
        N = R(d+1,h);
        M = tot - N;

        %the vector of that hour with only 1(create car) and 0(not create)
        X = [zeros(1,M), ones(1,N)];
        
        %randomising
        X = X(randperm(tot));

        %preparing random matrix
        Y(24*d+h,:)=X;
    end
end

%Matrix in vector transformation
Y = Y';
Y= Y(:)';


end